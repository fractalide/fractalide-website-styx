{ bootPkgs ? import <nixpkgs> {}
, pinnedPkgsSrc ? bootPkgs.fetchFromGitHub { owner = "NixOS"; repo = "nixpkgs-channels";
  rev = "ea145b68a019f6fff89e772e9a6c5f0584acc02c";
  sha256 = "18jr124cbgc5zvawvqvvmrp8lq9jcscmn5sg8f5xap6qbg1dgf22"; }
, pkgs ? import pinnedPkgsSrc {}
}:

let
  site-attrs = (pkgs.callPackage (import ./site.nix) {});
in
  site-attrs.site // site-attrs
