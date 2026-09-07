targetScope = 'resourceGroup'

@description('Ownership metadata for the shared application baseline.')
param ownership object = {}

var ownershipBoundary = union({
  identity: {
    owner: 'platform'
    minimumRoles: [
      'Key Vault Secrets User'
    ]
    escalation: 'Identity team review required for group and role changes.'
    principals: {
      ownerGroup: ''
      approverGroup: ''
    }
  }
  platform: {
    owner: 'platform'
    minimumRoles: [
      'Reader'
    ]
    escalation: 'Platform team review required for VNet, DNS, and private endpoint changes.'
    principals: {
      ownerGroup: ''
      approverGroup: ''
    }
  }
  application: {
    owner: 'application'
    minimumRoles: [
      'Contributor'
    ]
    escalation: 'Application team owns workload resources and must not alter shared foundation scope.'
    principals: {
      ownerGroup: ''
      approverGroup: ''
    }
  }
  reviewFlow: [
    'Application team prepares onboarding definition.'
    'Platform owners validate shared service usage.'
    'Identity owners validate security principal and RBAC assumptions.'
  ]
}, ownership)

output ownershipBoundary object = ownershipBoundary
