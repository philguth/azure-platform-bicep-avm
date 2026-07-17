using './main.bicep'

param billingScope = '/providers/Microsoft.Billing/billingAccounts/00000000/enrollmentAccounts/00000000'
param platformManagementGroupName = 'mg-platform'
param applicationManagementGroupName = 'mg-apps'
param workload = 'Production'
param platformSubscriptionAliasName = 'sub-platform-dev'
param applicationSubscriptionAliasName = 'sub-apps-dev'
param environmentName = 'dev'
param namePrefix = 'contoso'
param location = 'eastus'
param platformBootstrapResourceGroupName = 'rg-platform-bootstrap-dev'
param platformResourceGroupName = 'rg-platform-shared-dev'
param applicationBootstrapResourceGroupName = 'rg-app-bootstrap-dev'
param applicationResourceGroupName = 'rg-app-shared-dev'

// Leave these empty when you only want to create the aliases and management groups.
// Populate them with real subscription IDs when you want the nested subscription deployments to run.
param platformSubscriptionId = ''
param applicationSubscriptionId = ''
