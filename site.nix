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
     Each language gets its own data
  */
  themesData = let
    loadThemeForLang = lang: styxLib.themes.load {
      inherit styxLib themes;
      extraEnv  = {
        data = data."${lang}";
        pages = pages."${lang}";
        prefix = genPrefix lang;
        inherit lang;
      };
      extraConf = [ ./conf.nix extraConf ];
    };
  in {
    eng = loadThemeForLang "eng";
    zho = loadThemeForLang "zho";
  };

  /* Bringing the themes data to the scope
  */
  inherit (themesData.eng) conf lib files;

  genPrefix = lang:
    if lang == "eng"
    then ""
    else "/${lang}";


/*-----------------------------------------------------------------------------
   Data

   This section declares the data used by the site
-----------------------------------------------------------------------------*/

  data = with lib; {

    /*---------------------
      Chinese data
    ---------------------*/
    eng = let
      locPages = pages.eng;
      env = themesData.eng.env;
    in {

      /*news = sortBy "date" "dsc" (loadDir { dir = ./data/eng/news; inherit env; });*/

      blocks = loadDir { dir = ./data/eng/blocks; inherit env; asAttrs = true; };

      pages = loadDir { dir = ./data/eng/pages; inherit env; asAttrs = true; };

      /* Menu
      */
      menu = let
        indexBlocks = locPages.index.blocks;
        /* Generating menu entries from index blocks
        */
        bItems = map (n:
          let block = find { id = n; } indexBlocks;
          in block // { navbarClass = "page-scroll"; url = "/#${block.id}"; }
        ) [ "vision" "whitepaper" "ico" "team" ];
      in bItems
      # normal menu entries
      ++ [
        locPages.faq
        { title = "Documentation"; path = "/documentation/index.html"; }
        { title = "GitHub"; url = "https://github.com/fractalide/fractalide"; }
        (pages.zho.index // { title = "中文"; })
      ];

    };

    /*---------------------
      Chinese data
    ---------------------*/
    zho = let
      locPages = pages.zho;
      env = themesData.zho.env;
    in {

      /*news = sortBy "date" "dsc" (loadDir { dir = ./data/zho/news; inherit env; });*/

      blocks = loadDir { dir = ./data/zho/blocks; inherit env; asAttrs = true; };

      pages = loadDir { dir = ./data/zho/pages; inherit env; asAttrs = true; };

      /* Menu
      */
      menu = let
        indexBlocks = locPages.index.blocks;
        /* Generating menu entries from index blocks
        */
        bItems = map (n:
          let block = find { id = n; } indexBlocks;
          in block // { navbarClass = "page-scroll"; url = "/zho/#${block.id}"; }
        ) [ "vision" "whitepaper" "ico" "team" ];
      in bItems
      # normal menu entries
      ++ [
        locPages.faq
        { title = "软件文献"; path = "/documentation/index.html"; }
        { title = "GitHub"; url = "https://github.com/fractalide/fractalide"; }
        (pages.eng.index // { title = "English"; })
      ];

    };

  };


/*-----------------------------------------------------------------------------
   Pages

   This section declares the pages that will be generated
-----------------------------------------------------------------------------*/

  pages = {

    /*---------------------
      English pages
    ---------------------*/
    eng = let
      prefix = genPrefix "eng";
      locData = data.eng;
      templates = themesData.eng.templates;
    in rec {
      index = {
        title    = "Home";
        path     = prefix + "/index.html";
        template = templates.block-page.full;
        layout   = templates.layout;
        blocks   = let
          darken = d: d // { class = "bg-light-gray"; };
        in [
          (templates.blocks.banner locData.blocks.main-banner)
          (templates.blocks.standard locData.blocks.taster)
          /*(templates.blocks.news (locData.blocks.news // { items = news.list; }))*/
          (templates.blocks.standard (darken (locData.blocks.vision)))
          (templates.blocks.standard locData.blocks.hyperflow)
          (templates.blocks.standard (darken locData.blocks.fractalmarket))
          (templates.blocks.standard locData.blocks.etherflow)
          (templates.blocks.standard (darken locData.blocks.whitepaper))
          (templates.blocks.standard (locData.blocks.ico // { navbarTitle = "ICO"; }))
          (templates.blocks.team (darken locData.blocks.team))
        ];
        body.class = "home";
      };

      /*newsIndex = lib.mkSplit {
        title        = "news";
        basePath     = prefix + "/news/index";
        itemsPerPage = conf.theme.news.index.itemsPerPage;
        template     = templates.news.index;
        data         = news.list;
      };

      news = lib.mkPageList {
        title       = "News";
        data        = locData.news;
        pathPrefix  = prefix + "/news/";
        template    = templates.news.full;
      };*/

      faq = {
        title = "FAQ";
        path  = prefix + "/faq.html";
        template = templates.pages.faq;
      } // locData.pages.faq;
    };

    /*---------------------
      Chinese pages
    ---------------------*/
    zho = let
      prefix = genPrefix "zho";
      locData = data.zho;
      templates = themesData.zho.templates;
    in rec {
      index = {
        title    = "Home";
        path     = prefix + "/index.html";
        template = templates.block-page.full;
        layout   = templates.layout;
        blocks   = let
          darken = d: d // { class = "bg-light-gray"; };
        in [
          (templates.blocks.banner locData.blocks.main-banner)
          (templates.blocks.standard locData.blocks.taster)
          /*(templates.blocks.news (locData.blocks.news // { items = news.list; }))*/
          (templates.blocks.standard (darken (locData.blocks.vision)))
          (templates.blocks.standard locData.blocks.hyperflow)
          (templates.blocks.standard (darken locData.blocks.fractalmarket))
          (templates.blocks.standard locData.blocks.etherflow)
          (templates.blocks.standard (darken locData.blocks.whitepaper))
          (templates.blocks.standard (locData.blocks.ico // { navbarTitle = "ICO"; }))
          (templates.blocks.team (darken locData.blocks.team))
        ];
        body.class = "home";
      };

      /*newsIndex = lib.mkSplit {
        title        = "news";
        basePath     = prefix + "/news/index";
        itemsPerPage = conf.theme.news.index.itemsPerPage;
        template     = templates.news.index;
        data         = news.list;
      };

      news = lib.mkPageList {
        title       = "公告新闻";
        data        = locData.news;
        pathPrefix  = prefix + "/news/";
        template    = templates.news.full;
      };*/

      faq = {
        title = "常见问题";
        path  = prefix + "/faq.html";
        template = templates.pages.faq;
      } // locData.pages.faq;
    };
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
  pageList = let
    genPageList = lang: lib.pagesToList {
      pages = pages."${lang}";
        default = {
        layout = themesData."${lang}".templates.layout;
        body.id = "page-top";
      };
    };
  in (genPageList "eng") ++ (genPageList "zho");

  site = lib.mkSite {
    inherit files pageList;
    postGen = with lib; ''
      # Documentation generation
      ${lib.concatStringsSep "\n" (map (version: ''
        mkdir -p $out/documentation/${version.rev}/
        cp -r ${fetchUpstream version}/share/doc/fractalide/* $out/documentation/${version.rev}
      '') docVersions)}
      cp -r ${fetchUpstream (lib.head docVersions)}/share/doc/fractalide/* $out/documentation/
      echo "${conf.domain}" > $out/CNAME
    '';
  };

}
