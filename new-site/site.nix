/*-----------------------------------------------------------------------------
   Init

   Initialization of Styx, should not be edited
-----------------------------------------------------------------------------*/
{ styx
, extraConf ? {}
, pkgs ? import ./nixpkgs.nix {}
, changelog-src ? pkgs.fetchFromGitHub {
    owner = "fractalide"; repo = "fractalide";
    rev = "e13416ef732347ccfbda695e7d7b00f66bc26026";
    sha256 = "1v6k4z39xz990il4j40n027wc8zc29s20n5lmkwd2hymmdflzrxl";
  }
, changelog ? builtins.fromJSON (builtins.readFile "${changelog-src}/CHANGELOG.json")
}:

rec {

  /* Importing styx library
  */
  styxLib = import styx.lib styx;


/*-----------------------------------------------------------------------------
   Themes setup

-----------------------------------------------------------------------------*/

  /* Importing styx themes from styx
  */
  styx-themes = import styx.themes;

  /* list the themes to load, paths or packages can be used
     items at the end of the list have higher priority
  */
  themes = [
    styx-themes.generic-templates
    ./themes/fractalide
    ./themes/fractalide-site
  ];

  /* Loading the themes data
  */
  themesData = styxLib.themes.load {
    inherit styxLib themes;
    extraEnv = { inherit data pages; };
    extraConf = [ ./conf.nix extraConf ];
  };

  /* Bringing the themes data to the scope
  */
  inherit (themesData) conf lib files templates env;


/*-----------------------------------------------------------------------------
   Data

   This section declares the data used by the site
-----------------------------------------------------------------------------*/

  data = {
    inherit changelog;
  };


/*-----------------------------------------------------------------------------
   Pages

   This section declares the pages that will be generated
-----------------------------------------------------------------------------*/

  pages = rec {
    index = rec {
      path     = "/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/index.md; env = { inherit (templates) site-partials; }; };
    };
    roadmap = rec {
      path     = "/roadmap/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/roadmap.md; env = {
        inherit lib;
        inherit (data) changelog;
      }; };
    };
  };


/*-----------------------------------------------------------------------------
   Site

-----------------------------------------------------------------------------*/

  /* Converting the pages attribute set to a list
  */
  pageList = lib.pagesToList { inherit pages; };

  /* Generating the site
  */
  site = lib.mkSite { inherit files pageList; };

}
