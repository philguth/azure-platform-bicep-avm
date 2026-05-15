using './main.bicep'

param environmentName = 'dev'
param namePrefix = 'philguth-dev'
param location = 'northcentralus'

param bootstrapResourceGroupName = 'rg-philguth-bootstrap-dev'
param platformResourceGroupName = 'rg-philguth-platform-dev'

param resourceGroupTags = {
  environment: 'dev'
  managedBy: 'bicep'
}

param bootstrapTags = {
  environment: 'dev'
  managedBy: 'bicep'
}

// Optional: set this to reuse an existing Key Vault instead of creating one.
// Example (get it via: az keyvault show -n <kvName> -g <kvRg> --query id -o tsv)
param bootstrapExistingKeyVaultResourceId = ''

param platformTags = {
  Project: 'AzurePlatformLearning'
  Env: 'dev'
  Owner: 'Philip'
}
