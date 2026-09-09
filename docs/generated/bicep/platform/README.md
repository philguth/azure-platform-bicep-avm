# platform

## Navigation

- [Resource Types](#resource-types)
- [Parameters](#parameters)
- [Outputs](#outputs)

## Resource Types

| Resource Type | Existing |
| :-- | :-- |
| `Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01` | No |
| `Microsoft.Network/privateDnsZones@2020-06-01` | No |
| `Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2023-05-01` | No |
| `Microsoft.Network/privateEndpoints@2023-05-01` | No |
| `Microsoft.Network/virtualNetworks/subnets@2024-05-01` | No |
| `Microsoft.Network/virtualNetworks@2024-05-01` | No |

## Parameters

| Name | Type | Required | Description |
| :-- | :-- | :-- | :-- |
| `hubAddressSpace` | `string` | No | Address space for the hub VNet |
| `keyVaultName` | `string` | No | Name of the Key Vault to connect via Private Endpoint (used when keyVaultResourceId is not provided). |
| `keyVaultResourceGroupName` | `string` | No | Resource group name of the Key Vault (used when keyVaultResourceId is not provided). |
| `keyVaultResourceId` | `string` | No | Resource ID of the Key Vault to connect via Private Endpoint. Optional: if not provided, set keyVaultName + keyVaultResourceGroupName. |
| `location` | `string` | No |  |
| `namePrefix` | `string` | No |  |
| `powerPlatformSubnetPrefix` | `string` | No | Subnet placeholder for Power Platform VNet support (size later per your plan) |
| `privateEndpointSubnetPrefix` | `string` | No | Subnet for private endpoints |
| `tags` | `object` | No |  |

### `hubAddressSpace`

- Default value: `'10.10.0.0/16'`

### `keyVaultName`

- Default value: `''`

### `keyVaultResourceGroupName`

- Default value: `''`

### `keyVaultResourceId`

- Default value: `''`

### `location`

- Default value: `resourceGroup().location`

### `namePrefix`

- Default value: `'demo'`

### `powerPlatformSubnetPrefix`

- Default value: `'10.10.20.0/24'`

### `privateEndpointSubnetPrefix`

- Default value: `'10.10.10.0/24'`

### `tags`

- Default value: `{}`

- Properties:
  - `>Any_other_property<` (`any`)

## Outputs

_No outputs are declared in this module._
