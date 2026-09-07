targetScope = 'subscription'

@description('Location for the application resource group and workload.')
param location string = deployment().location

@description('Shared platform baseline passed in from the parent deployment.')
param sharedBaseline object = {}

@description('Name of the application with a clear platform/application ownership boundary.')
param applicationName string = 'app'

@description('Application resource group name.')
param appResourceGroupName string

@description('Tags applied to the app resource group.')
param resourceGroupTags object = {}

@description('Tags applied to the workload.')
param appTags object = {}

@description('Security principal identifiers required for ownership and RBAC review in this app.')
param securityPrincipals object = {
  identityOwnerObjectId: ''
  platformOwnerObjectId: ''
  applicationOwnerObjectId: ''
}

module appDefaults './app-defaults.bicep' = {
  name: 'app-defaults-${applicationName}'
  params: {
    sharedBaseline: sharedBaseline
    location: location
  }
}

var normalizedSharedBaseline = appDefaults.outputs.sharedBaseline

resource appRg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: appResourceGroupName
  location: location
  tags: resourceGroupTags
}

module baselineContract '../contracts/application-baseline.bicep' = {
  name: 'baseline-contract-${applicationName}'
  scope: appRg
  params: {
    sharedBaseline: normalizedSharedBaseline
    appSettings: {
      applicationName: applicationName
      deploymentScope: 'subscription'
      engagementMode: 'provider-poc'
      tags: appTags
      securityPrincipals: securityPrincipals
      roleAssignments: [
        {
          scopeType: 'resourceGroup'
          resourceGroupName: appResourceGroupName
          principalId: securityPrincipals.applicationOwnerObjectId
          roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
        }
      ]
    }
  }
}

module ownershipContract '../contracts/ownership-boundaries.bicep' = {
  name: 'ownership-contract-${applicationName}'
  scope: appRg
  params: {
    ownership: {
      application: {
        owner: applicationName
      }
    }
  }
}

output appResourceGroupId string = appRg.id
output applicationBaseline object = baselineContract.outputs.contract
output ownershipBoundary object = ownershipContract.outputs.ownershipBoundary
output deploymentScope string = 'subscription'
output sharedBaseline object = normalizedSharedBaseline
