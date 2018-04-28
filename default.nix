{ pkgs ? import ./nixpkgs.nix {}
}:

let
  site-attrs = (pkgs.callPackage (import ./site.nix) {});
in
  site-attrs.site // site-attrs
