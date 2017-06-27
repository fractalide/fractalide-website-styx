/*-----------------------------------------------------------------------------
   Init

   Initialization of Styx, should not be edited
-----------------------------------------------------------------------------*/
#{ lib, styx, runCommand, writeText
{ lib, runCommand, writeText
, fetchFromGitHub
, styx-themes
, extraConf ? {}
}@args:

rec {

  # Pinning styx to dev version
  devStyx = fetchFromGitHub {
    owner  = "styx-static";
    repo   = "styx";
    rev    = "4a3d603";
    sha256 = "01frvrvrfh3jzsjgqxz4398x0kk1wl44krbagbwr50xvahjmr80a";
  };

  styx = import devStyx {};

  /* Library loading
  */
  styxLib = import styx.lib (args // { inherit styx; });


/*-----------------------------------------------------------------------------
   Themes setup

-----------------------------------------------------------------------------*/

  # pinning generic-templates to dev version
  devGenTemp = fetchFromGitHub {
    owner  = "styx-static";
    repo   = "styx-theme-generic-templates";
    rev    = "646df22";
    sha256 = "0jk29bkw5q6cmcr3402272jwl5pdjiv0a21i94d54rcb4iy78b6g";
  };

  /* list the themes to load, paths or packages can be used
     items at the end of the list have higher priority
  */
  themes = [
    devGenTemp
    ./themes/fractalide
  ];

  /* Loading the themes data
  */
  themesData = styxLib.themes.load {
    inherit styxLib themes;
    extraEnv  = { inherit data pages; };
    extraConf = [ ./conf.nix extraConf ];
  };

  /* Bringing the themes data to the scope
  */
  inherit (themesData) conf lib files templates env;


/*-----------------------------------------------------------------------------
   Data

   This section declares the data used by the site
-----------------------------------------------------------------------------*/

  data = with lib; {

    news = sortBy "date" "dsc" (loadDir { dir = ./data/news; inherit env; });

    blocks = loadDir { dir = ./data/blocks; inherit env; asAttrs = true; };

    pages = loadDir { dir = ./data/pages; inherit env; asAttrs = true; };

    /* Menu
    */
    menu = let
      indexBlocks = pages.index.blocks;
      /* Generating menu entries from index blocks
      */
      bItems = map (n:
        let block = find { id = n; } indexBlocks;
        in block // { navbarClass = "page-scroll"; url = "/#${block.id}"; }
      ) [ "vision" "whitepaper" "ico" "team" ];
    in bItems
    # normal menu entries
    ++ [
      pages.faq
      { title = "Documentation"; path = "/documentation/index.html"; }
      { title = "GitHub"; url = "https://github.com/fractalide/fractalide"; }
    ];

  };


/*-----------------------------------------------------------------------------
   Pages

   This section declares the pages that will be generated
-----------------------------------------------------------------------------*/

  pages = rec {
    index = {
      title    = "Home";
      path     = "/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = let
        darken = d: d // { class = "bg-light-gray"; };
      in [
        (templates.blocks.banner data.blocks.main-banner)
        (templates.blocks.news (data.blocks.news // { items = pages.news.list; }))
        (templates.blocks.vision (darken (data.blocks.vision)))
        (templates.blocks.whitepaper data.blocks.whitepaper)
        (templates.blocks.ico (darken (data.blocks.ico // { navbarTitle = "ICO"; })))
        (templates.blocks.team data.blocks.team)
      ];
      body.class = "home";
    };

    newsIndex = lib.mkSplit {
      title        = "news";
      basePath     = "/news/index";
      itemsPerPage = conf.theme.news.index.itemsPerPage;
      template     = templates.news.index;
      data         = news.list;
    };

    news = lib.mkPageList {
      title       = "News";
      data        = data.news;
      pathPrefix  = "/news/";
      template    = templates.news.full;
    };

    faq = {
      title = "FAQ";
      path  = "/faq.html";
      template = templates.pages.faq;
    } // data.pages.faq;
  };


/*-----------------------------------------------------------------------------
   Site rendering

-----------------------------------------------------------------------------*/

  # fetch upstream to generate the documentation
  fetchUpstream = version:
    let
      repo = fetchFromGitHub ({
        owner = "fractalide";
        repo  = "fractalide";
      } // version);
    in import "${repo}/doc" {};

  /* Versions of documentation to generate
     Head of list will be the main documentation
  */
  docVersions = [ {
    rev    = "15b7698";
    sha256 = "1cxb3zfn0fxim7fpdryqncirz922i2kqiawmisrm5fdfgh9ba7jb";
  } ];

  # converting pages attribute set to a list
  pageList = lib.pagesToList {
    inherit pages;
    default = {
      layout = templates.layout;
      body.id = "page-top";
    };
  };

  site = lib.mkSite {
    inherit files pageList;
    postGen = with lib; ''
      # Documentation generation
      ${lib.concatStringsSep "\n" (map (version: ''
        mkdir -p $out/documentation/${version.rev}/
        cp -r ${fetchUpstream version}/share/doc/fractalide/* $out/documentation/${version.rev}
      '') docVersions)}
      cp -r ${fetchUpstream (lib.head docVersions)}/share/doc/fractalide/* $out/documentation/
    '';
  };

}
