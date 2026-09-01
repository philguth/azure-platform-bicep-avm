# Quickstart: Multi-Application Baseline Consumption

## Purpose

Use this guide to validate the design for multi-application onboarding against
the current repository structure before implementation tasks are created.

## Prerequisites

- Devcontainer rebuilt from the current repo baseline
- Azure CLI authenticated to a non-production subscription
- Current shared baseline parameter file available at `infra/dev.bicepparam`
- Current sample application deployment available under `apps/fabric-capacity/`

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

1. Review `apps/fabric-capacity/vend.bicep` as the current app onboarding
   pattern.
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

## Scenario 3: Validate ownership boundaries during review

1. Compare the shared baseline contract in [contracts/application-baseline-contract.md](./contracts/application-baseline-contract.md) with the ownership rules in [contracts/ownership-boundary-contract.md](./contracts/ownership-boundary-contract.md).
2. Review one application request that consumes only published capabilities.
3. Review one application request that asks for a new shared network or identity
   exception.

Expected outcome:
- Reviewers can determine which changes remain application-owned and which must
  be escalated to identity or platform owners.

## Scenario 4: Validate repeatability after deployment

1. After any non-production deployment, rerun the same what-if command.
2. Inspect whether the expected changes are empty or limited to known drift.
3. Confirm that one application's review or rollout path does not require
   redeploying a separate application's resources.

Expected outcome:
- Shared baseline and application deployment units remain safe to re-run and can
  be reasoned about independently.