targetScope = 'subscription'

@description('Location for resource groups and resources')
param location string = deployment().location

@description('Location for the bootstrap resource group and its resources. Defaults to location.')
param bootstrapLocation string = location

@description('Location for the platform resource group and its resources. Defaults to location.')
param platformLocation string = location

@description('Environment name (e.g., dev, test, prod)')
param environmentName string

@description('Prefix for naming')
param namePrefix string

@description('Bootstrap resource group name')
param bootstrapResourceGroupName string

@description('Platform resource group name')
param platformResourceGroupName string

@description('Tags applied to the resource groups')
param resourceGroupTags object = {}

@description('Tags applied to bootstrap resources')
param bootstrapTags object = {}

@description('Optional: resource ID of an existing Key Vault to reuse (bootstrap will skip creating a new vault).')
param bootstrapExistingKeyVaultResourceId string = ''

@description('Tags applied to platform resources')
param platformTags object = {}

@description('Address space for the hub VNet')
param hubAddressSpace string = '10.10.0.0/16'

@description('Subnet for private endpoints')
param privateEndpointSubnetPrefix string = '10.10.10.0/24'

@description('Subnet placeholder for Power Platform VNet support (size later per your plan)')
param powerPlatformSubnetPrefix string = '10.10.20.0/24'

resource bootstrapResourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: bootstrapResourceGroupName
  location: bootstrapLocation
  tags: resourceGroupTags
}

resource platformResourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: platformResourceGroupName
  location: platformLocation
  tags: resourceGroupTags
}

module bootstrap './bootstrap/main.bicep' = {
  name: 'bootstrap-${environmentName}'
  scope: bootstrapResourceGroup
  params: {
    environmentName: environmentName
    location: bootstrapLocation
    namePrefix: namePrefix
    tags: bootstrapTags
    existingKeyVaultResourceId: bootstrapExistingKeyVaultResourceId
  }
}

module platform './platform/main.bicep' = {
  name: 'platform-${environmentName}'
  scope: platformResourceGroup
  params: {
    location: platformLocation
    namePrefix: namePrefix
    tags: platformTags
    keyVaultResourceId: bootstrap.outputs.keyVaultResourceId
    hubAddressSpace: hubAddressSpace
    privateEndpointSubnetPrefix: privateEndpointSubnetPrefix
    powerPlatformSubnetPrefix: powerPlatformSubnetPrefix
  }
}

output bootstrapResourceGroupId string = bootstrapResourceGroup.id
output platformResourceGroupId string = platformResourceGroup.id
output keyVaultName string = bootstrap.outputs.keyVaultName
output keyVaultResourceId string = bootstrap.outputs.keyVaultResourceId
output uamiResourceId string = bootstrap.outputs.uamiResourceId
