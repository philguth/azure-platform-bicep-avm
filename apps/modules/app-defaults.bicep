targetScope = 'subscription'

@description('Shared baseline values supplied by the platform deployment.')
param sharedBaseline object = {}

@description('Default location when the shared baseline does not specify one.')
param location string = deployment().location

var resolvedSharedBaseline = union({
  environmentName: 'dev'
  namePrefix: 'demo'
  location: location
  bootstrapResourceGroupId: ''
  platformResourceGroupId: ''
  keyVaultResourceId: ''
  uamiResourceId: ''
  uamiPrincipalId: ''
  tags: {}
}, sharedBaseline)

output sharedBaseline object = resolvedSharedBaseline
