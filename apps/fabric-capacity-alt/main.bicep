targetScope = 'resourceGroup'

@description('Azure location for the Fabric capacity.')
param location string = resourceGroup().location

@description('Name of the Fabric capacity (must be lowercase alphanumeric, starting with a letter).')
param capacityName string

@description('SKU name for the Fabric capacity (example: F2, F4, F8, etc).')
param skuName string

@description('Fabric capacity administrators (UPNs or object IDs, depending on your tenant configuration).')
param administrators array

@description('Tags applied to the Fabric capacity.')
param tags object = {}

resource capacity 'Microsoft.Fabric/capacities@2023-11-01' = {
  name: capacityName
  location: location
  tags: tags
  sku: {
    name: skuName
    tier: 'Fabric'
  }
  properties: {
    administration: {
      members: administrators
    }
  }
}

output capacityResourceId string = capacity.id
output capacityName string = capacity.name
