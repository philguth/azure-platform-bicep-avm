# Graph Report - azure-platform-bicep-avm  (2026-08-28)

## Corpus Check
- 45 files · ~73,980 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 1043 nodes · 1247 edges · 112 communities
- Extraction: 98% EXTRACTED · 2% INFERRED · 0% AMBIGUOUS · INFERRED: 27 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Variables Json Outputs
- Infra Json Bootstrapresourcegroup
- Script Create-new-feature Common
- Parameters Description Hubaddressspace
- Keys Privateendpoints Secrets
- Metadata Builtinrolenames Generator
- Metadata Landingzone Json
- Parameters Description Applicationbootstrapresourcegroupname
- Location Tags Description
- Outputs Keyvaultresourceid Keyvaultname
- Landing-zone Feature Specification
- Parameters Description Bootstraplocation
- Json Variables Metadata
- Parameters Bootstrapexistingkeyvaultresourceid Hubaddressspace
- Variables Haskeyvaultname Haskeyvaultresourcegroupname
- Command Extension Hook
- Properties Parameters Expressionevaluationoptions
- Parameters Environmentname Keyvaultname
- Kvprivateendpoint Properties Dependson
- Defaultvalue Metadata Bootstraptags
- Vnet Properties Addressprefixes
- Parameters Enablepurgeprotection Properties
- Properties Parameters Bootstrapresourcegroupname
- Type Value Outputs
- Dependson Kvprivatednslink Kvprivatedns
- Defaultvalue Metadata Parameters
- Dependson Platformresourcegroup Apiversion
- Kvprivateendpoint Dependson Privateendpointsubnet
- Kvprivatednslink Properties Virtualnetwork
- Deploy Infrastructure Landing-zone
- Keyvault_privateendpoints Apiversion Copy
- Publicnetworkaccess Allowedvalues Defaultvalue
- Dependson Apiversion Name
- Dependson Powerplatformsubnet Vnet
- Properties Privateendpointsubnet Addressprefix
- Resources Avmtelemetry Apiversion
- Keyvault_accesspolicies Dependson Apiversion
- Keyvault Apiversion Location
- Keyvault_diagnosticsettings Apiversion Copy
- Keyvault_keys Dependson Apiversion
- Keyvault_lock Apiversion Condition
- Keyvault_roleassignments Apiversion Copy
- Keyvault_secrets Dependson Apiversion
- Sku Allowedvalues Defaultvalue
- Properties Displayname Billingscope
- Applicationsubscriptiondeployment Apiversion Condition
- Applicationsubscriptionplacement Dependson Apiversion
- Resourcegrouptags Defaultvalue Metadata
- Workload Allowedvalues Metadata
- Platformsubscriptiondeployment Apiversion Condition
- Platformsubscriptionplacement Dependson Apiversion
- Vnet Apiversion Location
- Dependson Powerplatformsubnet Vnet
- Resources Kvpednszonegroup Properties
- Name Metadata Type
- Bootstrapresourcegroup Apiversion Location
- Platformresourcegroup Apiversion Location
- Apiversion Condition Name
- Resources Kvpednszonegroup Apiversion
- Kvprivatedns Apiversion Location
- Uami Apiversion Location
- Kvprivatedns Apiversion Location
- Definitions Privateendpointprivatednszonegrouptype Metadata
- Accesspolicies Items Metadata
- Diagnosticsettings Items Metadata
- Enablerbacauthorization Defaultvalue Metadata
- Enablesoftdelete Defaultvalue Metadata
- Dependson Keyvault
- Roleassignments Items Metadata
- Resources Applicationsubscriptionalias Apiversion
- Environmentname Metadata Defaultvalue
- Location Metadata Defaultvalue
- Nameprefix Metadata Defaultvalue
- Platformresourcegroupname Metadata Defaultvalue
- Resources Contentversion Languageversion
- Existingkeyvaultresourceid Defaultvalue Metadata
- Hubaddressspace Metadata Defaultvalue
- Location Metadata Defaultvalue
- Nameprefix Metadata Defaultvalue
- Powerplatformsubnetprefix Metadata Defaultvalue
- Privateendpointsubnetprefix Metadata Defaultvalue
- Tags Defaultvalue Metadata
- Privateendpointsubnet Apiversion Name
- Privateendpointcustomdnsconfigtype Metadata Properties
- Privateendpointipconfigurationtype Metadata Properties
- Accesspolicytype Metadata Properties
- Credentialoutputtype Metadata Properties
- Diagnosticsettingfulltype Metadata Properties
- Keytype Metadata Properties
- Locktype Metadata Properties
- Privateendpointoutputtype Metadata Properties
- Privateendpointsingleservicetype Metadata Properties
- Roleassignmenttype Metadata Properties
- Rotationpolicytype Metadata Properties
- Secrettype Metadata Properties
- Enablevaultfordeployment Defaultvalue Metadata
- Enablevaultfordiskencryption Defaultvalue Metadata
- Enablevaultfortemplatedeployment Defaultvalue Metadata
- Lock Metadata Nullable
- Networkacls Metadata Nullable
- Softdeleteretentionindays Defaultvalue Metadata
- Applicationmanagementgroup Apiversion Name
- Applicationmanagementgroupname Metadata Defaultvalue
- Applicationsubscriptionid Metadata Defaultvalue
- Bootstraplocation Defaultvalue Metadata
- Platformmanagementgroup Apiversion Name
- Platformsubscriptionalias Apiversion Name
- Bootstrapexistingkeyvaultresourceid Metadata Defaultvalue
- Platformlocation Metadata Defaultvalue
- Dependson Kvprivatedns Kvprivateendpoint
- Keyvaultresourceid Type Value
- Platformresourcegroupid Type Value

## God Nodes (most connected - your core abstractions)
1. `parameters` - 23 edges
2. `parameters` - 19 edges
3. `builtInRoleNames` - 16 edges
4. `variables` - 16 edges
5. `parameters` - 15 edges
6. `parameters` - 15 edges
7. `definitions` - 14 edges
8. `parameters` - 12 edges
9. `parameters` - 11 edges
10. `template` - 11 edges

## Surprising Connections (you probably didn't know these)
- `Feature Specification Template` --semantically_similar_to--> `Feature Specification: Standardized Application Onboarding`  [INFERRED] [semantically similar]
  .specify/templates/spec-template.md → specs/001-standardize-app-onboarding/spec.md
- `Checklist Template` --semantically_similar_to--> `Specification Quality Checklist: Standardized Application Onboarding`  [INFERRED] [semantically similar]
  .specify/templates/checklist-template.md → specs/001-standardize-app-onboarding/checklists/requirements.md
- `Application Onboarding Phase` --conceptually_related_to--> `Feature Specification: Standardized Application Onboarding`  [INFERRED]
  infra/README.md → specs/001-standardize-app-onboarding/spec.md
- `Constitution Template` --semantically_similar_to--> `Azure Platform Bicep AVM Constitution`  [INFERRED] [semantically similar]
  .specify/templates/constitution-template.md → .specify/memory/constitution.md
- `Application-Focused Landing-Zone Baseline` --conceptually_related_to--> `Layered Landing-Zone Architecture`  [INFERRED]
  README.md → .specify/memory/constitution.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Infrastructure Phase Sequence** — infra_readme_landing_zone_phase, infra_readme_subscription_orchestration_phase, infra_readme_bootstrap_phase, infra_readme_platform_phase, infra_readme_application_onboarding_phase [EXTRACTED 1.00]
- **Speckit Artifact Generation Flow** — specify_workflows_speckit_workflow_document, specify_templates_spec_template_document, specify_templates_plan_template_document, specify_templates_tasks_template_document, specify_templates_checklist_template_document [INFERRED 0.75]
- **Standardized Onboarding Review Artifacts** — specs_001_standardize_app_onboarding_spec_onboarding_request, specs_001_standardize_app_onboarding_spec_baseline_alignment_result, specs_001_standardize_app_onboarding_spec_review_summary [EXTRACTED 1.00]

## Communities (112 total, 0 thin omitted)

### Community 0 - "Variables Json Outputs"
Cohesion: 0.05
Nodes (40): contentVersion, type, value, type, value, apiVersion, condition, name (+32 more)

### Community 1 - "Infra Json Bootstrapresourcegroup"
Cohesion: 0.05
Nodes (40): apiVersion, dependsOn, name, resourceGroup, type, apiVersion, location, name (+32 more)

### Community 2 - "Script Create-new-feature Common"
Cohesion: 0.13
Nodes (29): check-prerequisites.sh script, check_dir(), check_file(), find_specify_root(), format_speckit_command(), get_current_branch(), get_feature_paths(), get_invoke_separator() (+21 more)

### Community 3 - "Parameters Description Hubaddressspace"
Cohesion: 0.07
Nodes (35): defaultValue, metadata, type, defaultValue, metadata, type, defaultValue, metadata (+27 more)

### Community 4 - "Keys Privateendpoints Secrets"
Cohesion: 0.07
Nodes (34): copy, items, metadata, nullable, type, keys, privateEndpoints, resourceGroupName (+26 more)

### Community 5 - "Metadata Builtinrolenames Generator"
Cohesion: 0.06
Nodes (32): Contributor, Key Vault Administrator, Key Vault Certificate User, Key Vault Certificates Officer, Key Vault Contributor, Key Vault Crypto Officer, Key Vault Crypto Service Encryption User, Key Vault Crypto User (+24 more)

### Community 6 - "Metadata Landingzone Json"
Cohesion: 0.07
Nodes (31): type, value, type, value, type, value, contentVersion, name (+23 more)

### Community 7 - "Parameters Description Applicationbootstrapresourcegroupname"
Cohesion: 0.08
Nodes (31): defaultValue, metadata, type, defaultValue, metadata, type, defaultValue, metadata (+23 more)

### Community 8 - "Location Tags Description"
Cohesion: 0.09
Nodes (27): IaC, Project, metadata, type, defaultValue, metadata, type, defaultValue (+19 more)

### Community 9 - "Outputs Keyvaultresourceid Keyvaultname"
Cohesion: 0.09
Nodes (26): type, value, type, value, defaultValue, metadata, type, value (+18 more)

### Community 10 - "Landing-zone Feature Specification"
Cohesion: 0.10
Nodes (26): Application Onboarding Phase, Bootstrap Phase, Infrastructure Phases README, Landing Zone Phase, Platform Phase, Subscription Orchestration Phase, Application-Focused Landing-Zone Baseline, Deployment Flow (+18 more)

### Community 11 - "Parameters Description Bootstraplocation"
Cohesion: 0.10
Nodes (24): defaultValue, metadata, type, metadata, type, defaultValue, metadata, type (+16 more)

### Community 12 - "Json Variables Metadata"
Cohesion: 0.09
Nodes (22): asserts, exclusiveKeyVaultReference, validKeyVaultReference, contentVersion, name, templateHash, version, Asserts (+14 more)

### Community 13 - "Parameters Bootstrapexistingkeyvaultresourceid Hubaddressspace"
Cohesion: 0.10
Nodes (21): defaultValue, metadata, type, defaultValue, metadata, type, bootstrapExistingKeyVaultResourceId, hubAddressSpace (+13 more)

### Community 14 - "Variables Haskeyvaultname Haskeyvaultresourcegroupname"
Cohesion: 0.12
Nodes (16): variables, hasKeyVaultName, hasKeyVaultResourceGroupName, hasKeyVaultResourceId, kvName, kvPrefix, kvPrefixMaxLength, kvPrefixSanitized (+8 more)

### Community 15 - "Command Extension Hook"
Cohesion: 0.30
Nodes (15): speckit-analyze Command, Extension Hook Lifecycle, spec.md / plan.md / tasks.md Artifact Triad, speckit-checklist Command, Requirements Quality Checklist, speckit-clarify Command, speckit-constitution Command, speckit-converge Command (+7 more)

### Community 16 - "Properties Parameters Expressionevaluationoptions"
Cohesion: 0.19
Nodes (13): exclusiveKeyVaultReference, validKeyVaultReference, properties, scope, properties, expressionEvaluationOptions, mode, parameters (+5 more)

### Community 17 - "Parameters Environmentname Keyvaultname"
Cohesion: 0.17
Nodes (12): metadata, type, value, defaultValue, metadata, defaultValue, metadata, type (+4 more)

### Community 18 - "Kvprivateendpoint Properties Dependson"
Cohesion: 0.17
Nodes (12): privateEndpointSubnet, apiVersion, dependsOn, location, name, properties, tags, type (+4 more)

### Community 19 - "Defaultvalue Metadata Bootstraptags"
Cohesion: 0.18
Nodes (11): defaultValue, metadata, type, value, landingZone, bootstrapTags, platformTags, defaultValue (+3 more)

### Community 20 - "Vnet Properties Addressprefixes"
Cohesion: 0.18
Nodes (11): addressPrefixes, addressSpace, privateEndpointVNetPolicies, vnet, apiVersion, location, name, properties (+3 more)

### Community 21 - "Parameters Enablepurgeprotection Properties"
Cohesion: 0.20
Nodes (10): defaultValue, metadata, type, value, scope, properties, enablePurgeProtection, expressionEvaluationOptions (+2 more)

### Community 22 - "Properties Parameters Bootstrapresourcegroupname"
Cohesion: 0.24
Nodes (10): properties, metadata, type, value, scope, bootstrapResourceGroupName, properties, expressionEvaluationOptions (+2 more)

### Community 23 - "Type Value Outputs"
Cohesion: 0.20
Nodes (10): type, value, type, value, bootstrapResourceGroupId, keyVaultName, uamiResourceId, outputs (+2 more)

### Community 24 - "Dependson Kvprivatednslink Kvprivatedns"
Cohesion: 0.20
Nodes (10): kvPrivateDns, kvPrivateEndpoint, dependsOn, apiVersion, dependsOn, location, name, properties (+2 more)

### Community 25 - "Defaultvalue Metadata Parameters"
Cohesion: 0.22
Nodes (9): defaultValue, metadata, type, defaultValue, metadata, type, createMode, enableTelemetry (+1 more)

### Community 26 - "Dependson Platformresourcegroup Apiversion"
Cohesion: 0.22
Nodes (9): bootstrap, platformResourceGroup, apiVersion, dependsOn, name, properties, resourceGroup, type (+1 more)

### Community 27 - "Kvprivateendpoint Dependson Privateendpointsubnet"
Cohesion: 0.22
Nodes (9): privateEndpointSubnet, apiVersion, dependsOn, location, name, properties, tags, type (+1 more)

### Community 28 - "Kvprivatednslink Properties Virtualnetwork"
Cohesion: 0.22
Nodes (9): apiVersion, location, name, properties, type, registrationEnabled, virtualNetwork, kvPrivateDnsLink (+1 more)

### Community 29 - "Deploy Infrastructure Landing-zone"
Cohesion: 0.36
Nodes (8): Landing-Zone Layered Baseline, Repeatable Desired-State Deployment, Azure Enterprise Infrastructure Planner Skill, Azure Infrastructure Planning Guidance, Deploy Bootstrap Workflow, Azure OIDC Login Step, Pull Request What-If Validation, Deploy Platform Workflow

### Community 30 - "Keyvault_privateendpoints Apiversion Copy"
Cohesion: 0.25
Nodes (8): apiVersion, copy, name, properties, resourceGroup, subscriptionId, type, keyVault_privateEndpoints

### Community 31 - "Publicnetworkaccess Allowedvalues Defaultvalue"
Cohesion: 0.25
Nodes (8): publicNetworkAccess, allowedValues, defaultValue, metadata, type, value, Disabled, Enabled

### Community 32 - "Dependson Apiversion Name"
Cohesion: 0.25
Nodes (8): apiVersion, dependsOn, name, properties, resourceGroup, type, bootstrapResourceGroup, bootstrap

### Community 33 - "Dependson Powerplatformsubnet Vnet"
Cohesion: 0.25
Nodes (8): vnet, apiVersion, dependsOn, name, properties, type, dependsOn, powerPlatformSubnet

### Community 34 - "Properties Privateendpointsubnet Addressprefix"
Cohesion: 0.29
Nodes (8): properties, apiVersion, name, properties, type, addressPrefix, privateEndpointNetworkPolicies, privateEndpointSubnet

### Community 35 - "Resources Avmtelemetry Apiversion"
Cohesion: 0.29
Nodes (7): apiVersion, condition, name, properties, type, avmTelemetry, resources

### Community 36 - "Keyvault_accesspolicies Dependson Apiversion"
Cohesion: 0.29
Nodes (7): apiVersion, condition, dependsOn, name, properties, type, keyVault_accessPolicies

### Community 37 - "Keyvault Apiversion Location"
Cohesion: 0.29
Nodes (7): apiVersion, location, name, properties, tags, type, keyVault

### Community 38 - "Keyvault_diagnosticsettings Apiversion Copy"
Cohesion: 0.29
Nodes (7): apiVersion, copy, name, properties, scope, type, keyVault_diagnosticSettings

### Community 39 - "Keyvault_keys Dependson Apiversion"
Cohesion: 0.29
Nodes (7): apiVersion, copy, dependsOn, name, properties, type, keyVault_keys

### Community 40 - "Keyvault_lock Apiversion Condition"
Cohesion: 0.29
Nodes (7): apiVersion, condition, name, properties, scope, type, keyVault_lock

### Community 41 - "Keyvault_roleassignments Apiversion Copy"
Cohesion: 0.29
Nodes (7): apiVersion, copy, name, properties, scope, type, keyVault_roleAssignments

### Community 42 - "Keyvault_secrets Dependson Apiversion"
Cohesion: 0.29
Nodes (7): apiVersion, copy, dependsOn, name, properties, type, keyVault_secrets

### Community 43 - "Sku Allowedvalues Defaultvalue"
Cohesion: 0.29
Nodes (7): sku, allowedValues, defaultValue, metadata, type, premium, standard

### Community 44 - "Properties Displayname Billingscope"
Cohesion: 0.38
Nodes (7): properties, properties, properties, properties, billingScope, displayName, workload

### Community 45 - "Applicationsubscriptiondeployment Apiversion Condition"
Cohesion: 0.29
Nodes (7): apiVersion, condition, location, name, subscriptionId, type, applicationSubscriptionDeployment

### Community 46 - "Applicationsubscriptionplacement Dependson Apiversion"
Cohesion: 0.29
Nodes (7): apiVersion, condition, dependsOn, name, type, applicationSubscriptionPlacement, applicationManagementGroup

### Community 47 - "Resourcegrouptags Defaultvalue Metadata"
Cohesion: 0.29
Nodes (7): managedBy, workload, resourceGroupTags, defaultValue, metadata, type, value

### Community 48 - "Workload Allowedvalues Metadata"
Cohesion: 0.29
Nodes (7): workload, allowedValues, defaultValue, metadata, type, DevTest, Production

### Community 49 - "Platformsubscriptiondeployment Apiversion Condition"
Cohesion: 0.29
Nodes (7): apiVersion, condition, location, name, subscriptionId, type, platformSubscriptionDeployment

### Community 50 - "Platformsubscriptionplacement Dependson Apiversion"
Cohesion: 0.29
Nodes (7): apiVersion, condition, dependsOn, name, type, platformSubscriptionPlacement, platformManagementGroup

### Community 51 - "Vnet Apiversion Location"
Cohesion: 0.29
Nodes (7): vnet, apiVersion, location, name, properties, tags, type

### Community 52 - "Dependson Powerplatformsubnet Vnet"
Cohesion: 0.29
Nodes (7): vnet, apiVersion, dependsOn, name, type, dependsOn, powerPlatformSubnet

### Community 53 - "Resources Kvpednszonegroup Properties"
Cohesion: 0.29
Nodes (7): apiVersion, name, properties, type, privateDnsZoneConfigs, resources, kvPeDnsZoneGroup

### Community 54 - "Name Metadata Type"
Cohesion: 0.47
Nodes (6): maxLength, metadata, type, value, name, name

### Community 55 - "Bootstrapresourcegroup Apiversion Location"
Cohesion: 0.33
Nodes (6): apiVersion, location, name, tags, type, bootstrapResourceGroup

### Community 56 - "Platformresourcegroup Apiversion Location"
Cohesion: 0.33
Nodes (6): apiVersion, location, name, tags, type, platformResourceGroup

### Community 57 - "Apiversion Condition Name"
Cohesion: 0.33
Nodes (6): apiVersion, condition, name, properties, type, kv

### Community 58 - "Resources Kvpednszonegroup Apiversion"
Cohesion: 0.33
Nodes (6): apiVersion, name, properties, type, kvPeDnsZoneGroup, resources

### Community 59 - "Kvprivatedns Apiversion Location"
Cohesion: 0.33
Nodes (6): apiVersion, location, name, tags, type, kvPrivateDns

### Community 60 - "Uami Apiversion Location"
Cohesion: 0.33
Nodes (6): uami, apiVersion, location, name, tags, type

### Community 61 - "Kvprivatedns Apiversion Location"
Cohesion: 0.33
Nodes (6): apiVersion, location, name, tags, type, kvPrivateDns

### Community 62 - "Definitions Privateendpointprivatednszonegrouptype Metadata"
Cohesion: 0.40
Nodes (5): metadata, properties, type, _1.privateEndpointPrivateDnsZoneGroupType, definitions

### Community 63 - "Accesspolicies Items Metadata"
Cohesion: 0.40
Nodes (5): items, metadata, nullable, type, accessPolicies

### Community 64 - "Diagnosticsettings Items Metadata"
Cohesion: 0.40
Nodes (5): items, metadata, nullable, type, diagnosticSettings

### Community 65 - "Enablerbacauthorization Defaultvalue Metadata"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, enableRbacAuthorization

### Community 66 - "Enablesoftdelete Defaultvalue Metadata"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, enableSoftDelete

### Community 67 - "Dependson Keyvault"
Cohesion: 0.40
Nodes (5): dependsOn, dependsOn, dependsOn, dependsOn, keyVault

### Community 68 - "Roleassignments Items Metadata"
Cohesion: 0.40
Nodes (5): roleAssignments, items, metadata, nullable, type

### Community 69 - "Resources Applicationsubscriptionalias Apiversion"
Cohesion: 0.40
Nodes (5): apiVersion, name, type, resources, applicationSubscriptionAlias

### Community 70 - "Environmentname Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, environmentName

### Community 71 - "Location Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, location

### Community 72 - "Nameprefix Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, namePrefix

### Community 73 - "Platformresourcegroupname Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): platformResourceGroupName, defaultValue, metadata, type, value

### Community 74 - "Resources Contentversion Languageversion"
Cohesion: 0.40
Nodes (5): template, contentVersion, languageVersion, resources, $schema

### Community 75 - "Existingkeyvaultresourceid Defaultvalue Metadata"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, existingKeyVaultResourceId

### Community 76 - "Hubaddressspace Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, hubAddressSpace

### Community 77 - "Location Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, location

### Community 78 - "Nameprefix Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): defaultValue, metadata, type, value, namePrefix

### Community 79 - "Powerplatformsubnetprefix Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): powerPlatformSubnetPrefix, defaultValue, metadata, type, value

### Community 80 - "Privateendpointsubnetprefix Metadata Defaultvalue"
Cohesion: 0.40
Nodes (5): privateEndpointSubnetPrefix, defaultValue, metadata, type, value

### Community 81 - "Tags Defaultvalue Metadata"
Cohesion: 0.40
Nodes (5): tags, defaultValue, metadata, type, value

### Community 82 - "Privateendpointsubnet Apiversion Name"
Cohesion: 0.40
Nodes (5): apiVersion, name, properties, type, privateEndpointSubnet

### Community 83 - "Privateendpointcustomdnsconfigtype Metadata Properties"
Cohesion: 0.50
Nodes (4): metadata, properties, type, _1.privateEndpointCustomDnsConfigType

### Community 84 - "Privateendpointipconfigurationtype Metadata Properties"
Cohesion: 0.50
Nodes (4): metadata, properties, type, _1.privateEndpointIpConfigurationType

### Community 85 - "Accesspolicytype Metadata Properties"
Cohesion: 0.50
Nodes (4): metadata, properties, type, accessPolicyType

### Community 86 - "Credentialoutputtype Metadata Properties"
Cohesion: 0.50
Nodes (4): metadata, properties, type, credentialOutputType

### Community 87 - "Diagnosticsettingfulltype Metadata Properties"
Cohesion: 0.50
Nodes (4): diagnosticSettingFullType, metadata, properties, type

### Community 88 - "Keytype Metadata Properties"
Cohesion: 0.50
Nodes (4): keyType, metadata, properties, type

### Community 89 - "Locktype Metadata Properties"
Cohesion: 0.50
Nodes (4): lockType, metadata, properties, type

### Community 90 - "Privateendpointoutputtype Metadata Properties"
Cohesion: 0.50
Nodes (4): privateEndpointOutputType, metadata, properties, type

### Community 91 - "Privateendpointsingleservicetype Metadata Properties"
Cohesion: 0.50
Nodes (4): privateEndpointSingleServiceType, metadata, properties, type

### Community 92 - "Roleassignmenttype Metadata Properties"
Cohesion: 0.50
Nodes (4): roleAssignmentType, metadata, properties, type

### Community 93 - "Rotationpolicytype Metadata Properties"
Cohesion: 0.50
Nodes (4): rotationPolicyType, metadata, properties, type

### Community 94 - "Secrettype Metadata Properties"
Cohesion: 0.50
Nodes (4): secretType, metadata, properties, type

### Community 95 - "Enablevaultfordeployment Defaultvalue Metadata"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, enableVaultForDeployment

### Community 96 - "Enablevaultfordiskencryption Defaultvalue Metadata"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, enableVaultForDiskEncryption

### Community 97 - "Enablevaultfortemplatedeployment Defaultvalue Metadata"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, enableVaultForTemplateDeployment

### Community 98 - "Lock Metadata Nullable"
Cohesion: 0.50
Nodes (4): metadata, nullable, $ref, lock

### Community 99 - "Networkacls Metadata Nullable"
Cohesion: 0.50
Nodes (4): metadata, nullable, type, networkAcls

### Community 100 - "Softdeleteretentionindays Defaultvalue Metadata"
Cohesion: 0.50
Nodes (4): softDeleteRetentionInDays, defaultValue, metadata, type

### Community 101 - "Applicationmanagementgroup Apiversion Name"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, applicationManagementGroup

### Community 102 - "Applicationmanagementgroupname Metadata Defaultvalue"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, applicationManagementGroupName

### Community 103 - "Applicationsubscriptionid Metadata Defaultvalue"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, applicationSubscriptionId

### Community 104 - "Bootstraplocation Defaultvalue Metadata"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, bootstrapLocation

### Community 105 - "Platformmanagementgroup Apiversion Name"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, platformManagementGroup

### Community 106 - "Platformsubscriptionalias Apiversion Name"
Cohesion: 0.50
Nodes (4): apiVersion, name, type, platformSubscriptionAlias

### Community 107 - "Bootstrapexistingkeyvaultresourceid Metadata Defaultvalue"
Cohesion: 0.50
Nodes (4): defaultValue, metadata, type, bootstrapExistingKeyVaultResourceId

### Community 108 - "Platformlocation Metadata Defaultvalue"
Cohesion: 0.50
Nodes (4): platformLocation, defaultValue, metadata, type

### Community 109 - "Dependson Kvprivatedns Kvprivateendpoint"
Cohesion: 0.50
Nodes (4): kvPrivateDns, kvPrivateEndpoint, dependsOn, dependsOn

### Community 110 - "Keyvaultresourceid Type Value"
Cohesion: 0.67
Nodes (3): type, value, keyVaultResourceId

### Community 111 - "Platformresourcegroupid Type Value"
Cohesion: 0.67
Nodes (3): platformResourceGroupId, type, value

## Knowledge Gaps
- **620 isolated node(s):** `common.sh script`, `$schema`, `languageVersion`, `contentVersion`, `_EXPERIMENTAL_WARNING` (+615 more)
  These have ≤1 connection - possible missing edges or undocumented components.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `template` connect `Metadata Builtinrolenames Generator` to `Resources Avmtelemetry Apiversion`, `Keys Privateendpoints Secrets`, `Parameters Enablepurgeprotection Properties`, `Defaultvalue Metadata Parameters`, `Definitions Privateendpointprivatednszonegrouptype Metadata`?**
  _High betweenness centrality (0.090) - this node is a cross-community bridge._
- **Why does `parameters` connect `Defaultvalue Metadata Parameters` to `Diagnosticsettings Items Metadata`, `Enablerbacauthorization Defaultvalue Metadata`, `Enablesoftdelete Defaultvalue Metadata`, `Enablevaultfordiskencryption Defaultvalue Metadata`, `Enablevaultfortemplatedeployment Defaultvalue Metadata`, `Metadata Builtinrolenames Generator`, `Keys Privateendpoints Secrets`, `Lock Metadata Nullable`, `Location Tags Description`, `Networkacls Metadata Nullable`, `Roleassignments Items Metadata`, `Sku Allowedvalues Defaultvalue`, `Softdeleteretentionindays Defaultvalue Metadata`, `Parameters Enablepurgeprotection Properties`, `Name Metadata Type`, `Publicnetworkaccess Allowedvalues Defaultvalue`, `Enablevaultfordeployment Defaultvalue Metadata`, `Accesspolicies Items Metadata`?**
  _High betweenness centrality (0.079) - this node is a cross-community bridge._
- **Why does `resources` connect `Resources Avmtelemetry Apiversion` to `Keyvault_accesspolicies Dependson Apiversion`, `Keyvault Apiversion Location`, `Metadata Builtinrolenames Generator`, `Keyvault_diagnosticsettings Apiversion Copy`, `Keyvault_keys Dependson Apiversion`, `Keyvault_lock Apiversion Condition`, `Keyvault_roleassignments Apiversion Copy`, `Keyvault_secrets Dependson Apiversion`, `Keyvault_privateendpoints Apiversion Copy`?**
  _High betweenness centrality (0.039) - this node is a cross-community bridge._
- **What connects `common.sh script`, `$schema`, `languageVersion` to the rest of the system?**
  _620 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Variables Json Outputs` be split into smaller, more focused modules?**
  _Cohesion score 0.04878048780487805 - nodes in this community are weakly interconnected._
- **Should `Infra Json Bootstrapresourcegroup` be split into smaller, more focused modules?**
  _Cohesion score 0.05121951219512195 - nodes in this community are weakly interconnected._
- **Should `Script Create-new-feature Common` be split into smaller, more focused modules?**
  _Cohesion score 0.12698412698412698 - nodes in this community are weakly interconnected._