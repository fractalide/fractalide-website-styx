env:

let template = env: args:
let
  lib = env.lib;
  conf = env.conf;
  page = args.page;
in
  ''
    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="fractalide, styx">
    <meta name="generator" content="Styx 0.7.1" />
    <meta property="og:title" content="${lib.optionalString (page ? title) page.title}${lib.optionalString ((lib.hasAttrByPath ["theme" "site" "title"] conf) && (page ? title)) " - "}${lib.optionalString (lib.hasAttrByPath ["theme" "site" "title"] conf) conf.theme.site.title}" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="${conf.siteUrl + page.path}" />
    <meta property="og:image" content="${conf.siteUrl + "/img/social-sharing-400-min.png"}" />
    <meta property="og:description" content="A dapp browser for Cardano" />
    <meta name="twitter:title" content="${lib.optionalString (page ? title) page.title}${lib.optionalString ((lib.hasAttrByPath ["theme" "site" "title"] conf) && (page ? title)) " - "}${lib.optionalString (lib.hasAttrByPath ["theme" "site" "title"] conf) conf.theme.site.title}" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:site" content="@fractalide" />
    <meta name="twitter:title" content="Fractalide" />
    <meta name="twitter:description" content="A dapp browser for Cardano" />
    <meta name="twitter:image" content="${conf.siteUrl + "/img/social-sharing-400-min.png"}" />
    <meta name="twitter:creator" content="@fractalide" />
  '';

in with env.lib; documentedTemplate {
  description = ''
    Generic `meta` tags, should be overriden to fit needs. +
    Default contents:

    +
    [source, html]
    ----
    ${template env {}}
    ----
  '';
  inherit env template;
}
