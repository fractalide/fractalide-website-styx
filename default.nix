{ pkgs ? import ./nixpkgs.nix {}
, whitepaper ? ""
}:

let
  site-attrs = pkgs.callPackage ./site.nix { inherit whitepaper; };
in
  site-attrs.site // site-attrs
