targetScope = 'resourceGroup'

param location string = resourceGroup().location
param namePrefix string = 'demo'
param tags object = {}

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
  dependsOn: [
    vnet
  ]
}
