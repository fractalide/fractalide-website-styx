#!/usr/bin/env bash

cd "${BASH_SOURCE[0]%/*}"

exec nix-shell --run "xargs -0 styx live" < <( (( $# > 0 )) && printf "%s\0" "$@")
