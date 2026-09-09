#!/usr/bin/env bash

set -euo pipefail

deployment_name='infra-dev'
output_file='apps/fabric-capacity/dev.local.bicepparam'
app_resource_group_name='rg-sample-fabric-dev'
capacity_name='samplefabricdev'
sku_name='F2'
administrator=''

usage() {
  cat <<'EOF'
Usage: sync-fabric-capacity-params.sh --administrator <upn-or-object-id> [options]

Options:
  --deployment <name>              Shared subscription deployment (default: infra-dev)
  --output <path>                  Local parameter file (default: apps/fabric-capacity/dev.local.bicepparam)
  --app-resource-group <name>      Application resource group name
  --capacity-name <name>           Fabric capacity name
  --sku <name>                     Fabric capacity SKU
  --administrator <value>          Fabric administrator UPN or object ID (required)
  -h, --help                       Show this help
EOF
}

while (($# > 0)); do
  case "$1" in
    --deployment)
      deployment_name=$2
      shift 2
      ;;
    --output)
      output_file=$2
      shift 2
      ;;
    --app-resource-group)
      app_resource_group_name=$2
      shift 2
      ;;
    --capacity-name)
      capacity_name=$2
      shift 2
      ;;
    --sku)
      sku_name=$2
      shift 2
      ;;
    --administrator)
      administrator=$2
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ -z "$administrator" ]]; then
  echo 'An administrator is required. Use --administrator with a UPN or object ID.' >&2
  exit 2
fi

command -v az >/dev/null
command -v jq >/dev/null

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

provisioning_state=$(az deployment sub show \
  --name "$deployment_name" \
  --query properties.provisioningState \
  --output tsv)

if [[ "$provisioning_state" != 'Succeeded' ]]; then
  echo "Deployment '$deployment_name' is not ready: $provisioning_state" >&2
  exit 1
fi

outputs=$(az deployment sub show \
  --name "$deployment_name" \
  --query properties.outputs \
  --output json)
parameters=$(az deployment sub show \
  --name "$deployment_name" \
  --query properties.parameters \
  --output json)

get_output() {
  jq -r --arg name "$1" '.[$name].value // empty' <<<"$outputs"
}

get_parameter() {
  jq -r --arg name "$1" '.[$name].value // empty' <<<"$parameters"
}

bootstrap_resource_group_id=$(get_output bootstrapResourceGroupId)
platform_resource_group_id=$(get_output platformResourceGroupId)
key_vault_resource_id=$(get_output keyVaultResourceId)
uami_resource_id=$(get_output uamiResourceId)
environment_name=$(get_parameter environmentName)
name_prefix=$(get_parameter namePrefix)
location=$(get_parameter location)

if [[ -z "$uami_resource_id" ]]; then
  echo "Deployment '$deployment_name' did not return uamiResourceId." >&2
  exit 1
fi

uami_principal_id=$(az identity show \
  --ids "$uami_resource_id" \
  --query principalId \
  --output tsv)

for required_value in \
  bootstrap_resource_group_id \
  platform_resource_group_id \
  key_vault_resource_id \
  uami_principal_id \
  environment_name \
  name_prefix \
  location; do
  if [[ -z "${!required_value}" ]]; then
    echo "Missing required value: $required_value" >&2
    exit 1
  fi
done

mkdir -p "$(dirname "$output_file")"
cat > "$output_file" <<EOF
using './vend.bicep'

param location = '$location'

param sharedBaseline = {
  environmentName: '$environment_name'
  namePrefix: '$name_prefix'
  location: '$location'
  bootstrapResourceGroupId: '$bootstrap_resource_group_id'
  platformResourceGroupId: '$platform_resource_group_id'
  keyVaultResourceId: '$key_vault_resource_id'
  uamiResourceId: '$uami_resource_id'
  uamiPrincipalId: '$uami_principal_id'
  tags: {
    Project: 'AzurePlatformLearning'
    Environment: '$environment_name'
  }
}

param appResourceGroupName = '$app_resource_group_name'
param capacityName = '$capacity_name'
param skuName = '$sku_name'
param administrators = [
  '$administrator'
]

param securityPrincipals = {
  identityOwnerObjectId: ''
  platformOwnerObjectId: ''
  applicationOwnerObjectId: ''
}

param resourceGroupTags = {
  Project: 'AzurePlatformLearning'
  Environment: '$environment_name'
  Owner: 'application-team'
  ManagedBy: 'bicep'
}

param tags = {
  Project: 'AzurePlatformLearning'
  Environment: '$environment_name'
  Owner: 'application-team'
  ManagedBy: 'bicep'
}
EOF

echo "Wrote $output_file from deployment '$deployment_name'."