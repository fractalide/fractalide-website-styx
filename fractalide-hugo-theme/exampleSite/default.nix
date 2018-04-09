{ bootPkgs ? import <nixpkgs> {}
, pinnedPkgsSrc ? bootPkgs.fetchFromGitHub { owner = "NixOS"; repo = "nixpkgs-channels";
  rev = "ea145b68a019f6fff89e772e9a6c5f0584acc02c";
  sha256 = "18jr124cbgc5zvawvqvvmrp8lq9jcscmn5sg8f5xap6qbg1dgf22"; }
, pkgs ? import pinnedPkgsSrc {}
, stdenvNoCC ? pkgs.stdenvNoCC
, hugo ? pkgs.hugo
}:

stdenvNoCC.mkDerivation {
  name = "site";
  buildInputs = [ hugo ];
  src = builtins.filterSource (path: type: type != "symlink" || null == builtins.match "result.*" (baseNameOf path)) ./..;
  buildPhase = ''
    cd exampleSite
    hugo
  '';
  installPhase = ''
    cp -a public $out
  '';
}
