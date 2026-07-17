targetScope = 'tenant'

@description('The billing scope that will be used when creating subscriptions. For example: /providers/Microsoft.Billing/billingAccounts/00000000/enrollmentAccounts/00000000')
param billingScope string

@description('Name of the management group that will host the platform subscription.')
param platformManagementGroupName string = 'mg-platform'

@description('Name of the management group that will host application subscriptions.')
param applicationManagementGroupName string = 'mg-apps'

@description('Workload type for the subscription aliases.')
@allowed([
  'Production'
  'DevTest'
])
param workload string = 'Production'

@description('Display name for the platform subscription alias.')
param platformSubscriptionAliasName string = 'sub-platform-dev'

@description('Display name for the application subscription alias.')
param applicationSubscriptionAliasName string = 'sub-apps-dev'

@description('Existing subscription ID to place under the platform management group and deploy the shared platform stack into.')
param platformSubscriptionId string = ''

@description('Existing subscription ID to place under the application management group and deploy a representative application subscription stack into.')
param applicationSubscriptionId string = ''

@description('Environment name used by the nested platform deployment.')
param environmentName string = 'dev'

@description('Name prefix used by the nested platform deployment.')
param namePrefix string = 'contoso'

@description('Location used for resource groups and resources inside the subscriptions.')
param location string = deployment().location

@description('Bootstrap resource group name in the platform subscription.')
param platformBootstrapResourceGroupName string = 'rg-platform-bootstrap-dev'

@description('Platform resource group name in the platform subscription.')
param platformResourceGroupName string = 'rg-platform-shared-dev'

@description('Bootstrap resource group name in the application subscription.')
param applicationBootstrapResourceGroupName string = 'rg-app-bootstrap-dev'

@description('Platform resource group name in the application subscription.')
param applicationResourceGroupName string = 'rg-app-shared-dev'

@description('Tags applied to resource groups in the platform subscription.')
param resourceGroupTags object = {
  workload: 'platform'
  managedBy: 'bicep'
}

@description('Tags applied to bootstrap resources in the platform subscription.')
param bootstrapTags object = {
  landingZone: 'platform'
}

@description('Tags applied to platform resources in the platform subscription.')
param platformTags object = {
  landingZone: 'platform'
}

resource platformManagementGroup 'Microsoft.Management/managementGroups@2024-02-01-preview' = {
  scope: tenant()
  name: platformManagementGroupName
  properties: {
    displayName: platformManagementGroupName
  }
}

resource applicationManagementGroup 'Microsoft.Management/managementGroups@2024-02-01-preview' = {
  scope: tenant()
  name: applicationManagementGroupName
  properties: {
    displayName: applicationManagementGroupName
  }
}

resource platformSubscriptionAlias 'Microsoft.Subscription/aliases@2021-10-01' = {
  scope: tenant()
  name: platformSubscriptionAliasName
  properties: {
    workload: workload
    displayName: platformSubscriptionAliasName
    billingScope: billingScope
  }
}

resource applicationSubscriptionAlias 'Microsoft.Subscription/aliases@2021-10-01' = {
  scope: tenant()
  name: applicationSubscriptionAliasName
  properties: {
    workload: workload
    displayName: applicationSubscriptionAliasName
    billingScope: billingScope
  }
}

resource platformSubscriptionPlacement 'Microsoft.Management/managementGroups/subscriptions@2020-05-01' = if (!empty(platformSubscriptionId)) {
  parent: platformManagementGroup
  name: platformSubscriptionId
}

resource applicationSubscriptionPlacement 'Microsoft.Management/managementGroups/subscriptions@2020-05-01' = if (!empty(applicationSubscriptionId)) {
  parent: applicationManagementGroup
  name: applicationSubscriptionId
}

module platformSubscriptionDeployment '../main.bicep' = if (!empty(platformSubscriptionId)) {
  name: 'platform-subscription-${environmentName}'
  scope: subscription(platformSubscriptionId)
  params: {
    environmentName: environmentName
    namePrefix: namePrefix
    location: location
    bootstrapResourceGroupName: platformBootstrapResourceGroupName
    platformResourceGroupName: platformResourceGroupName
    resourceGroupTags: union(resourceGroupTags, {
      landingZone: 'platform'
      managementGroup: platformManagementGroupName
    })
    bootstrapTags: union(bootstrapTags, {
      landingZone: 'platform'
      managementGroup: platformManagementGroupName
      subscriptionAlias: platformSubscriptionAliasName
    })
    platformTags: union(platformTags, {
      landingZone: 'platform'
      managementGroup: platformManagementGroupName
      subscriptionAlias: platformSubscriptionAliasName
    })
  }
}

module applicationSubscriptionDeployment '../main.bicep' = if (!empty(applicationSubscriptionId)) {
  name: 'application-subscription-${environmentName}'
  scope: subscription(applicationSubscriptionId)
  params: {
    environmentName: environmentName
    namePrefix: namePrefix
    location: location
    bootstrapResourceGroupName: applicationBootstrapResourceGroupName
    platformResourceGroupName: applicationResourceGroupName
    resourceGroupTags: union(resourceGroupTags, {
      landingZone: 'application'
      managementGroup: applicationManagementGroupName
    })
    bootstrapTags: union(bootstrapTags, {
      landingZone: 'application'
      managementGroup: applicationManagementGroupName
      subscriptionAlias: applicationSubscriptionAliasName
    })
    platformTags: union(platformTags, {
      landingZone: 'application'
      managementGroup: applicationManagementGroupName
      subscriptionAlias: applicationSubscriptionAliasName
    })
  }
}

output platformManagementGroupId string = platformManagementGroup.name
output applicationManagementGroupId string = applicationManagementGroup.name
output platformSubscriptionAliasName string = platformSubscriptionAlias.name
output applicationSubscriptionAliasName string = applicationSubscriptionAlias.name
output platformSubscriptionDeploymentName string = empty(platformSubscriptionId) ? 'not-deployed' : platformSubscriptionDeployment.name
output applicationSubscriptionDeploymentName string = empty(applicationSubscriptionId) ? 'not-deployed' : applicationSubscriptionDeployment.name
