using './main.bicep'

param environmentName = 'dev'
param location = 'eastus'
param namePrefix = 'philguth-dev'
param tags = {
  ProjectCode: 'POC'
  Purpose: 'learning'
  RunId: 'run-001'
  Owner: 'Philip'
  Env: 'dev'
  managedBy: 'bicep'
}
