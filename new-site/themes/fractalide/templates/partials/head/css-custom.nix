env:

let template = env: page: ''
  <link href="/css/bootstrap-fractalide.min.css" rel="stylesheet">
  <link href="/css/custom.css" rel="stylesheet">
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
'';

in with env.lib; documentedTemplate {
  description = ''
    Template to load custom css files, empty by default. Should be overridden to fit needs.
  '';
  inherit env template;
}
