targetScope = 'resourceGroup'

@description('Shared platform baseline values passed into the application onboarding layer.')
param sharedBaseline object = {}

@description('Application-specific settings that belong to the workload.')
param appSettings object = {}

var resolvedBaseline = union({
  environmentName: 'dev'
  namePrefix: 'demo'
  location: resourceGroup().location
  bootstrapResourceGroupId: ''
  platformResourceGroupId: ''
  keyVaultResourceId: ''
  uamiResourceId: ''
  uamiPrincipalId: ''
  tags: {}
}, sharedBaseline)

var resolvedAppSettings = union({
  applicationName: 'app'
  owner: 'application-team'
  deploymentScope: 'resource-group'
  engagementMode: 'provider-poc'
  tags: {}
  securityPrincipals: {
    identityOwnerObjectId: ''
    platformOwnerObjectId: ''
    applicationOwnerObjectId: ''
  }
  roleAssignments: []
}, appSettings)

var approvedCapabilities = [
  'shared-platform'
  'managed-identity'
  'key-vault'
  'private-networking'
  'observability'
  'tagging'
  'rbac'
]

var requiredInputs = [
  'location'
  'environmentName'
  'namePrefix'
  'appResourceGroupName'
  'keyVaultResourceId'
  'platformResourceGroupId'
  'uamiPrincipalId'
  'securityPrincipals'
]

var rbacModel = {
  sharedFoundation: {
    identityOwner: 'platform'
    minimumRoles: [
      'Key Vault Secrets User'
    ]
    scope: 'resourceGroup'
  }
  platform: {
    identityOwner: 'platform'
    minimumRoles: [
      'Reader'
    ]
    scope: 'resourceGroup'
  }
  application: {
    identityOwner: 'application'
    minimumRoles: [
      'Contributor'
    ]
    scope: 'resourceGroup'
  }
}

output contract object = {
  applicationName: resolvedAppSettings.applicationName
  environmentName: resolvedBaseline.environmentName
  location: resolvedBaseline.location
  namePrefix: resolvedBaseline.namePrefix
  deploymentScope: resolvedAppSettings.deploymentScope
  engagementMode: resolvedAppSettings.engagementMode
  sharedBaseline: resolvedBaseline
  appSettings: resolvedAppSettings
  approvedCapabilities: approvedCapabilities
  requiredInputs: requiredInputs
  rbacModel: rbacModel
  reviewRules: {
    identityOwnership: 'Platform-owned shared identity and RBAC decisions must be reviewed with the shared foundation owners.'
    platformOwnership: 'Shared network, Key Vault, and private-link changes remain platform-owned and must not be embedded in app deployments.'
    applicationOwnership: 'Application-owned resources remain in the app deployment unit and must not change platform ownership boundaries.'
    escalation: 'Any change outside approvedCapabilities requires a platform or identity review before deployment.'
    securityPrincipals: 'application, platform, and identity owner object IDs must be supplied when RBAC is required for the targeted scope.'
  }
}
