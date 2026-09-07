# Client intake template: application baseline consumption

Use this document as the client-facing readiness checklist before a deployment is approved. It reuses the same contract structure as the platform-to-recipe onboarding model so provider-hosted PoCs and client-tenant deliveries can be compared consistently.

## 1. Tenant and scope

- [ ] Target tenant ID:
- [ ] Target subscription ID or subscription name:
- [ ] Deployment scope: subscription / resource group / two-step flow
- [ ] Intended environment: provider PoC / internal learning / non-production / production
- [ ] Application or workload name:
- [ ] Business owner or service owner:
- [ ] Platform owner and identity owner contacts:

## 2. Shared baseline contract

- [ ] Shared platform baseline already exists or will be deployed by the platform team
- [ ] Shared baseline outputs captured:
  - [ ] `bootstrapResourceGroupId`
  - [ ] `platformResourceGroupId`
  - [ ] `keyVaultResourceId`
  - [ ] `uamiResourceId`
  - [ ] `uamiPrincipalId`
  - [ ] `location`
  - [ ] `environmentName`
- [ ] App recipe will consume the shared baseline rather than redefining platform resources
- [ ] Any request for a new network, identity, Key Vault, or security boundary has been escalated to platform or identity owners

## 3. Application details

- [ ] Short application description:
- [ ] Purpose and business need:
- [ ] Planned resource group name:
- [ ] Region:
- [ ] Naming prefix or environment suffix:
- [ ] Workload SKU or sizing plan:
- [ ] App owner group or security principal IDs:
- [ ] App team contact and escalation path:

## 4. Networking and connectivity

- [ ] Private connectivity required: yes / no
- [ ] Existing VNet or private endpoint requirements:
- [ ] DNS suffix, private DNS integration, or private link requirements:
- [ ] Public ingress or egress requirements:
- [ ] Internet access constraints:
- [ ] Existing hub-and-spoke or landing-zone connectivity details:

## 5. Identity, access, and RBAC

- [ ] Identity owner group object ID:
- [ ] Platform owner group object ID:
- [ ] Application owner group object ID:
- [ ] Minimum Azure roles required at the intended scope:
  - [ ] Reader
  - [ ] Contributor
  - [ ] Key Vault Secrets User
  - [ ] Other:
- [ ] Service principal or managed identity requirement:
- [ ] Secrets stored in Key Vault or provided by platform baseline:
- [ ] Required approvals captured from identity and platform owners:

## 6. Security and compliance

- [ ] Data classification: public / internal / confidential / regulated
- [ ] Compliance or policy requirements:
- [ ] Logging, Monitoring, and Application Insights expectations:
- [ ] Backup and retention requirements:
- [ ] Cost center or chargeback code:
- [ ] Tagging plan and ownership labels:

## 7. Deployment plan

- [ ] Provider-hosted PoC or client-tenant deployment
- [ ] Proposed rollout date:
- [ ] Pre-deployment checklist complete:
- [ ] Shared platform validated and ready:
- [ ] App recipe environment values prepared:
- [ ] `azd up` and `azd down` plan reviewed for application-only scope:

## 8. Approvals and exceptions

- [ ] Platform owner approval obtained: yes / no
- [ ] Identity owner approval obtained: yes / no
- [ ] Client approval obtained: yes / no
- [ ] Exception request required: yes / no
- [ ] Exception summary and approvers recorded:

## 9. Sign-off

- [ ] Application team sign-off:
- [ ] Platform team sign-off:
- [ ] Identity team sign-off:
- [ ] Client or sponsor sign-off:
- [ ] Deployment date and version:
