{ pkgs ? import ./nixpkgs.nix {} }:

let
  site-attrs = pkgs.callPackage ./site.nix { };
in
  site-attrs.site // site-attrs
