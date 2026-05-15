targetScope = 'subscription'

@description('Location for resource groups and resources.')
param location string = deployment().location

@description('Environment name (e.g., dev, test, prod).')
param environmentName string

@description('Prefix for naming.')
param namePrefix string

@description('Bootstrap resource group name.')
param bootstrapResourceGroupName string

@description('Platform resource group name.')
param platformResourceGroupName string

@description('App resource group name (where app-specific resources like Fabric capacity live).')
param appResourceGroupName string

@description('Tags applied to the resource groups.')
param resourceGroupTags object = {}

@description('Tags applied to bootstrap resources.')
param bootstrapTags object = {}

@description('Optional: resource ID of an existing Key Vault to reuse (bootstrap will skip creating a new vault).')
param bootstrapExistingKeyVaultResourceId string = ''

@description('Tags applied to platform resources.')
param platformTags object = {}

@description('Tags applied to app resources.')
param appTags object = {}

@description('Address space for the hub VNet.')
param hubAddressSpace string = '10.10.0.0/16'

@description('Subnet for private endpoints.')
param privateEndpointSubnetPrefix string = '10.10.10.0/24'

@description('Subnet placeholder for Power Platform VNet support (size later per your plan).')
param powerPlatformSubnetPrefix string = '10.10.20.0/24'

@description('Fabric capacity name (must be lowercase alphanumeric, starting with a letter).')
param fabricCapacityName string

@description('Fabric capacity SKU name (example: F2, F4, F8, etc).')
param fabricSkuName string

@description('Fabric capacity administrators (UPNs or object IDs, depending on your tenant configuration).')
param fabricAdministrators array

module infra '../infra/main.bicep' = {
  name: 'infra-${environmentName}'
  params: {
    location: location
    environmentName: environmentName
    namePrefix: namePrefix
    bootstrapResourceGroupName: bootstrapResourceGroupName
    platformResourceGroupName: platformResourceGroupName
    resourceGroupTags: resourceGroupTags
    bootstrapTags: bootstrapTags
    bootstrapExistingKeyVaultResourceId: bootstrapExistingKeyVaultResourceId
    platformTags: platformTags
    hubAddressSpace: hubAddressSpace
    privateEndpointSubnetPrefix: privateEndpointSubnetPrefix
    powerPlatformSubnetPrefix: powerPlatformSubnetPrefix
  }
}

module fabricCapacity '../apps/fabric-capacity/vend.bicep' = {
  name: 'app-fabric-capacity-${environmentName}'
  dependsOn: [
    infra
  ]
  params: {
    location: location
    appResourceGroupName: appResourceGroupName
    capacityName: fabricCapacityName
    skuName: fabricSkuName
    administrators: fabricAdministrators
    resourceGroupTags: resourceGroupTags
    tags: appTags
  }
}

output bootstrapResourceGroupId string = infra.outputs.bootstrapResourceGroupId
output platformResourceGroupId string = infra.outputs.platformResourceGroupId
output keyVaultResourceId string = infra.outputs.keyVaultResourceId
output appResourceGroupId string = fabricCapacity.outputs.appResourceGroupId
output fabricCapacityResourceId string = fabricCapacity.outputs.capacityResourceId
