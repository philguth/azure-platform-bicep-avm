targetScope = 'subscription'

@description('Location for the application resource group and Fabric capacity.')
param location string = deployment().location

@description('Application resource group name.')
param appResourceGroupName string

@description('Fabric capacity name (must be lowercase alphanumeric, starting with a letter).')
param capacityName string

@description('SKU name for the Fabric capacity (example: F2, F4, F8, etc).')
param skuName string

@description('Fabric capacity administrators (UPNs or object IDs, depending on your tenant configuration).')
param administrators array

@description('Tags applied to the application resource group.')
param resourceGroupTags object = {}

@description('Tags applied to the Fabric capacity.')
param tags object = {}

resource appRg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: appResourceGroupName
  location: location
  tags: resourceGroupTags
}

module fabric './main.bicep' = {
  name: 'fabric-capacity'
  scope: appRg
  params: {
    location: location
    capacityName: capacityName
    skuName: skuName
    administrators: administrators
    tags: tags
  }
}

output appResourceGroupId string = appRg.id
output capacityResourceId string = fabric.outputs.capacityResourceId
output capacityName string = fabric.outputs.capacityName
