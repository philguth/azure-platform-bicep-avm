targetScope = 'resourceGroup'

param location string = resourceGroup().location
param namePrefix string = 'demo'
param tags object = {}

@description('Resource ID of the Key Vault to connect via Private Endpoint. Optional: if not provided, set keyVaultName + keyVaultResourceGroupName.')
param keyVaultResourceId string = ''

@description('Name of the Key Vault to connect via Private Endpoint (used when keyVaultResourceId is not provided).')
param keyVaultName string = ''

@description('Resource group name of the Key Vault (used when keyVaultResourceId is not provided).')
param keyVaultResourceGroupName string = ''


@description('Address space for the hub VNet')
param hubAddressSpace string = '10.10.0.0/16'

@description('Subnet for private endpoints')
param privateEndpointSubnetPrefix string = '10.10.10.0/24'

@description('Subnet placeholder for Power Platform VNet support (size later per your plan)')
param powerPlatformSubnetPrefix string = '10.10.20.0/24'

var vnetName = '${namePrefix}-hub-vnet'

// AVM VNet module (pin the version once you decide)
module vnet 'br/public:avm/res/network/virtual-network:0.7.1' = {
  name: 'hubVnet'
  params: {
    name: vnetName
    location: location
    addressPrefixes: [
      hubAddressSpace
    ]
    subnets: [
      {
        name: 'snet-private-endpoints'
        addressPrefix: privateEndpointSubnetPrefix
        // Private endpoint subnet must have network policies disabled
        privateEndpointNetworkPolicies: 'Disabled'
      }
      {
        name: 'snet-powerplatform'
        addressPrefix: powerPlatformSubnetPrefix
      }
    ]
    tags: tags
  }
}

// Private DNS zone for Key Vault private link
resource kvPrivateDns 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'privatelink.vaultcore.azure.net'
  location: 'global'
  tags: tags
}

resource kvPrivateDnsLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: kvPrivateDns
  name: '${vnetName}-link'
  location: 'global'
  properties: {
    virtualNetwork: {
      id: vnet.outputs.resourceId
    }
    registrationEnabled: false
  }
}
var kvPrivateEndpointName = '${namePrefix}-kv-pe'

var resolvedKeyVaultResourceId = !empty(keyVaultResourceId)
  ? keyVaultResourceId
  : resourceId(subscription().subscriptionId, keyVaultResourceGroupName, 'Microsoft.KeyVault/vaults', keyVaultName)

// Get the subnet ID (same VNet you created)
var peSubnetId = resourceId(
  'Microsoft.Network/virtualNetworks/subnets',
  vnetName,
  'snet-private-endpoints'
)

resource kvPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-05-01' = {
  name: kvPrivateEndpointName
  location: location
  tags: tags
  properties: {
    subnet: {
      id: peSubnetId
    }
    privateLinkServiceConnections: [
      {
        name: 'keyvault-connection'
        properties: {
          privateLinkServiceId: resolvedKeyVaultResourceId
          groupIds: [
            // Key Vault groupId
            'vault'
          ]
        }
      }
    ]
  }
}

// Attach the private endpoint to your existing Private DNS zone
resource kvPeDnsZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2023-05-01' = {
  name: 'default'
  parent: kvPrivateEndpoint
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'kv-dns'
        properties: {
          privateDnsZoneId: kvPrivateDns.id
        }
      }
    ]
  }
}
