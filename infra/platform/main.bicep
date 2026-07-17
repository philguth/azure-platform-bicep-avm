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

var hasKeyVaultResourceId = !empty(keyVaultResourceId)
var hasKeyVaultName = !empty(keyVaultName)
var hasKeyVaultResourceGroupName = !empty(keyVaultResourceGroupName)

assert validKeyVaultReference = hasKeyVaultResourceId || (hasKeyVaultName && hasKeyVaultResourceGroupName)
assert exclusiveKeyVaultReference = !hasKeyVaultResourceId || (!hasKeyVaultName && !hasKeyVaultResourceGroupName)


@description('Address space for the hub VNet')
param hubAddressSpace string = '10.10.0.0/16'

@description('Subnet for private endpoints')
param privateEndpointSubnetPrefix string = '10.10.10.0/24'

@description('Subnet placeholder for Power Platform VNet support (size later per your plan)')
param powerPlatformSubnetPrefix string = '10.10.20.0/24'

var vnetName = '${namePrefix}-hub-vnet'

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        hubAddressSpace
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
  }
}

resource privateEndpointSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: vnet
  name: 'snet-private-endpoints'
  properties: {
    addressPrefix: privateEndpointSubnetPrefix
    // Private endpoint subnet must have network policies disabled.
    privateEndpointNetworkPolicies: 'Disabled'
  }
}

resource powerPlatformSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  parent: vnet
  name: 'snet-powerplatform'
  properties: {
    addressPrefix: powerPlatformSubnetPrefix
    privateEndpointNetworkPolicies: 'Disabled'
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
      id: vnet.id
    }
    registrationEnabled: false
  }
}
var kvPrivateEndpointName = '${namePrefix}-kv-pe'

var resolvedKeyVaultResourceId = hasKeyVaultResourceId
  ? keyVaultResourceId
  : resourceId(subscription().subscriptionId, keyVaultResourceGroupName, 'Microsoft.KeyVault/vaults', keyVaultName)

// Get the subnet ID (same VNet you created)
var peSubnetId = privateEndpointSubnet.id

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
