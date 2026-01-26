targetScope = 'resourceGroup'

@description('Location for all resources')
param location string = resourceGroup().location

@description('Environment name (e.g., dev, test, prod)')
param environmentName string

@description('Prefix for naming')
param namePrefix string = 'demo'

@description('Tags applied to resources')
param tags object = {
  Project: 'AzurePlatformLearning'
  IaC: 'Bicep-AVM'
}

var effectiveTags = union(tags, {
  environmentName: environmentName
})

var uamiName = '${namePrefix}-deploy-uami'
var kvName = toLower(replace('${namePrefix}-kv-${uniqueString(resourceGroup().id)}', '_', ''))

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: uamiName
  location: location
  tags: effectiveTags
}

// AVM Key Vault module (pick a pinned version once you choose one from the AVM index)
module kv 'br/public:avm/res/key-vault/vault:0.12.0' = {
  name: 'kv'
  params: {
    name: kvName
    location: location
    tags: effectiveTags

    // RBAC authorization (recommended over access policies for modern setups)
    enableRbacAuthorization: true

    // Soft delete & purge protection are typical "zero trust / enterprise" defaults
    enableSoftDelete: true
    enablePurgeProtection: true

    // Start conservative: deny public access can break you until private endpoints/DNS exist.
    // We'll lock this down after platform network is in place.
    publicNetworkAccess: 'Disabled'
  }
}

output uamiClientId string = uami.properties.clientId
output uamiPrincipalId string = uami.properties.principalId
output uamiResourceId string = uami.id
output keyVaultName string = kv.outputs.name
output keyVaultResourceId string = kv.outputs.resourceId
