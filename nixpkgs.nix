{ bootPkgs ? import <nixpkgs> {}
, pinnedPkgsSrc ? bootPkgs.fetchFromGitHub { owner = "NixOS"; repo = "nixpkgs-channels";
  rev = "28b4f7b6ace4d7854294f96c190a4b6379136271";
  sha256 = "15wgf7yz9jv3wrsp6hbh0bjbwnd0h2siisjyy1ma5l8bwx2dr8l1"; }
, pkgs ? import pinnedPkgsSrc {}
}:
bootPkgs
