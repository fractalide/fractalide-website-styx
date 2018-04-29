env:

let template = env: args:
  env.data.site-partials.footer.content;

in with env.lib; documentedTemplate {
  description = ''
    Template rendering the page post-contents, usually used to render the footer. Empty by default.
  '';
  inherit env template;
}
