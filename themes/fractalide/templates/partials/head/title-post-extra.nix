env:

let template = env: page: ''
  <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon" />
  <link rel="apple-touch-icon" href="/img/apple-touch-icon.png" />
  <link rel="alternate" href="/index.xml" type="application/rss+xml" title="Fractalide">
'';

in with env.lib; documentedTemplate {
  description = ''
    Template to add custom extra content in `head`. Empty by default, should be overriden to fit needs.
  '';
  inherit env template;
}
