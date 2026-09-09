# infra

## Navigation

- [Resource Types](#resource-types)
- [Parameters](#parameters)
- [Outputs](#outputs)
- [Cross-referenced Modules](#cross-referenced-modules)

## Resource Types

| Resource Type | Existing |
| :-- | :-- |
| `Microsoft.Resources/resourceGroups@2024-03-01` | No |

## Parameters

| Name | Type | Required | Description |
| :-- | :-- | :-- | :-- |
| `bootstrapExistingKeyVaultResourceId` | `string` | No | Optional: resource ID of an existing Key Vault to reuse (bootstrap will skip creating a new vault). |
| `bootstrapLocation` | `string` | No | Location for the bootstrap resource group and its resources. Defaults to location. |
| `bootstrapResourceGroupName` | `string` | Yes | Bootstrap resource group name |
| `bootstrapTags` | `object` | No | Tags applied to bootstrap resources |
| `environmentName` | `string` | Yes | Environment name (e.g., dev, test, prod) |
| `hubAddressSpace` | `string` | No | Address space for the hub VNet |
| `location` | `string` | No | Location for resource groups and resources |
| `namePrefix` | `string` | Yes | Prefix for naming |
| `platformLocation` | `string` | No | Location for the platform resource group and its resources. Defaults to location. |
| `platformResourceGroupName` | `string` | Yes | Platform resource group name |
| `platformTags` | `object` | No | Tags applied to platform resources |
| `powerPlatformSubnetPrefix` | `string` | No | Subnet placeholder for Power Platform VNet support (size later per your plan) |
| `privateEndpointSubnetPrefix` | `string` | No | Subnet for private endpoints |
| `resourceGroupTags` | `object` | No | Tags applied to the resource groups |

### `bootstrapExistingKeyVaultResourceId`

- Default value: `''`

### `bootstrapLocation`

- Default value: `location`

### `bootstrapTags`

- Default value: `{}`

- Properties:
  - `>Any_other_property<` (`any`)

### `hubAddressSpace`

- Default value: `'10.10.0.0/16'`

### `location`

- Default value: `deployment().location`

### `platformLocation`

- Default value: `location`

### `platformTags`

- Default value: `{}`

- Properties:
  - `>Any_other_property<` (`any`)

### `powerPlatformSubnetPrefix`

- Default value: `'10.10.20.0/24'`

### `privateEndpointSubnetPrefix`

- Default value: `'10.10.10.0/24'`

### `resourceGroupTags`

- Default value: `{}`

- Properties:
  - `>Any_other_property<` (`any`)

## Outputs

| Name | Type | Description |
| :-- | :-- | :-- |
| `bootstrapResourceGroupId` | `string` |  |
| `keyVaultName` | `string` |  |
| `keyVaultResourceId` | `string` |  |
| `platformResourceGroupId` | `string` |  |
| `uamiPrincipalId` | `string` |  |
| `uamiResourceId` | `string` |  |

## Cross-referenced Modules

| Symbolic Name | Path | Description |
| :-- | :-- | :-- |
| `bootstrap` | `./bootstrap/main.bicep` |  |
| `platform` | `./platform/main.bicep` |  |
