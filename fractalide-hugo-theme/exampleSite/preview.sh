#!/usr/bin/env bash

cd "${BASH_SOURCE[0]%/*}"

exec nix-shell --run "xargs -0 hugo serve" < <(printf "%s\0" "$@")
