env:

let template = env: page: ''
  <link href="/css/bootstrap-fractalide.min.css" rel="stylesheet">
  <link href="/css/custom.css" rel="stylesheet">
'';

in with env.lib; documentedTemplate {
  description = ''
    Template to load custom css files, empty by default. Should be overridden to fit needs.
  '';
  inherit env template;
}
