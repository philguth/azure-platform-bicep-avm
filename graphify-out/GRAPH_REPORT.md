# Graph Report - azure-platform-bicep-avm  (2026-09-02)

## Corpus Check
- 51 files · ~80,179 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 1133 nodes · 1332 edges · 111 communities
- Extraction: 98% EXTRACTED · 2% INFERRED · 0% AMBIGUOUS · INFERRED: 27 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `7006e49a`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- variables
- infra/main.json
- common.sh
- parameters
- template
- builtInRoleNames
- landingzone/main.json
- parameters
- tags
- outputs
- Feature Specification: Standardized Application Onboarding
- parameters
- platform/main.json
- parameters
- variables
- Extension Hook Lifecycle
- parameters
- parameters
- kvPrivateEndpoint
- bootstrapTags
- vnet
- parameters
- parameters
- outputs
- kvPrivateDnsLink
- parameters
- bootstrap
- kvPrivateEndpoint
- kvPrivateDnsLink
- Landing-Zone Layered Baseline
- keyVault_privateEndpoints
- publicNetworkAccess
- Implementation Plan: Multi-Application Baseline Consumption
- powerPlatformSubnet
- powerPlatformSubnet
- resources
- keyVault_accessPolicies
- keyVault
- keyVault_diagnosticSettings
- keyVault_keys
- keyVault_lock
- keyVault_roleAssignments
- keyVault_secrets
- sku
- properties
- applicationSubscriptionDeployment
- applicationSubscriptionPlacement
- resourceGroupTags
- workload
- platformSubscriptionDeployment
- platformSubscriptionPlacement
- vnet
- Contract: Application Baseline Consumption
- resources
- name
- Tasks: Multi-Application Baseline Consumption
- Research: Multi-Application Baseline Consumption
- kv
- resources
- kvPrivateDns
- uami
- kvPrivateDns
- definitions
- accessPolicies
- diagnosticSettings
- enableRbacAuthorization
- enableSoftDelete
- keyVault
- roleAssignments
- resources
- environmentName
- location
- namePrefix
- platformResourceGroupName
- Data Model: Multi-Application Baseline Consumption
- existingKeyVaultResourceId
- hubAddressSpace
- location
- namePrefix
- powerPlatformSubnetPrefix
- privateEndpointSubnetPrefix
- tags
- privateEndpointSubnet
- _1.privateEndpointCustomDnsConfigType
- _1.privateEndpointIpConfigurationType
- accessPolicyType
- credentialOutputType
- diagnosticSettingFullType
- keyType
- lockType
- privateEndpointOutputType
- privateEndpointSingleServiceType
- roleAssignmentType
- rotationPolicyType
- secretType
- enableVaultForDeployment
- enableVaultForDiskEncryption
- enableVaultForTemplateDeployment
- lock
- networkAcls
- softDeleteRetentionInDays
- applicationManagementGroup
- applicationManagementGroupName
- applicationBootstrapResourceGroupName
- bootstrapLocation
- platformManagementGroup
- platformSubscriptionAlias
- bootstrapExistingKeyVaultResourceId
- platformLocation
- vnet
- privateEndpointSubnet

## God Nodes (most connected - your core abstractions)
1. `parameters` - 23 edges
2. `parameters` - 19 edges
3. `variables` - 16 edges
4. `builtInRoleNames` - 16 edges
5. `parameters` - 15 edges
6. `parameters` - 15 edges
7. `definitions` - 14 edges
8. `parameters` - 12 edges
9. `Tasks: Multi-Application Baseline Consumption` - 12 edges
10. `parameters` - 11 edges

## Surprising Connections (you probably didn't know these)
- `Feature Specification Template` --semantically_similar_to--> `Feature Specification: Standardized Application Onboarding`  [INFERRED] [semantically similar]
  .specify/templates/spec-template.md → specs/001-standardize-app-onboarding/spec.md
- `Checklist Template` --semantically_similar_to--> `Specification Quality Checklist: Standardized Application Onboarding`  [INFERRED] [semantically similar]
  .specify/templates/checklist-template.md → specs/001-standardize-app-onboarding/checklists/requirements.md
- `Application Onboarding Phase` --conceptually_related_to--> `Feature Specification: Standardized Application Onboarding`  [INFERRED]
  infra/README.md → specs/001-standardize-app-onboarding/spec.md
- `Application-Focused Landing-Zone Baseline` --conceptually_related_to--> `Layered Landing-Zone Architecture`  [INFERRED]
  README.md → .specify/memory/constitution.md
- `Feature Specification: Standardized Application Onboarding` --conceptually_related_to--> `Application-Focused Landing-Zone Baseline`  [INFERRED]
  specs/001-standardize-app-onboarding/spec.md → README.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Infrastructure Phase Sequence** — infra_readme_landing_zone_phase, infra_readme_subscription_orchestration_phase, infra_readme_bootstrap_phase, infra_readme_platform_phase, infra_readme_application_onboarding_phase [EXTRACTED 1.00]
- **Standardized Onboarding Review Artifacts** — specs_001_standardize_app_onboarding_spec_onboarding_request, specs_001_standardize_app_onboarding_spec_baseline_alignment_result, specs_001_standardize_app_onboarding_spec_review_summary [EXTRACTED 1.00]
- **Speckit Artifact Generation Flow** — specify_workflows_speckit_workflow_document, specify_templates_spec_template_document, specify_templates_plan_template_document, specify_templates_tasks_template_document, specify_templates_checklist_template_document [INFERRED 0.75]

## Communities (111 total, 0 thin omitted)

### Community 0 - "variables"
Cohesion: 0.04
Nodes (48): contentVersion, name, templateHash, version, Asserts, type, value, type (+40 more)

### Community 1 - "infra/main.json"
Cohesion: 0.05
Nodes (40): apiVersion, dependsOn, name, resourceGroup, type, apiVersion, location, name (+32 more)

### Community 2 - "common.sh"
Cohesion: 0.13
Nodes (29): check-prerequisites.sh script, check_dir(), check_file(), find_specify_root(), format_speckit_command(), get_current_branch(), get_feature_paths(), get_invoke_separator() (+21 more)

### Community 3 - "parameters"
Cohesion: 0.07
Nodes (35): defaultValue, metadata, type, defaultValue, metadata, type, defaultValue, metadata (+27 more)

### Community 4 - "template"
Cohesion: 0.06
Nodes (40): copy, items, metadata, nullable, type, name, keys, privateEndpoints (+32 more)

### Community 5 - "builtInRoleNames"
Cohesion: 0.11
Nodes (18): Contributor, Key Vault Administrator, Key Vault Certificate User, Key Vault Certificates Officer, Key Vault Contributor, Key Vault Crypto Officer, Key Vault Crypto Service Encryption User, Key Vault Crypto User (+10 more)

### Community 6 - "landingzone/main.json"
Cohesion: 0.07
Nodes (31): type, value, type, value, type, value, contentVersion, name (+23 more)

### Community 7 - "parameters"
Cohesion: 0.08
Nodes (31): defaultValue, metadata, type, defaultValue, metadata, defaultValue, metadata, type (+23 more)

### Community 8 - "tags"
Cohesion: 0.09
Nodes (27): IaC, Project, metadata, type, defaultValue, metadata, type, defaultValue (+19 more)

### Community 9 - "outputs"
Cohesion: 0.09
Nodes (26): type, value, type, value, defaultValue, metadata, type, value (+18 more)

### Community 10 - "Feature Specification: Standardized Application Onboarding"
Cohesion: 0.10
Nodes (26): Application Onboarding Phase, Bootstrap Phase, Infrastructure Phases README, Landing Zone Phase, Platform Phase, Subscription Orchestration Phase, Application-Focused Landing-Zone Baseline, Deployment Flow (+18 more)

### Community 11 - "parameters"
Cohesion: 0.10
Nodes (24): defaultValue, metadata, type, metadata, type, defaultValue, metadata, type (+16 more)

### Community 12 - "platform/main.json"
Cohesion: 0.09
Nodes (22): asserts, exclusiveKeyVaultReference, validKeyVaultReference, contentVersion, name, templateHash, version, Asserts (+14 more)

### Community 13 - "parameters"
Cohesion: 0.10
Nodes (21): defaultValue, metadata, type, defaultValue, metadata, type, bootstrapExistingKeyVaultResourceId, hubAddressSpace (+13 more)

### Community 14 - "variables"
Cohesion: 0.12
Nodes (16): variables, hasKeyVaultName, hasKeyVaultResourceGroupName, hasKeyVaultResourceId, kvName, kvPrefix, kvPrefixMaxLength, kvPrefixSanitized (+8 more)

### Community 15 - "Extension Hook Lifecycle"
Cohesion: 0.30
Nodes (15): speckit-analyze Command, Extension Hook Lifecycle, spec.md / plan.md / tasks.md Artifact Triad, speckit-checklist Command, Requirements Quality Checklist, speckit-clarify Command, speckit-constitution Command, speckit-converge Command (+7 more)

### Community 16 - "parameters"
Cohesion: 0.19
Nodes (13): exclusiveKeyVaultReference, validKeyVaultReference, properties, scope, properties, expressionEvaluationOptions, mode, parameters (+5 more)

### Community 17 - "parameters"
Cohesion: 0.17
Nodes (12): metadata, type, value, defaultValue, metadata, defaultValue, metadata, type (+4 more)

### Community 18 - "kvPrivateEndpoint"
Cohesion: 0.17
Nodes (12): privateEndpointSubnet, apiVersion, dependsOn, location, name, properties, tags, type (+4 more)

### Community 19 - "bootstrapTags"
Cohesion: 0.18
Nodes (11): defaultValue, metadata, type, value, landingZone, bootstrapTags, platformTags, defaultValue (+3 more)

### Community 20 - "vnet"
Cohesion: 0.18
Nodes (11): addressPrefixes, addressSpace, privateEndpointVNetPolicies, vnet, apiVersion, location, name, properties (+3 more)

### Community 21 - "parameters"
Cohesion: 0.20
Nodes (10): defaultValue, metadata, type, value, scope, properties, enablePurgeProtection, expressionEvaluationOptions (+2 more)

### Community 22 - "parameters"
Cohesion: 0.18
Nodes (14): properties, metadata, type, value, scope, bootstrapResourceGroupName, properties, expressionEvaluationOptions (+6 more)

### Community 23 - "outputs"
Cohesion: 0.12
Nodes (16): type, value, type, value, type, value, bootstrapResourceGroupId, keyVaultName (+8 more)

### Community 24 - "kvPrivateDnsLink"
Cohesion: 0.20
Nodes (10): kvPrivateDns, kvPrivateEndpoint, dependsOn, apiVersion, dependsOn, location, name, properties (+2 more)

### Community 25 - "parameters"
Cohesion: 0.22
Nodes (9): defaultValue, metadata, type, defaultValue, metadata, type, createMode, enableTelemetry (+1 more)

### Community 26 - "bootstrap"
Cohesion: 0.07
Nodes (30): apiVersion, dependsOn, name, properties, resourceGroup, type, apiVersion, location (+22 more)

### Community 27 - "kvPrivateEndpoint"
Cohesion: 0.22
Nodes (9): privateEndpointSubnet, apiVersion, dependsOn, location, name, properties, tags, type (+1 more)

### Community 28 - "kvPrivateDnsLink"
Cohesion: 0.22
Nodes (9): apiVersion, location, name, properties, type, registrationEnabled, virtualNetwork, kvPrivateDnsLink (+1 more)

### Community 29 - "Landing-Zone Layered Baseline"
Cohesion: 0.36
Nodes (8): Landing-Zone Layered Baseline, Repeatable Desired-State Deployment, Azure Enterprise Infrastructure Planner Skill, Azure Infrastructure Planning Guidance, Deploy Bootstrap Workflow, Azure OIDC Login Step, Pull Request What-If Validation, Deploy Platform Workflow

### Community 30 - "keyVault_privateEndpoints"
Cohesion: 0.25
Nodes (8): apiVersion, copy, name, properties, resourceGroup, subscriptionId, type, keyVault_privateEndpoints

### Community 31 - "publicNetworkAccess"
Cohesion: 0.25
Nodes (8): publicNetworkAccess, allowedValues, defaultValue, metadata, type, value, Disabled, Enabled

### Community 32 - "Implementation Plan: Multi-Application Baseline Consumption"
Cohesion: 0.07
Nodes (25): Content Quality, Feature Readiness, Notes, Requirement Completeness, Specification Quality Checklist: Multi-Application Baseline Consumption, Complexity Tracking, Constitution Check, Documentation (this feature) (+17 more)

### Community 33 - "powerPlatformSubnet"
Cohesion: 0.25
Nodes (8): vnet, apiVersion, dependsOn, name, properties, type, dependsOn, powerPlatformSubnet

### Community 34 - "powerPlatformSubnet"
Cohesion: 0.29
Nodes (8): apiVersion, name, properties, type, properties, addressPrefix, privateEndpointNetworkPolicies, powerPlatformSubnet

### Community 35 - "resources"
Cohesion: 0.29
Nodes (7): apiVersion, condition, name, properties, type, avmTelemetry, resources

### Community 36 - "keyVault_accessPolicies"
Cohesion: 0.29
Nodes (7): apiVersion, condition, dependsOn, name, properties, type, keyVault_accessPolicies

### Community 37 - "keyVault"
Cohesion: 0.29
Nodes (7): apiVersion, location, name, properties, tags, type, keyVault

### Community 38 - "keyVault_diagnosticSettings"
Cohesion: 0.29
Nodes (7): apiVersion, copy, name, properties, scope, type, keyVault_diagnosticSettings

### Community 39 - "keyVault_keys"
Cohesion: 0.29
Nodes (7): apiVersion, copy, dependsOn, name, properties, type, keyVault_keys

### Community 40 - "keyVault_lock"
Cohesion: 0.29
Nodes (7): apiVersion, condition, name, properties, scope, type, keyVault_lock

### Community 41 - "keyVault_roleAssignments"
Cohesion: 0.29
Nodes (7): apiVersion, copy, name, properties, scope, type, keyVault_roleAssignments

### Community 42 - "keyVault_secrets"
Cohesion: 0.29
Nodes (7): apiVersion, copy, dependsOn, name, properties, type, keyVault_secrets

### Community 43 - "sku"
Cohesion: 0.29
Nodes (7): sku, allowedValues, defaultValue, metadata, type, premium, standard

### Community 44 - "properties"
Cohesion: 0.38
Nodes (7): properties, properties, properties, properties, billingScope, displayName, workload

### Community 45 - "applicationSubscriptionDeployment"
Cohesion: 0.29
Nodes (7): apiVersion, condition, location, name, subscriptionId, type, applicationSubscriptionDeployment

### Community 46 - "applicationSubscriptionPlacement"
Cohesion: 0.29
Nodes (7): apiVersion, condition, dependsOn, name, type, applicationSubscriptionPlacement, applicationManagementGroup

### Community 47 - "resourceGroupTags"
Cohesion: 0.29
Nodes (7): managedBy, workload, resourceGroupTags, defaultValue, metadata, type, value

### Community 48 - "workload"
Cohesion: 0.29
Nodes (7): workload, allowedValues, defaultValue, metadata, type, DevTest, Production

### Community 49 - "platformSubscriptionDeployment"
Cohesion: 0.29
Nodes (7): apiVersion, condition, location, name, subscriptionId, type, platformSubscriptionDeployment

### Community 50 - "platformSubscriptionPlacement"
Cohesion: 0.29
Nodes (7): apiVersion, condition, dependsOn, name, type, platformSubscriptionPlacement, platformManagementGroup

### Community 51 - "vnet"
Cohesion: 0.29
Nodes (7): vnet, apiVersion, location, name, properties, tags, type

### Community 52 - "Contract: Application Baseline Consumption"
Cohesion: 0.07
Nodes (24): Consumer Obligations, Contract: Application Baseline Consumption, Provider Obligations, Purpose, Required Inputs, Review Outcome, Shared Capability Categories, Access Control Model (+16 more)

### Community 53 - "resources"
Cohesion: 0.29
Nodes (7): apiVersion, name, properties, type, privateDnsZoneConfigs, resources, kvPeDnsZoneGroup

### Community 54 - "name"
Cohesion: 0.47
Nodes (6): maxLength, metadata, type, value, name, name

### Community 55 - "Tasks: Multi-Application Baseline Consumption"
Cohesion: 0.09
Nodes (21): Dependencies & Execution Order, Format: `[ID] [P?] [Story] Description`, Implementation for User Story 1, Implementation for User Story 2, Implementation for User Story 3, Implementation Strategy, Incremental Delivery, MVP First (User Story 1 Only) (+13 more)

### Community 56 - "Research: Multi-Application Baseline Consumption"
Cohesion: 0.29
Nodes (6): Decision 1: Treat bootstrap and platform as a shared platform product, Decision 2: Use both subscription-scope and resource-group-scope application patterns, Decision 3: Separate ownership domains by identity, platform, and application, Decision 4: Represent shared platform and per-application deployments as separate deployment stacks, Decision 5: Reuse the current app vend pattern as the initial application onboarding shape, Research: Multi-Application Baseline Consumption

### Community 57 - "kv"
Cohesion: 0.33
Nodes (6): apiVersion, condition, name, properties, type, kv

### Community 58 - "resources"
Cohesion: 0.33
Nodes (6): apiVersion, name, properties, type, kvPeDnsZoneGroup, resources

### Community 59 - "kvPrivateDns"
Cohesion: 0.33
Nodes (6): apiVersion, location, name, tags, type, kvPrivateDns

### Community 60 - "uami"
Cohesion: 0.33
Nodes (6): uami, apiVersion, location, name, tags, type

### Community 61 - "kvPrivateDns"
Cohesion: 0.33
Nodes (6): apiVersion, location, name, tags, type, kvPrivateDns

### Community 62 - "definitions"
Cohesion: 0.40
Nodes (5): metadata, properties, type, _1.privateEndpointPrivateDnsZoneGroupType, definitions

### Community 63 - "accessPolicies"
Cohesion: 0.40
Nodes (5): items, metadata, nullable, type, accessPolicies

### Community 64 - "diagnosticSettings"
Cohesion: 0.40
Nodes (5): items, metadata, nullable, type, diagnosticSettings

### Community 65 - "enableRbacAuthorization"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, enableRbacAuthorization

### Community 66 - "enableSoftDelete"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, enableSoftDelete

### Community 67 - "keyVault"
Cohesion: 0.40
Nodes (5): dependsOn, dependsOn, dependsOn, dependsOn, keyVault

### Community 68 - "roleAssignments"
Cohesion: 0.40
Nodes (5): roleAssignments, items, metadata, nullable, type

### Community 69 - "resources"
Cohesion: 0.40
Nodes (5): apiVersion, name, type, resources, applicationSubscriptionAlias

### Community 70 - "environmentName"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, environmentName

### Community 71 - "location"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, location

### Community 72 - "namePrefix"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, namePrefix

### Community 73 - "platformResourceGroupName"
Cohesion: 0.40
Nodes (5): platformResourceGroupName, defaultValue, metadata, type, value

### Community 74 - "Data Model: Multi-Application Baseline Consumption"
Cohesion: 0.33
Nodes (5): Application Baseline Contract, Application Deployment Unit, Data Model: Multi-Application Baseline Consumption, Ownership Boundary, Shared Capability Reference

### Community 75 - "existingKeyVaultResourceId"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, existingKeyVaultResourceId

### Community 76 - "hubAddressSpace"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, hubAddressSpace

### Community 77 - "location"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, location

### Community 78 - "namePrefix"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, namePrefix

### Community 79 - "powerPlatformSubnetPrefix"
Cohesion: 0.40
Nodes (5): powerPlatformSubnetPrefix, defaultValue, metadata, type, value

### Community 80 - "privateEndpointSubnetPrefix"
Cohesion: 0.40
Nodes (5): privateEndpointSubnetPrefix, defaultValue, metadata, type, value

### Community 81 - "tags"
Cohesion: 0.40
Nodes (5): tags, defaultValue, metadata, type, value

### Community 82 - "privateEndpointSubnet"
Cohesion: 0.40
Nodes (5): apiVersion, name, properties, type, privateEndpointSubnet

### Community 83 - "_1.privateEndpointCustomDnsConfigType"
Cohesion: 0.50
Nodes (4): metadata, properties, type, _1.privateEndpointCustomDnsConfigType

### Community 84 - "_1.privateEndpointIpConfigurationType"
Cohesion: 0.50
Nodes (4): metadata, properties, type, _1.privateEndpointIpConfigurationType

### Community 85 - "accessPolicyType"
Cohesion: 0.50
Nodes (4): metadata, properties, type, accessPolicyType

### Community 86 - "credentialOutputType"
Cohesion: 0.50
Nodes (4): metadata, properties, type, credentialOutputType

### Community 87 - "diagnosticSettingFullType"
Cohesion: 0.50
Nodes (4): diagnosticSettingFullType, metadata, properties, type

### Community 88 - "keyType"
Cohesion: 0.50
Nodes (4): keyType, metadata, properties, type

### Community 89 - "lockType"
Cohesion: 0.50
Nodes (4): lockType, metadata, properties, type

### Community 90 - "privateEndpointOutputType"
Cohesion: 0.50
Nodes (4): privateEndpointOutputType, metadata, properties, type

### Community 91 - "privateEndpointSingleServiceType"
Cohesion: 0.50
Nodes (4): privateEndpointSingleServiceType, metadata, properties, type

### Community 92 - "roleAssignmentType"
Cohesion: 0.50
Nodes (4): roleAssignmentType, metadata, properties, type

### Community 93 - "rotationPolicyType"
Cohesion: 0.50
Nodes (4): rotationPolicyType, metadata, properties, type

### Community 94 - "secretType"
Cohesion: 0.50
Nodes (4): secretType, metadata, properties, type

### Community 95 - "enableVaultForDeployment"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, enableVaultForDeployment

### Community 96 - "enableVaultForDiskEncryption"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, enableVaultForDiskEncryption

### Community 97 - "enableVaultForTemplateDeployment"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, enableVaultForTemplateDeployment

### Community 98 - "lock"
Cohesion: 0.50
Nodes (4): metadata, nullable, $ref, lock

### Community 99 - "networkAcls"
Cohesion: 0.50
Nodes (4): metadata, nullable, type, networkAcls

### Community 100 - "softDeleteRetentionInDays"
Cohesion: 0.50
Nodes (4): softDeleteRetentionInDays, defaultValue, metadata, type

### Community 101 - "applicationManagementGroup"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, applicationManagementGroup

### Community 102 - "applicationManagementGroupName"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, applicationManagementGroupName

### Community 103 - "applicationBootstrapResourceGroupName"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, applicationBootstrapResourceGroupName

### Community 104 - "bootstrapLocation"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, bootstrapLocation

### Community 105 - "platformManagementGroup"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, platformManagementGroup

### Community 106 - "platformSubscriptionAlias"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, platformSubscriptionAlias

### Community 107 - "bootstrapExistingKeyVaultResourceId"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, bootstrapExistingKeyVaultResourceId

### Community 108 - "platformLocation"
Cohesion: 0.50
Nodes (4): platformLocation, defaultValue, metadata, type

### Community 109 - "vnet"
Cohesion: 0.29
Nodes (7): kvPrivateDns, kvPrivateEndpoint, vnet, dependsOn, dependsOn, dependsOn, dependsOn

### Community 110 - "privateEndpointSubnet"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, privateEndpointSubnet

## Knowledge Gaps
- **682 isolated node(s):** `contentVersion`, `name`, `templateHash`, `version`, `type` (+677 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 688 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `template` connect `template` to `resources`, `builtInRoleNames`, `parameters`, `parameters`, `definitions`?**
  _High betweenness centrality (0.040) - this node is a cross-community bridge._
- **Why does `parameters` connect `parameters` to `diagnosticSettings`, `enableRbacAuthorization`, `enableSoftDelete`, `enableVaultForDiskEncryption`, `template`, `enableVaultForTemplateDeployment`, `lock`, `networkAcls`, `tags`, `roleAssignments`, `softDeleteRetentionInDays`, `sku`, `parameters`, `name`, `publicNetworkAccess`, `enableVaultForDeployment`, `accessPolicies`?**
  _High betweenness centrality (0.033) - this node is a cross-community bridge._
- **Why does `template` connect `parameters` to `infra/main.json`, `outputs`, `variables`, `parameters`, `resources`?**
  _High betweenness centrality (0.032) - this node is a cross-community bridge._
- **What connects `contentVersion`, `name`, `templateHash` to the rest of the system?**
  _682 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `variables` be split into smaller, more focused modules?**
  _Cohesion score 0.04081632653061224 - nodes in this community are weakly interconnected._
- **Should `infra/main.json` be split into smaller, more focused modules?**
  _Cohesion score 0.05121951219512195 - nodes in this community are weakly interconnected._
- **Should `common.sh` be split into smaller, more focused modules?**
  _Cohesion score 0.12698412698412698 - nodes in this community are weakly interconnected._