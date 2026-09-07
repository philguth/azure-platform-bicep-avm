targetScope = 'subscription'

@description('Azure region for the application deployment.')
param location string = deployment().location

@description('Shared platform baseline consumed by the application recipe.')
param sharedBaseline object = {}

@description('Application resource group name for recipe-owned resources.')
param appResourceGroupName string = 'rg-app-dev'

@description('Application workload name.')
param appName string = 'sample-app'

@description('Recipe-owned tags applied to the app resource group and workload resources.')
param tags object = {
  Environment: 'dev'
  ManagedBy: 'azd'
}

@description('Security principal IDs for application, platform, and identity ownership review.')
param securityPrincipals object = {
  identityOwnerObjectId: ''
  platformOwnerObjectId: ''
  applicationOwnerObjectId: ''
}

resource appResourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: appResourceGroupName
  location: location
  tags: tags
}

output appResourceGroupId string = appResourceGroup.id
output appName string = appName
output sharedBaseline object = sharedBaseline
output securityPrincipals object = securityPrincipals
