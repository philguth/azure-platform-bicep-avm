# bootstrap

## Navigation

- [Resource Types](#resource-types)
- [Parameters](#parameters)
- [Outputs](#outputs)
- [Cross-referenced Modules](#cross-referenced-modules)

## Resource Types

| Resource Type | Existing |
| :-- | :-- |
| `Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31` | No |

## Parameters

| Name | Type | Required | Description |
| :-- | :-- | :-- | :-- |
| `environmentName` | `string` | Yes | Environment name (e.g., dev, test, prod) |
| `existingKeyVaultResourceId` | `string` | No | Optional: resource ID of an existing Key Vault to reuse. When provided, this template will not create a new Key Vault. |
| `location` | `string` | No | Location for all resources |
| `namePrefix` | `string` | No | Prefix for naming |
| `tags` | `object` | No | Tags applied to resources |

### `existingKeyVaultResourceId`

- Default value: `''`

### `location`

- Default value: `resourceGroup().location`

### `namePrefix`

- Default value: `'demo'`

### `tags`

- Default value:

```bicep
{
  Project: 'AzurePlatformLearning'
  IaC: 'Bicep-AVM'
}
```

- Properties:
  - `>Any_other_property<` (`any`)

## Outputs

| Name | Type | Description |
| :-- | :-- | :-- |
| `keyVaultName` | `string` |  |
| `keyVaultResourceId` | `string` |  |
| `uamiClientId` | `string` |  |
| `uamiPrincipalId` | `string` |  |
| `uamiResourceId` | `string` |  |

## Cross-referenced Modules

| Symbolic Name | Path | Description |
| :-- | :-- | :-- |
| `kv` | `br/public:avm/res/key-vault/vault:0.12.0` | This module deploys a Key Vault. |
