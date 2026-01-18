using './main.bicep'

param namePrefix = 'philguth-dev'
param tags = {
  Project: 'AzurePlatformLearning'
  Env: 'dev'
  Owner: 'Philip'
}
// Prefer name + resource group so this file stays portable across subscriptions.
param keyVaultName = 'demo-kv-3ulptvvptoz46'
param keyVaultResourceGroupName = 'rg-philguth-bootstrap-dev'


