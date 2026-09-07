# Fabric Capacity Alt app onboarding

This sample represents a second application deployment unit that consumes the same shared platform baseline as the primary Fabric sample.

The intent is to demonstrate a separate application ownership boundary while reusing the same platform contract:

- shared platform and bootstrap resources remain owned by the platform foundation
- this app owns its own resource group and workload configuration
- the owning team and RBAC inputs are explicit for the workload
- the same `sharedBaseline` object can be used across multiple app deployment units

Example usage:

```bash
az deployment sub what-if \
  --name app-fabric-alt-whatif \
  --location northcentralus \
  --template-file apps/fabric-capacity-alt/vend.bicep \
  --parameters \
    location=northcentralus \
    appResourceGroupName=rg-sample-app-alt-dev \
    capacityName=samplefabricaltdev \
    skuName=F2 \
    administrators='["owner-alt@example.com"]' \
    securityPrincipals='{ "identityOwnerObjectId": "<id>", "platformOwnerObjectId": "<id>", "applicationOwnerObjectId": "<id>" }'
```
