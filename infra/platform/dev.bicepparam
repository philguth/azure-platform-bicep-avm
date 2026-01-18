using './main.bicep'

param namePrefix = 'philguth-dev'
param tags = {
  Project: 'AzurePlatformLearning'
  Env: 'dev'
  Owner: 'Philip'
}
param keyVaultResourceId = 'https://demo-kv-3ulptvvptoz46.vault.azure.net/'


