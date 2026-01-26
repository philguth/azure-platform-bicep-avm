# Azure Platform (Bicep + AVM)

This repo is a small “platform foundation” example built with Bicep and Azure Verified Modules (AVM). It’s structured as two deployments:

- **Bootstrap**: creates shared foundational resources (a deployment identity and a Key Vault).
- **Platform**: creates a hub virtual network and connects to the Key Vault over Private Link (Private Endpoint + Private DNS).

It’s intended as a learning/reference codebase for using AVM modules with practical, secure-by-default Azure patterns.

## What this deploys

### Bootstrap stack (`infra/bootstrap`)

Deployed at **resource group** scope.

- User-assigned managed identity (UAMI)
- Key Vault via AVM module (`avm/res/key-vault/vault`)
	- RBAC authorization enabled
	- Soft delete enabled
	- Purge protection enabled
	- Public network access disabled

Outputs include the UAMI IDs and the Key Vault name/resourceId.

### Platform stack (`infra/platform`)

Deployed at **resource group** scope.

- Hub virtual network via AVM module (`avm/res/network/virtual-network`)
	- Subnet for private endpoints (policies disabled)
	- Subnet placeholder for Power Platform scenarios
- Private DNS zone for Key Vault Private Link (`privatelink.vaultcore.azure.net`)
- Private Endpoint to the bootstrap Key Vault
- DNS zone group + VNet link so the VNet resolves the Key Vault private endpoint

## Repo layout

```
infra/
	bootstrap/
		main.bicep         # bootstrap entrypoint
		dev.bicepparam     # example parameters
	platform/
		main.bicep         # platform entrypoint
		dev.bicepparam     # example parameters
		dev.local.bicepparam.example
		main.json          # compiled ARM template (generated)
```

`bicepconfig.json` configures module registry aliases.

## Prerequisites

- Azure CLI (`az`)
- Bicep (usually installed via Azure CLI: `az bicep install`)
- An Azure subscription you can deploy to

If you’re using this repo in a dev container, those tools are typically already installed.

## Deploy

The deployments are intentionally split: run bootstrap first, then platform.

### 1) Sign in and select subscription

```bash
az login
az account set --subscription <subscription-id-or-name>
```

### 2) Deploy bootstrap

Create a resource group and deploy the bootstrap stack:

```bash
az group create -n rg-<prefix>-bootstrap-dev -l eastus

az deployment group create \
	-g rg-<prefix>-bootstrap-dev \
	-f infra/bootstrap/main.bicep \
	-p infra/bootstrap/dev.bicepparam
```

Capture the Key Vault details from the deployment outputs:

```bash
az deployment group show -g rg-<prefix>-bootstrap-dev -n <deployment-name> --query properties.outputs
```

### 3) Configure platform parameters

In `infra/platform/dev.bicepparam`, set one of:

- `keyVaultResourceId` (preferred if you already have it), **or**
- `keyVaultName` + `keyVaultResourceGroupName` (keeps the params file portable)

### 4) Deploy platform

```bash
az group create -n rg-<prefix>-platform-dev -l eastus

az deployment group create \
	-g rg-<prefix>-platform-dev \
	-f infra/platform/main.bicep \
	-p infra/platform/dev.bicepparam
```

## Notes / gotchas

- The bootstrap Key Vault has **public network access disabled**. After deployment, you’ll only be able to reach it from a network path that can resolve and route to the private endpoint (e.g., a VM/jumpbox in the hub VNet, VPN/ExpressRoute, etc.).
- AVM module versions are pinned in the Bicep module references; update with care.

## AVM modules and versioning (how “latest” works)

This repo uses Azure Verified Modules (AVM) via Bicep Registry references like:

- `br/public:avm/res/key-vault/vault:0.12.0`
- `br/public:avm/res/network/virtual-network:0.7.1`

Important behavior to remember:

- The version after the colon (for example `:0.12.0`) is **pinned**.
- Builds/deployments will use that exact module version; it does **not** float forward to newer AVM versions automatically.
- This is intentional: pinning makes deployments repeatable and reduces the chance of unexpected breaking changes.

### How to update to a newer AVM version

1. Decide the target AVM version (from the AVM module documentation/release history).
2. Update the module reference in the relevant `main.bicep` file(s).
3. Rebuild and deploy.

For example, to update Key Vault from `0.12.0` to `0.13.0`, change:

`br/public:avm/res/key-vault/vault:0.12.0` → `br/public:avm/res/key-vault/vault:0.13.0`

### Where the module comes from

The `avm` alias is configured in `bicepconfig.json` to resolve to the AVM module path in `mcr.microsoft.com` (Microsoft Container Registry). During build/deploy, Bicep will restore the referenced module version into its local cache.

### Local module cache (why builds can work “offline”)

When Bicep restores registry modules, it caches them locally. In this dev container the cache is under:

- `~/.bicep/br/` (for Bicep Registry modules like `br/public:...`)

Once a specific module version is cached, subsequent builds can succeed without re-downloading it.

If you need to “refresh” a module restore (for example after changing versions), Bicep will fetch the new version automatically. To force a clean re-restore, you can delete the cache folder (for example `rm -rf ~/.bicep/br`).

## Useful commands

- Compile Bicep locally:

```bash
az bicep build -f infra/bootstrap/main.bicep
az bicep build -f infra/platform/main.bicep
```

- What-if:

```bash
az deployment group what-if -g rg-<prefix>-platform-dev -f infra/platform/main.bicep -p infra/platform/dev.bicepparam
```

## Validate Key Vault Private Link (test VM)

If you want to prove “Key Vault resolves to a private IP from inside the VNet” without setting up VPN, deploy a small Linux VM **without a public IP** into the hub VNet and run DNS/HTTPS checks.

### Deploy the VM

1. Copy the example params file and set your SSH public key:

```bash
cp infra/validation/test-vm/dev.local.bicepparam.example infra/validation/test-vm/dev.local.bicepparam
```

2. Deploy into the same resource group as the hub VNet:

```bash
az deployment group create \
	-g rg-<prefix>-platform-dev \
	-f infra/validation/test-vm/main.bicep \
	-p infra/validation/test-vm/dev.local.bicepparam
```

### Prove private DNS + connectivity

Run commands on the VM (no inbound connectivity required):

```bash
az vm run-command invoke \
	-g rg-<prefix>-platform-dev \
	-n <namePrefix>-testvm \
	--command-id RunShellScript \
	--scripts "sudo apt-get update -y && sudo apt-get install -y dnsutils curl" \
						"nslookup <yourKvName>.vault.azure.net" \
						"curl -I https://<yourKvName>.vault.azure.net"
```

Expected results:

- `nslookup` returns a `10.x.x.x` address (from the private endpoint subnet).
- `curl` returns quickly (often `401`/`403` is fine — that proves network path works).