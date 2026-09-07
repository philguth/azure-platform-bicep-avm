targetScope = 'subscription'

@description('Role assignments created at the target subscription scope.')
param subscriptionRoleAssignments array = []

@description('Role assignments created at named resource group scopes in the target subscription.')
param resourceGroupRoleAssignments array = []

resource subscriptionAssignments 'Microsoft.Authorization/roleAssignments@2022-04-01' = [for assignment in subscriptionRoleAssignments: {
  name: guid(subscription().id, assignment.principalId, assignment.roleDefinitionId)
  properties: {
    principalId: assignment.principalId
    principalType: assignment.?principalType ?? 'Group'
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', assignment.roleDefinitionId)
  }
}]

module resourceGroupAssignments './role-assignments.resourcegroup.bicep' = [for assignment in resourceGroupRoleAssignments: {
  name: 'resource-group-role-assignment-${uniqueString(assignment.resourceGroupName, assignment.principalId, assignment.roleDefinitionId)}'
  scope: resourceGroup(assignment.resourceGroupName)
  params: {
    principalId: assignment.principalId
    principalType: assignment.?principalType ?? 'Group'
    roleDefinitionId: assignment.roleDefinitionId
  }
}]

output subscriptionRoleAssignmentIds array = [for (assignment, index) in subscriptionRoleAssignments: subscriptionAssignments[index].id]
output resourceGroupRoleAssignmentIds array = [for (assignment, index) in resourceGroupRoleAssignments: resourceGroupAssignments[index].outputs.roleAssignmentId]

