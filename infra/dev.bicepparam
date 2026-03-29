using './main.bicep'

param environmentName = 'dev'
param namePrefix = 'philguth-dev'
param location = 'eastus'

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

param platformTags = {
  Project: 'AzurePlatformLearning'
  Env: 'dev'
  Owner: 'Philip'
}