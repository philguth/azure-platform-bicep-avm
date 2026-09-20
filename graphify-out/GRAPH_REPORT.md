# Graph Report - azure-platform-bicep-avm  (2026-09-09)

## Corpus Check
- 68 files · ~105,455 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 1768 nodes · 2105 edges · 175 communities (171 shown, 4 thin omitted)
- Extraction: 99% EXTRACTED · 1% INFERRED · 0% AMBIGUOUS · INFERRED: 27 edges (avg confidence: 0.81)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `51fb0c63`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- outputs
- infra/main.json
- common.sh
- parameters
- outputs
- builtInRoleNames
- landingzone/main.json
- parameters
- description
- outputs
- Feature Specification: Standardized Application Onboarding
- parameters
- metadata
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
- bootstrap
- Tasks: Multi-Application Baseline Consumption
- Research: Multi-Application Baseline Consumption
- kv
- resources
- kvPrivateDns
- uami
- kvPrivateDns
- definitions
- accessPolicies
- Parameters
- Parameters
- parameters
- keyVault
- capacity
- resources
- environmentName
- location
- namePrefix
- kv
- Data Model: Multi-Application Baseline Consumption
- existingKeyVaultResourceId
- hubAddressSpace
- capacity
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
- variables
- Parameters
- enableVaultForTemplateDeployment
- outputs
- bootstrap/main.json
- bootstrap
- applicationManagementGroup
- _generator
- diagnosticSettings
- sync-fabric-capacity-params.sh
- platformManagementGroup
- platformSubscriptionAlias
- parameters
- parameters
- vnet
- privateEndpointSubnet
- fabric-capacity/vend.json
- outputs
- parameters
- parameters
- location
- template
- parameters
- outputs
- parameters
- parameters
- App recipe template for tenant-local POC deployment
- fabric-capacity-alt/vend.json
- deploy/main.json
- keys
- value
- _generator
- privateEndpoints
- description
- securityPrincipals
- variables
- fabric
- fabric
- secrets
- platform/main.json
- sharedBaseline
- sharedBaseline
- applicationName
- appTags
- location
- tags
- bootstrapExistingKeyVaultResourceId
- bootstrapTags
- capacityName
- hubAddressSpace
- location
- platformTags
- powerPlatformSubnetPrefix
- privateEndpointSubnetPrefix
- capacityName
- name
- appResourceGroupName
- resourceGroupTags
- environmentName
- namePrefix
- createMode
- enableTelemetry
- tags
- softDeleteRetentionInDays
- keyVaultName
- keyVaultResourceGroupName
- keyVaultResourceId
- powerPlatformSubnetPrefix
- Application onboarding
- bootstrapLocation
- generate-bicep-docs.sh
- applicationSubscriptionId
- bootstrapResourceGroupName
- fabric-capacity-alt/README.md
- platformLocation
- Deployment ownership and access control
- platformSubscriptionAliasName
- roleAssignments
- platformSubscriptionId
- bundle-docs.sh

## God Nodes (most connected - your core abstractions)
1. `parameters` - 23 edges
2. `parameters` - 21 edges
3. `parameters` - 20 edges
4. `parameters` - 19 edges
5. `parameters` - 18 edges
6. `Parameters` - 18 edges
7. `variables` - 16 edges
8. `builtInRoleNames` - 16 edges
9. `parameters` - 15 edges
10. `parameters` - 15 edges

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

## Communities (175 total, 4 thin omitted)

### Community 0 - "outputs"
Cohesion: 0.12
Nodes (16): type, value, type, value, outputs, keyVaultName, keyVaultResourceId, uamiClientId (+8 more)

### Community 1 - "infra/main.json"
Cohesion: 0.05
Nodes (40): apiVersion, dependsOn, name, resourceGroup, type, apiVersion, location, name (+32 more)

### Community 2 - "common.sh"
Cohesion: 0.13
Nodes (29): check-prerequisites.sh script, check_dir(), check_file(), find_specify_root(), format_speckit_command(), get_current_branch(), get_feature_paths(), get_invoke_separator() (+21 more)

### Community 3 - "parameters"
Cohesion: 0.20
Nodes (10): defaultValue, type, defaultValue, type, parameters, location, namePrefix, tags (+2 more)

### Community 4 - "outputs"
Cohesion: 0.15
Nodes (13): resourceGroupName, resourceId, uri, metadata, type, value, metadata, type (+5 more)

### Community 5 - "builtInRoleNames"
Cohesion: 0.12
Nodes (16): Contributor, Key Vault Administrator, Key Vault Certificate User, Key Vault Certificates Officer, Key Vault Contributor, Key Vault Crypto Officer, Key Vault Crypto Service Encryption User, Key Vault Crypto User (+8 more)

### Community 6 - "landingzone/main.json"
Cohesion: 0.07
Nodes (30): type, value, type, value, type, value, contentVersion, name (+22 more)

### Community 7 - "parameters"
Cohesion: 0.09
Nodes (28): defaultValue, metadata, type, defaultValue, metadata, type, defaultValue, metadata (+20 more)

### Community 8 - "description"
Cohesion: 0.16
Nodes (14): metadata, type, defaultValue, metadata, type, description, defaultValue, metadata (+6 more)

### Community 9 - "outputs"
Cohesion: 0.09
Nodes (26): type, value, type, value, defaultValue, metadata, type, value (+18 more)

### Community 10 - "Feature Specification: Standardized Application Onboarding"
Cohesion: 0.10
Nodes (26): Application Onboarding Phase, Bootstrap Phase, Infrastructure Phases README, Landing Zone Phase, Platform Phase, Subscription Orchestration Phase, Application-Focused Landing-Zone Baseline, Deployment Flow (+18 more)

### Community 11 - "parameters"
Cohesion: 0.09
Nodes (28): defaultValue, metadata, type, metadata, type, defaultValue, metadata, type (+20 more)

### Community 12 - "metadata"
Cohesion: 0.25
Nodes (8): name, templateHash, version, Asserts, metadata, _EXPERIMENTAL_FEATURES_ENABLED, _EXPERIMENTAL_WARNING, _generator

### Community 13 - "parameters"
Cohesion: 0.10
Nodes (21): defaultValue, metadata, type, defaultValue, metadata, type, defaultValue, metadata (+13 more)

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
Cohesion: 0.12
Nodes (17): metadata, type, value, defaultValue, metadata, defaultValue, metadata, type (+9 more)

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
Cohesion: 0.10
Nodes (20): defaultValue, metadata, type, value, defaultValue, metadata, type, value (+12 more)

### Community 22 - "parameters"
Cohesion: 0.16
Nodes (15): properties, scope, platformResourceGroupName, defaultValue, metadata, type, value, properties (+7 more)

### Community 23 - "outputs"
Cohesion: 0.12
Nodes (16): type, value, type, value, type, value, bootstrapResourceGroupId, keyVaultName (+8 more)

### Community 24 - "kvPrivateDnsLink"
Cohesion: 0.20
Nodes (10): kvPrivateDns, kvPrivateEndpoint, dependsOn, apiVersion, dependsOn, location, name, properties (+2 more)

### Community 25 - "parameters"
Cohesion: 0.12
Nodes (17): defaultValue, metadata, type, defaultValue, metadata, type, metadata, nullable (+9 more)

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
Cohesion: 0.06
Nodes (28): Content Quality, Feature Readiness, Notes, Requirement Completeness, Specification Quality Checklist: Multi-Application Baseline Consumption, Architecture View, Complexity Tracking, Constitution Check (+20 more)

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
Cohesion: 0.05
Nodes (39): Client Intake View, Client-tenant delivery, Consumer Obligations, Contract: Application Baseline Consumption, Current Repository Platform Output Map, Current Repository Recipe Input Map, Engagement Modes, Interface Rules (+31 more)

### Community 53 - "resources"
Cohesion: 0.29
Nodes (7): apiVersion, name, properties, type, privateDnsZoneConfigs, resources, kvPeDnsZoneGroup

### Community 54 - "bootstrap"
Cohesion: 0.05
Nodes (44): apiVersion, location, name, properties, type, apiVersion, dependsOn, name (+36 more)

### Community 55 - "Tasks: Multi-Application Baseline Consumption"
Cohesion: 0.08
Nodes (25): Dependencies & Execution Order, Format: `[ID] [P?] [Story] Description`, Implementation for User Story 1, Implementation for User Story 2, Implementation for User Story 3, Implementation for User Story 4, Implementation for User Story 5, Implementation Strategy (+17 more)

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

### Community 64 - "Parameters"
Cohesion: 0.08
Nodes (23): `applicationBootstrapResourceGroupName`, `applicationManagementGroupName`, `applicationResourceGroupName`, `applicationSubscriptionAliasName`, `applicationSubscriptionId`, `bootstrapTags`, Cross-referenced Modules, `environmentName` (+15 more)

### Community 65 - "Parameters"
Cohesion: 0.12
Nodes (16): `bootstrapExistingKeyVaultResourceId`, `bootstrapLocation`, `bootstrapTags`, Cross-referenced Modules, `hubAddressSpace`, infra, `location`, Navigation (+8 more)

### Community 66 - "parameters"
Cohesion: 0.09
Nodes (31): metadata, type, value, metadata, type, value, metadata, defaultValue (+23 more)

### Community 67 - "keyVault"
Cohesion: 0.40
Nodes (5): dependsOn, dependsOn, dependsOn, dependsOn, keyVault

### Community 68 - "capacity"
Cohesion: 0.07
Nodes (30): apiVersion, location, name, tags, type, apiVersion, dependsOn, name (+22 more)

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

### Community 73 - "kv"
Cohesion: 0.17
Nodes (12): apiVersion, condition, name, type, resources, kv, uami, apiVersion (+4 more)

### Community 74 - "Data Model: Multi-Application Baseline Consumption"
Cohesion: 0.33
Nodes (5): Application Baseline Contract, Application Deployment Unit, Data Model: Multi-Application Baseline Consumption, Ownership Boundary, Shared Capability Reference

### Community 75 - "existingKeyVaultResourceId"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, existingKeyVaultResourceId

### Community 76 - "hubAddressSpace"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, hubAddressSpace

### Community 77 - "capacity"
Cohesion: 0.07
Nodes (30): apiVersion, location, name, tags, type, apiVersion, dependsOn, name (+22 more)

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

### Community 95 - "variables"
Cohesion: 0.22
Nodes (9): variables, kvName, kvPrefix, kvPrefixMaxLength, kvPrefixSanitized, kvSuffix, mergedTags, uamiName (+1 more)

### Community 96 - "Parameters"
Cohesion: 0.13
Nodes (14): `hubAddressSpace`, `keyVaultName`, `keyVaultResourceGroupName`, `keyVaultResourceId`, `location`, `namePrefix`, Navigation, Outputs (+6 more)

### Community 97 - "enableVaultForTemplateDeployment"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, enableVaultForTemplateDeployment

### Community 98 - "outputs"
Cohesion: 0.12
Nodes (21): type, value, type, value, type, value, type, value (+13 more)

### Community 99 - "bootstrap/main.json"
Cohesion: 0.25
Nodes (7): contentVersion, Asserts, languageVersion, metadata, _EXPERIMENTAL_FEATURES_ENABLED, _EXPERIMENTAL_WARNING, $schema

### Community 100 - "bootstrap"
Cohesion: 0.18
Nodes (10): bootstrap, Cross-referenced Modules, `existingKeyVaultResourceId`, `location`, `namePrefix`, Navigation, Outputs, Parameters (+2 more)

### Community 101 - "applicationManagementGroup"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, applicationManagementGroup

### Community 102 - "_generator"
Cohesion: 0.33
Nodes (6): name, templateHash, version, _generator, name, metadata

### Community 103 - "diagnosticSettings"
Cohesion: 0.40
Nodes (5): items, metadata, nullable, type, diagnosticSettings

### Community 104 - "sync-fabric-capacity-params.sh"
Cohesion: 0.70
Nodes (4): get_output(), get_parameter(), sync-fabric-capacity-params.sh script, usage()

### Community 105 - "platformManagementGroup"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, platformManagementGroup

### Community 106 - "platformSubscriptionAlias"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, platformSubscriptionAlias

### Community 107 - "parameters"
Cohesion: 0.12
Nodes (20): metadata, type, value, metadata, type, value, metadata, description (+12 more)

### Community 108 - "parameters"
Cohesion: 0.11
Nodes (23): defaultValue, metadata, type, metadata, type, value, metadata, type (+15 more)

### Community 109 - "vnet"
Cohesion: 0.29
Nodes (7): kvPrivateDns, kvPrivateEndpoint, vnet, dependsOn, dependsOn, dependsOn, dependsOn

### Community 110 - "privateEndpointSubnet"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, privateEndpointSubnet

### Community 111 - "fabric-capacity/vend.json"
Cohesion: 0.12
Nodes (18): apiVersion, location, name, type, contentVersion, name, templateHash, version (+10 more)

### Community 112 - "outputs"
Cohesion: 0.14
Nodes (17): type, value, type, value, type, value, type, value (+9 more)

### Community 113 - "parameters"
Cohesion: 0.13
Nodes (15): defaultValue, metadata, type, value, defaultValue, metadata, type, value (+7 more)

### Community 114 - "parameters"
Cohesion: 0.11
Nodes (18): defaultValue, metadata, type, bootstrapLocation, platformLocation, skuName, tags, defaultValue (+10 more)

### Community 115 - "location"
Cohesion: 0.47
Nodes (6): defaultValue, metadata, type, value, location, location

### Community 116 - "template"
Cohesion: 0.33
Nodes (6): template, contentVersion, languageVersion, $schema, variables, copy

### Community 117 - "parameters"
Cohesion: 0.18
Nodes (14): metadata, type, value, scope, properties, properties, administrators, expressionEvaluationOptions (+6 more)

### Community 118 - "outputs"
Cohesion: 0.07
Nodes (35): type, value, type, value, type, value, type, value (+27 more)

### Community 119 - "parameters"
Cohesion: 0.21
Nodes (12): properties, scope, properties, expressionEvaluationOptions, mode, parameters, template, contentVersion (+4 more)

### Community 120 - "parameters"
Cohesion: 0.21
Nodes (12): properties, scope, properties, expressionEvaluationOptions, mode, parameters, template, contentVersion (+4 more)

### Community 121 - "App recipe template for tenant-local POC deployment"
Cohesion: 0.17
Nodes (11): App recipe template for tenant-local POC deployment, Contract boundary, Deployment pattern for a Foundry / LLM POC, Design intent, Example app input contract, Example `azure.yaml`, Local repo use case, POC guidance (+3 more)

### Community 122 - "fabric-capacity-alt/vend.json"
Cohesion: 0.20
Nodes (9): apiVersion, location, name, type, contentVersion, languageVersion, resources, appOnboarding (+1 more)

### Community 123 - "deploy/main.json"
Cohesion: 0.08
Nodes (25): contentVersion, apiVersion, dependsOn, location, name, type, name, templateHash (+17 more)

### Community 124 - "keys"
Cohesion: 0.38
Nodes (7): copy, items, metadata, nullable, type, keys, keys

### Community 125 - "value"
Cohesion: 0.14
Nodes (14): sharedBaseline, defaultValue, metadata, type, value, bootstrapResourceGroupId, environmentName, keyVaultResourceId (+6 more)

### Community 126 - "_generator"
Cohesion: 0.28
Nodes (9): name, templateHash, version, Asserts, metadata, _EXPERIMENTAL_FEATURES_ENABLED, _EXPERIMENTAL_WARNING, _generator (+1 more)

### Community 127 - "privateEndpoints"
Cohesion: 0.38
Nodes (7): privateEndpoints, privateEndpoints, copy, items, metadata, nullable, type

### Community 128 - "description"
Cohesion: 0.22
Nodes (9): defaultValue, metadata, type, description, hubAddressSpace, privateEndpointSubnetPrefix, defaultValue, metadata (+1 more)

### Community 129 - "securityPrincipals"
Cohesion: 0.25
Nodes (8): applicationOwnerObjectId, identityOwnerObjectId, platformOwnerObjectId, securityPrincipals, defaultValue, metadata, type, value

### Community 130 - "variables"
Cohesion: 0.25
Nodes (8): variables, hasKeyVaultName, hasKeyVaultResourceGroupName, hasKeyVaultResourceId, kvPrivateEndpointName, peSubnetId, resolvedKeyVaultResourceId, vnetName

### Community 131 - "fabric"
Cohesion: 0.29
Nodes (7): apiVersion, dependsOn, name, resourceGroup, type, appOnboarding, fabric

### Community 132 - "fabric"
Cohesion: 0.29
Nodes (7): apiVersion, dependsOn, name, resourceGroup, type, appOnboarding, fabric

### Community 133 - "secrets"
Cohesion: 0.38
Nodes (7): secrets, secrets, copy, items, metadata, nullable, type

### Community 134 - "platform/main.json"
Cohesion: 0.29
Nodes (6): asserts, exclusiveKeyVaultReference, validKeyVaultReference, contentVersion, languageVersion, $schema

### Community 135 - "sharedBaseline"
Cohesion: 0.40
Nodes (6): sharedBaseline, sharedBaseline, defaultValue, metadata, type, value

### Community 136 - "sharedBaseline"
Cohesion: 0.40
Nodes (6): sharedBaseline, sharedBaseline, defaultValue, metadata, type, value

### Community 137 - "applicationName"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, applicationName

### Community 138 - "appTags"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, appTags

### Community 139 - "location"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, location

### Community 140 - "tags"
Cohesion: 0.40
Nodes (5): tags, defaultValue, metadata, type, value

### Community 141 - "bootstrapExistingKeyVaultResourceId"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, bootstrapExistingKeyVaultResourceId

### Community 142 - "bootstrapTags"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, bootstrapTags

### Community 143 - "capacityName"
Cohesion: 0.50
Nodes (5): metadata, type, value, capacityName, capacityName

### Community 144 - "hubAddressSpace"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, hubAddressSpace

### Community 145 - "location"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, location

### Community 146 - "platformTags"
Cohesion: 0.40
Nodes (5): platformTags, defaultValue, metadata, type, value

### Community 147 - "powerPlatformSubnetPrefix"
Cohesion: 0.40
Nodes (5): powerPlatformSubnetPrefix, defaultValue, metadata, type, value

### Community 148 - "privateEndpointSubnetPrefix"
Cohesion: 0.40
Nodes (5): privateEndpointSubnetPrefix, defaultValue, metadata, type, value

### Community 149 - "capacityName"
Cohesion: 0.67
Nodes (4): type, value, capacityName, capacityName

### Community 150 - "name"
Cohesion: 0.47
Nodes (6): maxLength, metadata, type, value, name, name

### Community 151 - "appResourceGroupName"
Cohesion: 0.50
Nodes (4): metadata, type, value, appResourceGroupName

### Community 152 - "resourceGroupTags"
Cohesion: 0.40
Nodes (5): resourceGroupTags, defaultValue, metadata, type, value

### Community 153 - "environmentName"
Cohesion: 0.50
Nodes (4): metadata, type, value, environmentName

### Community 154 - "namePrefix"
Cohesion: 0.50
Nodes (4): metadata, type, value, namePrefix

### Community 155 - "createMode"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, createMode

### Community 156 - "enableTelemetry"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, enableTelemetry

### Community 157 - "tags"
Cohesion: 0.29
Nodes (7): IaC, Project, tags, defaultValue, nullable, type, value

### Community 158 - "softDeleteRetentionInDays"
Cohesion: 0.50
Nodes (4): softDeleteRetentionInDays, defaultValue, metadata, type

### Community 159 - "keyVaultName"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, keyVaultName

### Community 160 - "keyVaultResourceGroupName"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, keyVaultResourceGroupName

### Community 161 - "keyVaultResourceId"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, keyVaultResourceId

### Community 162 - "powerPlatformSubnetPrefix"
Cohesion: 0.50
Nodes (4): powerPlatformSubnetPrefix, defaultValue, metadata, type

### Community 164 - "bootstrapLocation"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, bootstrapLocation

### Community 166 - "applicationSubscriptionId"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, applicationSubscriptionId

### Community 167 - "bootstrapResourceGroupName"
Cohesion: 0.50
Nodes (4): metadata, type, value, bootstrapResourceGroupName

### Community 169 - "platformLocation"
Cohesion: 0.50
Nodes (4): platformLocation, defaultValue, metadata, type

### Community 170 - "Deployment ownership and access control"
Cohesion: 0.40
Nodes (4): Deployment boundaries, Deployment ownership and access control, Deployment permissions, Required Microsoft Entra groups

### Community 171 - "platformSubscriptionAliasName"
Cohesion: 0.50
Nodes (4): platformSubscriptionAliasName, defaultValue, metadata, type

### Community 172 - "roleAssignments"
Cohesion: 0.40
Nodes (5): roleAssignments, items, metadata, nullable, type

### Community 173 - "platformSubscriptionId"
Cohesion: 0.50
Nodes (4): platformSubscriptionId, defaultValue, metadata, type

## Knowledge Gaps
- **1079 isolated node(s):** `bundle-docs.sh script`, `User Story 1 - Define the shared application baseline contract (Priority: P1)`, `User Story 2 - Onboard multiple applications independently (Priority: P2)`, `User Story 3 - Preserve ownership boundaries across scopes (Priority: P3)`, `User Story 4 - Reuse the onboarding model across provider and client tenants (Priority: P3)` (+1074 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 1095 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `parameters` connect `parameters` to `enableVaultForTemplateDeployment`, `secrets`, `diagnosticSettings`, `sku`, `roleAssignments`, `privateEndpoints`, `publicNetworkAccess`, `keys`, `location`, `template`, `parameters`, `name`, `createMode`, `enableTelemetry`, `tags`, `softDeleteRetentionInDays`, `accessPolicies`?**
  _High betweenness centrality (0.028) - this node is a cross-community bridge._
- **Why does `template` connect `template` to `resources`, `outputs`, `_generator`, `parameters`, `parameters`, `definitions`?**
  _High betweenness centrality (0.028) - this node is a cross-community bridge._
- **Why does `resources` connect `resources` to `keyVault_accessPolicies`, `keyVault`, `keyVault_diagnosticSettings`, `keyVault_keys`, `keyVault_lock`, `keyVault_roleAssignments`, `keyVault_secrets`, `template`, `keyVault_privateEndpoints`?**
  _High betweenness centrality (0.012) - this node is a cross-community bridge._
- **What connects `bundle-docs.sh script`, `User Story 1 - Define the shared application baseline contract (Priority: P1)`, `User Story 2 - Onboard multiple applications independently (Priority: P2)` to the rest of the system?**
  _1079 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `outputs` be split into smaller, more focused modules?**
  _Cohesion score 0.125 - nodes in this community are weakly interconnected._
- **Should `infra/main.json` be split into smaller, more focused modules?**
  _Cohesion score 0.05121951219512195 - nodes in this community are weakly interconnected._
- **Should `common.sh` be split into smaller, more focused modules?**
  _Cohesion score 0.12698412698412698 - nodes in this community are weakly interconnected._