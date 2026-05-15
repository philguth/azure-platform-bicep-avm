using './main.bicep'

param environmentName = 'dev'
param namePrefix = 'philguth-dev'
param location = 'northcentralus'

param bootstrapResourceGroupName = 'rg-philguth-bootstrap-dev'
param platformResourceGroupName = 'rg-philguth-platform-dev'
param appResourceGroupName = 'rg-philguth-app-dev'

param resourceGroupTags = {
  environment: 'dev'
  managedBy: 'bicep'
}

param bootstrapTags = {
  environment: 'dev'
  managedBy: 'bicep'
}

param platformTags = {
  Project: 'AzurePlatformLearning'
  Env: 'dev'
  Owner: 'Philip'
}

param appTags = {
  Project: 'AzurePlatformLearning'
  Env: 'dev'
  Owner: 'Philip'
}

// Optional: set this to reuse an existing Key Vault instead of creating one.
param bootstrapExistingKeyVaultResourceId = ''

// Fabric
// Capacity name must match: ^[a-z][a-z0-9]*$
param fabricCapacityName = 'philguthdevfabric'

// Example SKU. Adjust to what you purchased/are allowed to create.
param fabricSkuName = 'F2'

// At least one admin is required. Use a UPN (email) or objectId depending on your tenant.
param fabricAdministrators = [
  'phil@guthink.com'
]
