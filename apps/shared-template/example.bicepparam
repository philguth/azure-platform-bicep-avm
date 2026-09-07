using '../fabric-capacity/vend.bicep'

param location = 'northcentralus'

param sharedBaseline = {
  environmentName: 'dev'
  namePrefix: 'sample'
  location: 'northcentralus'
  bootstrapResourceGroupId: '/subscriptions/<subscription-id>/resourceGroups/rg-sample-bootstrap-dev'
  platformResourceGroupId: '/subscriptions/<subscription-id>/resourceGroups/rg-sample-platform-dev'
  keyVaultResourceId: '/subscriptions/<subscription-id>/resourceGroups/rg-sample-bootstrap-dev/providers/Microsoft.KeyVault/vaults/<key-vault-name>'
  uamiResourceId: '/subscriptions/<subscription-id>/resourceGroups/rg-sample-bootstrap-dev/providers/Microsoft.ManagedIdentity/userAssignedIdentities/<managed-identity-name>'
  uamiPrincipalId: '<managed-identity-principal-id>'
  tags: {
    Project: 'AzurePlatformLearning'
    Environment: 'dev'
  }
}

param appResourceGroupName = 'rg-sample-fabric-dev'
param capacityName = 'samplefabricdev'
param skuName = 'F2'
param administrators = [
  'owner@example.com'
]

param securityPrincipals = {
  identityOwnerObjectId: ''
  platformOwnerObjectId: ''
  applicationOwnerObjectId: ''
}

param resourceGroupTags = {
  Project: 'AzurePlatformLearning'
  Environment: 'dev'
  Owner: 'application-team'
  ManagedBy: 'bicep'
}

param tags = {
  Project: 'AzurePlatformLearning'
  Environment: 'dev'
  Owner: 'application-team'
  ManagedBy: 'bicep'
}