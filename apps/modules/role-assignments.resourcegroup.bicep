targetScope = 'resourceGroup'

@description('Object ID of the Microsoft Entra principal receiving the role assignment.')
param principalId string

@description('Microsoft Entra principal type.')
@allowed([
  'Group'
  'ServicePrincipal'
  'User'
])
param principalType string = 'Group'

@description('Built-in or custom role definition GUID.')
param roleDefinitionId string

resource assignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, principalId, roleDefinitionId)
  properties: {
    principalId: principalId
    principalType: principalType
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
  }
}

output roleAssignmentId string = assignment.id
