#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash python3 python3Packages.pyyaml

cd "${BASH_SOURCE[0]%/*}"/../../fractalide-hugo-theme/exampleSite/data/team/

for yaml in *.yml; do
  python ../../../../new-site/data/yaml2nix.py \
    < "$yaml" > ../../../../new-site/data/team/"${yaml%.yml}.nix"
done
