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


  # Make a block attribute set
  mkBlockSet = blocks: prefix:
    map (id:
      (lib.find { inherit id; } blocks) // { navbarClass = "page-scroll"; url = prefix + "/#${id}"; }
    );

  # Darken a block by adding a css class
  darken = d: d // { class = "bg-light-gray"; };

  # Generate index page blocks
  mkIndexBlocks = { templates, data, pages }: [
    (templates.banner            data.main-banner)
    (templates.standard          data.taster)
   #(templates.news             (data.news // { items = pages.news.list; }))
    (templates.standard (darken  data.vision))
    (templates.standard          data.hyperflow)
    (templates.standard (darken  data.fractalmarket))
    (templates.standard          data.etherflow)
    (templates.standard (darken  data.whitepaper))
    (templates.standard          data.ico)
    (templates.team     (darken  data.team))
  ];


/*-----------------------------------------------------------------------------
   Themes setup

-----------------------------------------------------------------------------*/

  /* list the themes to load, paths or packages can be used
     items at the end of the list have higher priority
  */
  themes = [
    # pinning generic-templates to dev version
    (fetchFromGitHub {
      owner  = "styx-static";
      repo   = "styx-theme-generic-templates";
      rev    = "f98b002";
      sha256 = "1fqskc22y3wl570v7f10s2qzfpx79f2fni8j49fmy2jxq0054zfk";
    })
    ./themes/fractalide
  ];

  /* Loading the themes data for each locale
  */
  themesData = styxLib.mapAttrs (name: value:
    styxLib.themes.load {
      inherit styxLib themes;
      extraConf = [ ./conf.nix extraConf ];
      extraEnv = value;
    }
  ) locales;

  /* Bringing locale independent theme data to scope
  */
  inherit (themesData.eng) conf lib files env;



/*-----------------------------------------------------------------------------
   English

   This section declares English locale data and pages
-----------------------------------------------------------------------------*/

  locales.eng = rec {
    # Locale code
    locale = "eng";

    # Html lang
    html.lang = "en";

    # Prefix
    prefix = "";

    # Environment
    inherit (themesData."${locale}") env;

    /*------------
      Data
    ------------*/
    data = with env; {
      # to avoid name clash with pages
      loaded = {
        #news   = lib.sortBy "date" "dsc" (lib.loadDir { dir = ./data/eng/news; inherit env; });
        blocks = lib.loadDir { dir = ./data/eng/blocks; inherit env; asAttrs = true; };
        pages  = lib.loadDir { dir = ./data/eng/pages;  inherit env; asAttrs = true; };
      };

      # Menu
      menu = (mkBlockSet pages.index.blocks prefix [ "vision" "whitepaper" "ico" "team" ])
        ++ [
          pages.faq
          { title = "Documentation"; path = "/documentation/index.html"; }
          { title = "GitHub";        url  = "https://github.com/fractalide/fractalide"; }
          (templates.bootstrap.navbar.nav_dropdown {
            title = "English";
            items = [
              (locales.zho.pages.index // { title = "中文"; })
              (locales.jpn.pages.index // { title = "日本語"; })
            ];
          })
        ];
    };

    /*------------
      Pages
    ------------*/
    pages = with env; rec {
      index = {
        title    = "Home";
        path     = prefix + "/index.html";
        template = templates.block-page.full;
        layout   = templates.layout;
        blocks   = mkIndexBlocks { templates = templates.blocks; data = data.loaded.blocks; inherit pages; };
        body.class = "home";
      };
   
      /*
      newsIndex = lib.mkSplit {
        title        = "News";
        basePath     = prefix + "/news/index";
        itemsPerPage = conf.theme.news.index.itemsPerPage;
        template     = templates.news.index;
        data         = news.list;
      };
   
      news = lib.mkPageList {
        data        = data.loaded.news;
        pathPrefix  = prefix + "/news/";
        template    = templates.news.full;
      };
      */
   
      faq = {
        path     = prefix + "/faq.html";
        template = templates.pages.faq;
      } // data.loaded.pages.faq;
    };
  };



/*-----------------------------------------------------------------------------
   Chinese

   This section declares Chinese locale data and pages
-----------------------------------------------------------------------------*/

  locales.zho = rec {
    # Locale code
    locale = "zho";

    # Prefix
    prefix = "/${locale}";

    # Html lang
    html.lang = "zh";

    # Environment
    inherit (themesData."${locale}") env;

    /*------------
      Data
    ------------*/
    data = with env; {
      # to avoid name clash with pages
      loaded = {
        #news   = lib.sortBy "date" "dsc" (lib.loadDir { dir = ./data/zho/news; inherit env; });
        blocks = lib.loadDir { dir = ./data/zho/blocks; inherit env; asAttrs = true; };
        pages  = lib.loadDir { dir = ./data/zho/pages;  inherit env; asAttrs = true; };
      };

      # Menu
      menu = (mkBlockSet pages.index.blocks prefix [ "vision" "whitepaper" "ico" "team" ])
        ++ [
          pages.faq
          { title = "软件文献"; path = "/documentation/index.html"; }
          { title = "GitHub";   url  = "https://github.com/fractalide/fractalide"; }
          (templates.bootstrap.navbar.nav_dropdown {
            title = "中文";
            items = [
              (locales.eng.pages.index // { title = "English"; })
              (locales.jpn.pages.index // { title = "日本語"; })
            ];
          })
        ];
    };

    /*------------
      Pages
    ------------*/
    pages = with env; rec {
      index = {
        title    = "Home";
        path     = prefix + "/index.html";
        template = templates.block-page.full;
        layout   = templates.layout;
        blocks   = mkIndexBlocks { templates = templates.blocks; data = data.loaded.blocks; inherit pages; };
        body.class = "home";
      };

      /*
      newsIndex = lib.mkSplit {
        title        = "公告新闻";
        basePath     = prefix + "/news/index";
        itemsPerPage = conf.theme.news.index.itemsPerPage;
        template     = templates.news.index;
        data         = news.list;
      };

      news = lib.mkPageList {
        data        = data.loaded.news;
        pathPrefix  = prefix + "/news/";
        template    = templates.news.full;
      };
      */

      faq = {
        path     = prefix + "/faq.html";
        template = templates.pages.faq;
      } // data.loaded.pages.faq;

    };

  };


/*-----------------------------------------------------------------------------
   Japanese

   This section declares Japanese locale data and pages
-----------------------------------------------------------------------------*/

  locales.jpn = rec {
    # Locale code
    locale = "jpn";

    # Prefix
    prefix = "/${locale}";

    # Html lang
    html.lang = "ja";

    # Environment
    inherit (themesData."${locale}") env;

    /*------------
      Data
    ------------*/
    data = with env; {
      # to avoid name clash with pages
      loaded = {
        #news   = lib.sortBy "date" "dsc" (lib.loadDir { dir = ./data/zho/news; inherit env; });
        blocks = lib.loadDir { dir = ./data/jpn/blocks; inherit env; asAttrs = true; };
        pages  = lib.loadDir { dir = ./data/jpn/pages;  inherit env; asAttrs = true; };
      };

      # Menu
      menu = (mkBlockSet pages.index.blocks prefix [ "vision" "whitepaper" "ico" "team" ])
        ++ [
          pages.faq
          { title = "ドキュメンテーション"; path = "/documentation/index.html"; }
          { title = "GitHub";               url  = "https://github.com/fractalide/fractalide"; }
          (templates.bootstrap.navbar.nav_dropdown {
            title = "日本語";
            items = [
              (locales.eng.pages.index // { title = "English"; })
              (locales.zho.pages.index // { title = "中文"; })
            ];
          })
        ];
    };

    /*------------
      Pages
    ------------*/
    pages = with locales.jpn; with env; rec {
      index = {
        title    = "ホーム";
        path     = prefix + "/index.html";
        template = templates.block-page.full;
        layout   = templates.layout;
        blocks   = mkIndexBlocks { templates = templates.blocks; data = data.loaded.blocks; inherit pages; };
        body.class = "home";
      };

      /*
      newsIndex = lib.mkSplit {
        title        = "News";
        basePath     = prefix + "/news/index";
        itemsPerPage = conf.theme.news.index.itemsPerPage;
        template     = templates.news.index;
        data         = news.list;
      };

      news = lib.mkPageList {
        data        = data.loaded.news;
        pathPrefix  = prefix + "/news/";
        template    = templates.news.full;
      };
      */

      faq = {
        path     = prefix + "/faq.html";
        template = templates.pages.faq;
      } // data.loaded.pages.faq;
    };

  };



/*-----------------------------------------------------------------------------
   Site rendering

-----------------------------------------------------------------------------*/

  # converting pages attribute set to a list
  pageList = let
    localePages = lib.mapAttrsToList (name: locale: 
      lib.pagesToList {
        pages   = locale.pages;
        default = {
          layout  = locale.env.templates.layout;
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
