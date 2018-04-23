/*-----------------------------------------------------------------------------
   Init

   Initialization of Styx, should not be edited
-----------------------------------------------------------------------------*/
{ styx
, extraConf ? {}
, pkgs ? import ./nixpkgs.nix {}
, changelog-src ? pkgs.fetchFromGitHub {
    owner = "fractalide"; repo = "fractalide";
    rev = "085888b4db13ccf01bfee5993318c6cc912696d8";
    sha256 = "145bccp42mjzxabq8syl9bw56qgbng2xdx6lp3l95cgbg3mb4dih";
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
    site-partials = lib.loadDir { dir = ./data/site-partials; inherit env; asAttrs = true; };
    blog = lib.sortBy "date" "dsc" (lib.loadDir { dir = ./data/blog; inherit env; });
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
      content  = lib.loadFile { file = ./content/index.md; env = { inherit (data) site-partials; }; };
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
    development-and-analysis = rec {
      path     = "/development-and-analysis/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/development-and-analysis.md; env = { inherit (data) site-partials; }; };
    };
    cardano-stake-pool = rec {
      path     = "/cardano-stake-pool/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/cardano-stake-pool.md; env = { inherit (data) site-partials; }; };
    };
    hyperflow = rec {
      path     = "/hyperflow/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/hyperflow.md; env = { inherit (data) site-partials; }; };
    };
    fractalmarket = rec {
      path     = "/fractalmarket/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/fractalmarket.md; env = { inherit (data) site-partials; }; };
    };
    blogIndex = lib.mkSplit {
      basePath     = "/blog/index";
      title        = "Blog";
      template     = templates.blog.index;
      layout       = templates.layout;
      itemsPerPage = conf.theme.blog.index.itemsPerPage;
      data         = blog.list;
    };

    blog = lib.mkPageList {
      data        = data.blog;
      pathPrefix  = "/blog/";
      template    = templates.blog.full;
      layout      = templates.layout;
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
