using './main.bicep'

param namePrefix = 'philguth-dev'
param tags = {
  Project: 'AzurePlatformLearning'
  Env: 'dev'
  Owner: 'Philip'
}
param keyVaultResourceId = '/subscriptions/3ccbc197-dce8-4b23-b103-074c85029fa9/resourceGroups/rg-philguth-bootstrap-dev/providers/Microsoft.KeyVault/vaults/demo-kv-3ulptvvptoz46'


