#!/usr/bin/env bash

set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
output_dir="$repo_root/docs/generated/bicep"

cd "$repo_root"
mkdir -p "$output_dir"

bicep docs generate \
  --pattern 'infra/**/*.bicep' \
  --outdir "$output_dir"