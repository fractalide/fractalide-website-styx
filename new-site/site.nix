/*-----------------------------------------------------------------------------
   Init

   Initialization of Styx, should not be edited
-----------------------------------------------------------------------------*/
{ styx
, extraConf ? {}
, pkgs ? import ./nixpkgs.nix {}
, fractalide-src ? pkgs.fetchFromGitHub {
    owner = "fractalide"; repo = "fractalide";
    rev = "27395e8ecc781a01da58c39a6eea01981940b334";
    sha256 = "0j6cbpnwj84dc4hbnv74av7zdzpw22zbp5xsby9b6cr3anwx1cy6";
  }
, changelog ? builtins.fromJSON (builtins.readFile "${fractalide-src}/CHANGELOG.json")
}:

let
  fractalide-docs = pkgs.stdenvNoCC.mkDerivation {
    name = "fractalide-docs";
    src = fractalide-src;
    phases = "unpackPhase installPhase";
    buildInputs = [ pkgs.findutils pkgs.gnused ];
    installPhase = ''
      mkdir $out
      find . -name '*.adoc' -exec bash -c 'outname=$(echo "$1" | sed -e "s,^./,," -e s,/,_,g); exec cp "$1" "$out/$outname"' cp {} ';'
    '';
  };
in
  
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
    blog = lib.sortBy "date" "dsc" (lib.loadDir { dir = ./data/blog; inherit env; });
    inherit changelog;
    site-partials = lib.loadDir { dir = ./data/site-partials; inherit env; asAttrs = true; };
    team = lib.loadDir { dir = ./data/team; };
    faqs = import ./data/faqs.nix;
    documentation = lib.loadDir {
      dir = fractalide-docs;
    };
  };

  doc-index-content = pkgs.runCommand "doc-index" {
    buildInputs = [ pkgs.styx ];
    allowSubstitutes = false;
    src = fractalide-src;
  } ''
    asciidoctor -b xhtml5 -s -a showtitle -o- $src/doc/index.adoc > $out
  '';

  doc-pages = builtins.listToAttrs (builtins.map (docpage:
    let subpath = builtins.replaceStrings [ "_" ] [ "/" ] docpage.fileData.basename; in
    {
      name = docpage.fileData.basename;
      value = rec {
        path = "/fractalide/${subpath}.html";
        template = templates.container;
        layout = templates.layout;
        content = if docpage.fileData.basename == "doc_index" then
          builtins.readFile doc-index-content
        else docpage.content;
      };
    } 
  ) data.documentation);


/*-----------------------------------------------------------------------------
   Pages

   This section declares the pages that will be generated
-----------------------------------------------------------------------------*/

  pages = rec {
    contact = rec {
      path     = "/contact/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/contact.md; env = {}; };
    };

    index = rec {
      path     = "/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/index.md; env = { inherit (data) site-partials; }; };
    };

    research = rec {
      path     = "/research/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/research.md; env = {}; };
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

    sitemap = {
      path     = "/sitemap.xml";
      template = templates.sitemap;
      layout   = lib.id;
      pages    = lib.pagesToList { inherit pages; };
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

    feed = {
      path     = "/blog/feed.xml";
      template = templates.feed.atom;
      items    = lib.take 10 blog.list;
      layout   = lib.id;
    };

    err_404 = rec {
      path     = "/404.html";
      title    = "404 Page Not Found";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/404.md; env = { inherit conf; }; };
    };

    about_us = rec {
      path     = "/about_us/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/about_us.md; env = {
        inherit (data) team;
        inherit lib;
      }; };
    };

    faqs = rec {
      path     = "/faqs/index.html";
      title    = "FAQs";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/faqs.md; env = {
        inherit (data) faqs;
        inherit lib title;
      }; };
    };
  } // doc-pages;


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
