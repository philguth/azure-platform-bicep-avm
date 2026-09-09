# landingzone

## Navigation

- [Resource Types](#resource-types)
- [Parameters](#parameters)
- [Outputs](#outputs)
- [Cross-referenced Modules](#cross-referenced-modules)

## Resource Types

| Resource Type | Existing |
| :-- | :-- |
| `Microsoft.Management/managementGroups/subscriptions@2020-05-01` | No |
| `Microsoft.Management/managementGroups@2024-02-01-preview` | No |
| `Microsoft.Subscription/aliases@2021-10-01` | No |

## Parameters

| Name | Type | Required | Description |
| :-- | :-- | :-- | :-- |
| `applicationBootstrapResourceGroupName` | `string` | No | Bootstrap resource group name in the application subscription. |
| `applicationManagementGroupName` | `string` | No | Name of the management group that will host application subscriptions. |
| `applicationResourceGroupName` | `string` | No | Platform resource group name in the application subscription. |
| `applicationSubscriptionAliasName` | `string` | No | Display name for the application subscription alias. |
| `applicationSubscriptionId` | `string` | No | Existing subscription ID to place under the application management group and deploy a representative application subscription stack into. |
| `billingScope` | `string` | Yes | The billing scope that will be used when creating subscriptions. For example: /providers/Microsoft.Billing/billingAccounts/00000000/enrollmentAccounts/00000000 |
| `bootstrapTags` | `object` | No | Tags applied to bootstrap resources in the platform subscription. |
| `environmentName` | `string` | No | Environment name used by the nested platform deployment. |
| `location` | `string` | No | Location used for resource groups and resources inside the subscriptions. |
| `namePrefix` | `string` | No | Name prefix used by the nested platform deployment. |
| `platformBootstrapResourceGroupName` | `string` | No | Bootstrap resource group name in the platform subscription. |
| `platformManagementGroupName` | `string` | No | Name of the management group that will host the platform subscription. |
| `platformResourceGroupName` | `string` | No | Platform resource group name in the platform subscription. |
| `platformSubscriptionAliasName` | `string` | No | Display name for the platform subscription alias. |
| `platformSubscriptionId` | `string` | No | Existing subscription ID to place under the platform management group and deploy the shared platform stack into. |
| `platformTags` | `object` | No | Tags applied to platform resources in the platform subscription. |
| `resourceGroupTags` | `object` | No | Tags applied to resource groups in the platform subscription. |
| `workload` | `string` | No | Workload type for the subscription aliases. |

### `applicationBootstrapResourceGroupName`

- Default value: `'rg-app-bootstrap-dev'`

### `applicationManagementGroupName`

- Default value: `'mg-apps'`

### `applicationResourceGroupName`

- Default value: `'rg-app-shared-dev'`

### `applicationSubscriptionAliasName`

- Default value: `'sub-apps-dev'`

### `applicationSubscriptionId`

- Default value: `''`

### `bootstrapTags`

- Default value:

```bicep
{
  landingZone: 'platform'
}
```

- Properties:
  - `>Any_other_property<` (`any`)

### `environmentName`

- Default value: `'dev'`

### `location`

- Default value: `deployment().location`

### `namePrefix`

- Default value: `'contoso'`

### `platformBootstrapResourceGroupName`

- Default value: `'rg-platform-bootstrap-dev'`

### `platformManagementGroupName`

- Default value: `'mg-platform'`

### `platformResourceGroupName`

- Default value: `'rg-platform-shared-dev'`

### `platformSubscriptionAliasName`

- Default value: `'sub-platform-dev'`

### `platformSubscriptionId`

- Default value: `''`

### `platformTags`

- Default value:

```bicep
{
  landingZone: 'platform'
}
```

- Properties:
  - `>Any_other_property<` (`any`)

### `resourceGroupTags`

- Default value:

```bicep
{
  workload: 'platform'
  managedBy: 'bicep'
}
```

- Properties:
  - `>Any_other_property<` (`any`)

### `workload`

- Default value: `'Production'`

- Allowed values: `DevTest`, `Production`

## Outputs

| Name | Type | Description |
| :-- | :-- | :-- |
| `applicationManagementGroupId` | `string` |  |
| `applicationSubscriptionAliasName` | `string` |  |
| `applicationSubscriptionDeploymentName` | `string` |  |
| `platformManagementGroupId` | `string` |  |
| `platformSubscriptionAliasName` | `string` |  |
| `platformSubscriptionDeploymentName` | `string` |  |

## Cross-referenced Modules

| Symbolic Name | Path | Description |
| :-- | :-- | :-- |
| `applicationSubscriptionDeployment` | `../main.bicep` |  |
| `platformSubscriptionDeployment` | `../main.bicep` |  |
