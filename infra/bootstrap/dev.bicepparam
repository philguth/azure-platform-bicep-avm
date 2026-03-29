using './main.bicep'

param environmentName = 'dev'
param namePrefix = 'philguth-dev'
param location = 'eastus'
param tags = {
  environment: 'dev'
  managedBy: 'bicep'
}
