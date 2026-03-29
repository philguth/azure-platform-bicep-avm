using './main.bicep'

param location = 'eastus'
param namePrefix = 'philguth-dev'
param tags = {
  Project: 'AzurePlatformLearning'
  Env: 'dev'
  Owner: 'Philip'
}
// Prefer name + resource group so this file stays portable across subscriptions.
// This should match the bootstrap deployment output for the same environment.
param keyVaultName = 'philguth-dev-kv-3ulptvvptoz46'
param keyVaultResourceGroupName = 'rg-philguth-bootstrap-dev'


