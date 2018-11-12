#!/usr/bin/env bash

set -euo pipefail

cd "${BASH_SOURCE[0]%/*}"

styx=$(nix-build --no-out-link ./nixpkgs.nix -A styx)
exec $styx/bin/styx preview "$@"
