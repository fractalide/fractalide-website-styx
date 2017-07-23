/*-----------------------------------------------------------------------------
   Init

   Initialization of Styx, should not be edited
-----------------------------------------------------------------------------*/
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

  /* Site locales
  */
  locales = {
    eng = { prefix = "/"; };
    zho = { prefix = "/zho/"; };
  };


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

  /* Loading the themes data for each locale
  */
  themesData = styxLib.mapAttrs (name: value:
    styxLib.themes.load {
      inherit styxLib themes;
      extraConf = [ ./conf.nix extraConf ];
      extraEnv = value // { locale = name; };
    }
  ) locales;

  /* Bringing locale independent theme data to scope
  */
  inherit (themesData.eng) conf lib files;

  # Adding environment to locales
  locales.eng.env = themesData.eng.env;
  locales.zho.env = themesData.zho.env;


/*-----------------------------------------------------------------------------
   Data

   This section declares the data used by the site
-----------------------------------------------------------------------------*/

  /*---------------- 
    English
  ----------------*/
  locales.eng.data = with locales.eng; with locales.eng.env; {
    # to avoid name clash with pages
    loaded = {
      #news   = lib.sortBy "date" "dsc" (lib.loadDir { dir = ./data/eng/news; inherit env; });
      blocks = lib.loadDir { dir = ./data/eng/blocks; inherit env; asAttrs = true; };
      pages  = lib.loadDir { dir = ./data/eng/pages;  inherit env; asAttrs = true; };
    };

    # Menu
    menu = let
      # block entries
      blockEntries = map (n:
        let block = lib.find { id = n; } pages.index.blocks;
        in block // { navbarClass = "page-scroll"; url = "${prefix}#${block.id}"; }
      ) [ "vision" "whitepaper" "ico" "team" ];
      # entries
      entries = [
        pages.faq
        { title = "Documentation"; path = "/documentation/index.html"; }
        { title = "GitHub";        url  = "https://github.com/fractalide/fractalide"; }
        (locales.zho.pages.index // { title = "中文"; })
      ];
    in 
       blockEntries ++ entries;
  };

  /*---------------- 
    Chinese
  ----------------*/
  locales.zho.data = with locales.zho; with locales.zho.env; {
    # to avoid name clash with pages
    loaded = {
      #news   = lib.sortBy "date" "dsc" (lib.loadDir { dir = ./data/zho/news; inherit env; });
      blocks = lib.loadDir { dir = ./data/zho/blocks; inherit env; asAttrs = true; };
      pages  = lib.loadDir { dir = ./data/zho/pages;  inherit env; asAttrs = true; };
    };

    # Menu
    menu = let
      # block entries
      blockEntries = map (n:
        let block = lib.find { id = n; } pages.index.blocks;
        in block // { navbarClass = "page-scroll"; url = "${prefix}#${block.id}"; }
      ) [ "vision" "whitepaper" "ico" "team" ];
      # entries
      entries = [
        pages.faq
        { title = "软件文献"; path = "/documentation/index.html"; }
        { title = "GitHub"; url = "https://github.com/fractalide/fractalide"; }
        (locales.eng.pages.index // { title = "English"; })
      ];
    in 
       blockEntries ++ entries;
  };


/*-----------------------------------------------------------------------------
   Pages

   This section declares the pages that will be generated
-----------------------------------------------------------------------------*/

  /*---------------- 
    English
  ----------------*/
  locales.eng.pages = with locales.eng; with locales.eng.env; rec {
    index = {
      title    = "Home";
      path     = prefix + "/index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = let
        darken = d: d // { class = "bg-light-gray"; };
      in [
        (templates.blocks.banner   data.loaded.blocks.main-banner)
        (templates.blocks.standard data.loaded.blocks.taster)
        #(templates.blocks.news     (data.loaded.blocks.news // { items = news.list; }))
        (templates.blocks.standard (darken (data.loaded.blocks.vision)))
        (templates.blocks.standard data.loaded.blocks.hyperflow)
        (templates.blocks.standard (darken data.loaded.blocks.fractalmarket))
        (templates.blocks.standard data.loaded.blocks.etherflow)
        (templates.blocks.standard (darken data.loaded.blocks.whitepaper))
        (templates.blocks.standard (data.loaded.blocks.ico // { navbarTitle = "ICO"; }))
        (templates.blocks.team     (darken data.loaded.blocks.team))
      ];
      body.class = "home";
    };

    /*
    newsIndex = lib.mkSplit {
      title        = "News";
      basePath     = prefix + "news/index";
      itemsPerPage = conf.theme.news.index.itemsPerPage;
      template     = templates.news.index;
      data         = news.list;
    };

    news = lib.mkPageList {
      data        = data.loaded.news;
      pathPrefix  = prefix + "news/";
      template    = templates.news.full;
    };
    */

    faq = {
      path  = prefix + "faq.html";
      template = env.templates.pages.faq;
    } // data.loaded.pages.faq;
  };
  
  /*---------------- 
    Chinese
  ----------------*/
  locales.zho.pages = with locales.zho; with locales.zho.env; rec {
    index = {
      title    = "Home";
      path     = prefix + "index.html";
      template = templates.block-page.full;
      layout   = templates.layout;
      blocks   = let
        darken = d: d // { class = "bg-light-gray"; };
      in [
        (templates.blocks.banner   data.loaded.blocks.main-banner)
        (templates.blocks.standard data.loaded.blocks.taster)
        #(templates.blocks.news     (data.loaded.blocks.news // { items = news.list; }))
        (templates.blocks.standard (darken (data.loaded.blocks.vision)))
        (templates.blocks.standard data.loaded.blocks.hyperflow)
        (templates.blocks.standard (darken data.loaded.blocks.fractalmarket))
        (templates.blocks.standard data.loaded.blocks.etherflow)
        (templates.blocks.standard (darken data.loaded.blocks.whitepaper))
        (templates.blocks.standard (data.loaded.blocks.ico // { navbarTitle = "ICO"; }))
        (templates.blocks.team     (darken data.loaded.blocks.team))
      ];
      body.class = "home";
    };

    /*
    newsIndex = lib.mkSplit {
      title        = "公告新闻";
      basePath     = prefix + "news/index";
      itemsPerPage = conf.theme.news.index.itemsPerPage;
      template     = templates.news.index;
      data         = news.list;
    };

    news = lib.mkPageList {
      data        = data.loaded.news;
      pathPrefix  = prefix + "news/";
      template    = templates.news.full;
    };
    */

    faq = {
      path  = prefix + "faq.html";
      template = env.templates.pages.faq;
    } // data.loaded.pages.faq;
  
  };


/*-----------------------------------------------------------------------------
   Site rendering

-----------------------------------------------------------------------------*/

  # converting pages attribute set to a list
  pageList = let
    localePages = lib.mapAttrsToList (name: locale: 
      lib.pagesToList {
        pages = locale.pages;
        default = {
          layout = locale.env.templates.layout;
          body.id = "page-top";
        };
      }
    ) locales;
  in lib.fold (acc: x: acc ++ x) [] localePages;

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

  site = lib.mkSite {
    inherit files pageList;
    postGen = with lib; ''
      # Documentation generation
      ${lib.concatStringsSep "\n" (map (version: ''
        mkdir -p $out/documentation/${version.rev}/
        cp -r ${fetchUpstream version}/share/doc/fractalide/* $out/documentation/${version.rev}
      '') docVersions)}
      cp -r ${fetchUpstream (lib.head docVersions)}/share/doc/fractalide/* $out/documentation/

      # Generating CNAME
      echo "${conf.domain}" > $out/CNAME
    '';
  };

}
