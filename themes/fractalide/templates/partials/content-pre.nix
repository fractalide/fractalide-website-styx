env:

let template = env: args: ''
  <header>
    ${env.templates.partials.nav args}
  </header>
'';

in with env.lib; documentedTemplate {
  description = ''
    Template rendering the page pre-contents, usually used to render navigations. Empty by default.
  '';
  inherit env template;
}
