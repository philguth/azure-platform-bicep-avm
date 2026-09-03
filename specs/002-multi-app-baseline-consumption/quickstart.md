# Quickstart: Multi-Application Baseline Consumption

## Purpose

Use this guide to validate the design for multi-application onboarding against
the current repository structure and task plan before implementation begins.

## Prerequisites

- Devcontainer rebuilt from the current repo baseline
- Azure CLI authenticated to a non-production subscription
- Current shared baseline parameter file available at `infra/dev.bicepparam`
- Current sample application deployment available under `apps/fabric-capacity/`
- Understanding of which scenario is provider-hosted in your own tenant versus
   client-tenant delivery in a client environment

## Scenario 1: Validate the shared platform baseline still deploys independently

1. Run a what-if for the shared baseline:

   ```sh
   az deployment sub what-if \
     --name infra-dev-whatif \
     --location northcentralus \
     --template-file infra/main.bicep \
     --parameters infra/dev.bicepparam
   ```

2. Confirm the result affects only the shared bootstrap and platform scopes.
3. Review the expected bootstrap and platform resource groups and outputs.

Expected outcome:
- Shared foundation is deployable without any application-specific template
  changes.

## Scenario 2: Validate a subscription-scope app onboarding shape

1. Review `apps/fabric-capacity/vend.bicep` as the current application recipe
   or app onboarding pattern.
2. Run a what-if with application-specific values:

   ```sh
   az deployment sub what-if \
     --name app-fabric-whatif \
     --location northcentralus \
     --template-file apps/fabric-capacity/vend.bicep \
     --parameters location=northcentralus appResourceGroupName=rg-sample-app-dev capacityName=samplefabricdev skuName=F2 administrators='["owner@example.com"]'
   ```

3. Confirm the deployment creates only the application resource group and
   workload resources.

Expected outcome:
- Application onboarding can use a subscription-scope wrapper without modifying
  shared platform templates.

## Scenario 3: Validate the platform-to-recipe interface contract

1. Review the shared contract in [contracts/application-baseline-contract.md](./contracts/application-baseline-contract.md).
2. Identify which values are platform outputs and which are recipe inputs for
   the current `apps/fabric-capacity/` sample.
3. Confirm the current field mapping includes the `infra/main.bicep` outputs
   `bootstrapResourceGroupId`, `platformResourceGroupId`, `keyVaultName`,
   `keyVaultResourceId`, and `uamiResourceId` as published platform outputs.
4. Confirm the current field mapping includes the `apps/fabric-capacity/vend.bicep`
   inputs `location`, `appResourceGroupName`, `capacityName`, `skuName`,
   `administrators`, `resourceGroupTags`, and `tags` as recipe-owned inputs.
5. Confirm the recipe can consume only published shared capabilities without
   redefining platform-owned resources.

Expected outcome:
- Reviewers can trace the handoff from the shared platform landing zone to the
   application recipe without inspecting unrelated implementation details.

## Scenario 4: Validate ownership boundaries during review

1. Compare the shared baseline contract in [contracts/application-baseline-contract.md](./contracts/application-baseline-contract.md) with the ownership rules in [contracts/ownership-boundary-contract.md](./contracts/ownership-boundary-contract.md).
2. Review one application request that consumes only published capabilities.
3. Review one application request that asks for a new shared network or identity
   exception.

Expected outcome:
- Reviewers can determine which changes remain application-owned and which must
  be escalated to identity or platform owners.

## Scenario 5: Validate the two-landing-zone deployment flow

1. Treat `infra/` as the platform landing zone and `apps/` as the application
   landing zone or recipe surface.
2. Walk the intended sequence: validate platform, publish outputs, prepare
   recipe inputs, review ownership boundaries, then deploy the application
   recipe.
3. Confirm that a change in one application recipe does not imply a redeploy of
   the shared platform landing zone or another application recipe.

Expected outcome:
- The repository supports a reference deployment flow where AVM-based platform
  composition and recipe-based application onboarding stay separated but
  contractually connected.

## Scenario 6: Validate provider-hosted PoC readiness

1. Treat the current shared baseline as a provider-owned demo or learning
   environment.
2. Review the contract and identify which values may be supplied from provider
   defaults for a rapid PoC.
3. Confirm the onboarding definition still records the same categories that a
   later client-tenant deployment will need.

Expected outcome:
- A PoC can be deployed quickly in the provider tenant without inventing a
  separate onboarding model.

## Scenario 7: Validate client-tenant onboarding readiness

1. Reuse the same application baseline contract as a client-facing intake
   checklist.
2. Identify which fields must now be supplied or approved by the client,
   including tenant, subscription, networking, identity, RBAC, and operational
   ownership values.
3. Confirm that provider defaults are either replaced or explicitly approved
   before client deployment.

Expected outcome:
- The same contract structure supports a governed handoff from provider-hosted
  PoC to client-tenant delivery.

## Scenario 8: Validate repeatability after deployment

1. After any non-production deployment, rerun the same what-if command.
2. Inspect whether the expected changes are empty or limited to known drift.
3. Confirm that one application's review or rollout path does not require
   redeploying a separate application's resources.

Expected outcome:
- Shared baseline and application deployment units remain safe to re-run and can
  be reasoned about independently.