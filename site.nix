/*-----------------------------------------------------------------------------
   Init

   Initialization of Styx, should not be edited
-----------------------------------------------------------------------------*/
{ styx
, extraConf ? {}
, pkgs ? import ./nixpkgs.nix {}
, fractalide-src ? pkgs.fetchFromGitHub {
    owner = "fractalide"; repo = "fractalide";
    rev = "42ab8f70e62f51e7e71d5b258aabdc8dd3e47605";
    sha256 = "0h8wj87k8x42ixcyb7vyqa4199z71cqfhvkhx5xckh089fhc6zbs";
  }
, changelog ? builtins.fromJSON (builtins.readFile "${fractalide-src}/CHANGELOG.json")
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
    blog = lib.sortBy "date" "dsc" (lib.loadDir { dir = ./data/blog; inherit env; });
    inherit changelog;
    nav = import ./data/nav.nix { inherit pages templates; };
    site-partials = lib.loadDir { dir = ./data/site-partials; inherit env; asAttrs = true; };
    team = lib.loadDir { dir = ./data/team; };
    faqs = import ./data/faqs.nix;
  };

/*-----------------------------------------------------------------------------
   Pages

   This section declares the pages that will be generated
-----------------------------------------------------------------------------*/

  pages = let site-partials = data.site-partials; in rec {
    contact = rec {
      path     = "/contact/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/contact.md; env = {}; };
    };

    documentation = rec {
      title    = "Documentation";
      path     = "/documentation/index.html";
      template = templates.page.full;
      layout   = templates.layout;
      content  = builtins.readFile (
        pkgs.runCommand "doc-index" {
          buildInputs = [ pkgs.styx ];
          allowSubstitutes = false;
          src = fractalide-src;
        } ''
          asciidoctor -b xhtml5 -s -a showtitle -o- $src/doc/index.adoc > $out
        ''
      );
      footer   = "";
    };

    index = rec {
      path     = "/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = [ content ];
      content  = lib.loadFile { file = ./content/index.md; env = { inherit (data) site-partials; }; };
    };

    research = rec {
      title    = "Research";
      section  = "research";
      path     = "/research/index.html";
      template = templates.page.full;
      layout   = templates.layout;
      content  = (lib.loadFile { file = ./content/research.md; }).content;
      footer   = "";
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
      title    = "Development and Analysis";
      section  = "development_and_analysis";
      path     = "/development-and-analysis/index.html";
      template = templates.page.full;
      layout   = templates.layout;
      content  = (lib.loadFile { file = ./content/development-and-analysis.md; }).content;
      extraContent = site-partials.signup.content;
    };

    cardano-stake-pool = rec {
      title    = "Cardano Stake Pool";
      section  = "cardano";
      path     = "/cardano-stake-pool/index.html";
      template = templates.page.full;
      layout   = templates.layout;
      content  = (lib.loadFile { file = ./content/cardano-stake-pool.md; }).content;
      extraContent = site-partials.signup.content;
    };

    hyperflow = rec {
      title    = "Hyperflow";
      section  = "hyperflow";
      path     = "/hyperflow/index.html";
      template = templates.page.full;
      layout   = templates.layout;
      content  = sections.hyperflow.content;
      extraContent = sections.hyperflow_modes.content + site-partials.signup.content;
      sections = lib.loadDir { dir = ./content/hyperflow; asAttrs = true; };
      inherit (data) site-partials;
    };

    fractalmarket = rec {
      title    = "Fractalmarket";
      section  = "fractalmarket";
      path     = "/fractalmarket/index.html";
      template = templates.page.full;
      layout   = templates.layout;
      content  = (lib.loadFile { file = ./content/fractalmarket.md; }).content;
      extraContent = site-partials.signup.content;
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
      title        = "About us";
      section      = "about_us";
      path         = "/about_us/index.html";
      template     = templates.page.sections;
      layout       = templates.layout;
      lede         = sections.lede.content;
      sectionOrder = [ "team" "vision" ];
      sections     = lib.loadDir {
        dir = ./content/about_us;
        env = { inherit (data) team; inherit lib; };
        asAttrs = true;
      };
    };

    faqs = rec {
      title    = "FAQs";
      section  = "faqs";
      path     = "/faqs/index.html";
      template = templates.page.full;
      layout   = templates.layout;
      content  = sections.faqs.content;
      footer   = sections.footer.content;
      sections = lib.loadDir {
        dir = ./content/faqs;
        env = { inherit (data) faqs; inherit lib; };
        asAttrs = true;
      };
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
  site = lib.mkSite {
    inherit files pageList;
    postGen = ''
      echo "${conf.domain}" > $out/CNAME
    '';
  };
}
