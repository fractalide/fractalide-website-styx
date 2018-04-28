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
    <meta property="og:image" content="/img/logo.png" />
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
