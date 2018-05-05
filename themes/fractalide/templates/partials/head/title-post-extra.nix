env:

let template = env: page: ''
  <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon" />
  <link rel="icon" type="image/png" href="/img/favicon-16x16.png" sizes="16x16">
  <link rel="icon" type="image/png" href="/img/favicon-32x32.png" sizes="32x32">
  <link rel="alternate" href="/index.xml" type="application/rss+xml" title="Fractalide">
'';

in with env.lib; documentedTemplate {
  description = ''
    Template to add custom extra content in `head`. Empty by default, should be overriden to fit needs.
  '';
  inherit env template;
}
