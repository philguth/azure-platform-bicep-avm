targetScope = 'subscription'

@description('Location for the application resource group and Fabric capacity.')
param location string = deployment().location

@description('Shared baseline values supplied by the platform deployment.')
param sharedBaseline object = {}

@description('Application resource group name.')
param appResourceGroupName string

@description('Fabric capacity name (must be lowercase alphanumeric, starting with a letter).')
param capacityName string

@description('SKU name for the Fabric capacity (example: F2, F4, F8, etc).')
param skuName string

@description('Fabric capacity administrators (UPNs or object IDs, depending on your tenant configuration).')
param administrators array

@description('Security principal IDs for the application ownership and review model.')
param securityPrincipals object = {
  identityOwnerObjectId: ''
  platformOwnerObjectId: ''
  applicationOwnerObjectId: ''
}

@description('Tags applied to the application resource group.')
param resourceGroupTags object = {}

@description('Tags applied to the Fabric capacity.')
param tags object = {}

module appOnboarding '../modules/app-vending.bicep' = {
  name: 'fabric-app-vending'
  params: {
    location: location
    sharedBaseline: sharedBaseline
    applicationName: 'fabric-capacity'
    appResourceGroupName: appResourceGroupName
    resourceGroupTags: resourceGroupTags
    appTags: tags
    securityPrincipals: securityPrincipals
  }
}

module fabric './main.bicep' = {
  name: 'fabric-capacity'
  scope: resourceGroup(appResourceGroupName)
  dependsOn: [
    appOnboarding
  ]
  params: {
    location: location
    capacityName: capacityName
    skuName: skuName
    administrators: administrators
    tags: tags
  }
}

output appResourceGroupId string = appOnboarding.outputs.appResourceGroupId
output capacityResourceId string = fabric.outputs.capacityResourceId
output capacityName string = fabric.outputs.capacityName
output applicationBaseline object = appOnboarding.outputs.applicationBaseline
output ownershipBoundary object = appOnboarding.outputs.ownershipBoundary
output appRoleAssignmentIds array = appOnboarding.outputs.appRoleAssignmentIds
