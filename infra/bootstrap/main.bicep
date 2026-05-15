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

@description('Optional: resource ID of an existing Key Vault to reuse. When provided, this template will not create a new Key Vault.')
param existingKeyVaultResourceId string = ''

var mergedTags = union(tags, {
  Environment: environmentName
})

var uamiName = '${namePrefix}-deploy-uami'
var kvSuffix = substring(uniqueString(resourceGroup().id), 0, 6)
var kvPrefixMaxLength = 14 // 24 - length('-kv-') (4) - length(kvSuffix) (6)
var kvPrefixSanitized = toLower(replace(namePrefix, '_', ''))
var kvPrefix = length(kvPrefixSanitized) > kvPrefixMaxLength
  ? substring(kvPrefixSanitized, 0, kvPrefixMaxLength)
  : kvPrefixSanitized
var kvName = '${kvPrefix}-kv-${kvSuffix}'

var useExistingKeyVault = !empty(existingKeyVaultResourceId)

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: uamiName
  location: location
  tags: mergedTags
}

// AVM Key Vault module (pick a pinned version once you choose one from the AVM index)
module kv 'br/public:avm/res/key-vault/vault:0.12.0' = if (!useExistingKeyVault) {
  name: 'kv'
  params: {
    name: kvName
    location: location
    tags: mergedTags

    // RBAC authorization (recommended over access policies for modern setups)
    enableRbacAuthorization: true

    // Soft delete & purge protection are typical "zero trust / enterprise" defaults
    enableSoftDelete: true
    enablePurgeProtection: true

    // Start conservative: deny public access can break you until private endpoints/DNS exist.
    // We'll lock this down after platform network is in place.
    publicNetworkAccess: 'Enabled'
  }
}

output uamiClientId string = uami.properties.clientId
output uamiPrincipalId string = uami.properties.principalId
output uamiResourceId string = uami.id
output keyVaultName string = !useExistingKeyVault ? kvName : last(split(existingKeyVaultResourceId, '/'))
output keyVaultResourceId string = !useExistingKeyVault ? resourceId('Microsoft.KeyVault/vaults', kvName) : existingKeyVaultResourceId
