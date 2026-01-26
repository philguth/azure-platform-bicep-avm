using './main.bicep'

param namePrefix = 'philguth-dev'
param tags = {
  ProjectCode: 'POC'
  Purpose: 'learning'
  RunId: 'run-001'
  Owner: 'Philip'
  Env: 'dev'
  Project: 'AzurePlatformLearning'
}
// Prefer name + resource group so this file stays portable across subscriptions.
param keyVaultName = 'demo-kv-3ulptvvptoz46'
param keyVaultResourceGroupName = 'rg-philguth-bootstrap-dev'


