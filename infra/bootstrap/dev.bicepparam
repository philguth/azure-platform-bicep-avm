using './main.bicep'

param environmentName = 'dev'
param namePrefix = 'philguth-dev'
param location = 'northcentralus'
param tags = {
  environment: 'dev'
  managedBy: 'bicep'
}
