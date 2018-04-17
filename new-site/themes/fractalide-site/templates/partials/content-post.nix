env:

let template = env: args:
  let site-partials = env.templates.site-partials;
  in site-partials.footer;

in with env.lib; documentedTemplate {
  description = ''
    Template rendering the page post-contents, usually used to render the footer. Empty by default.
  '';
  inherit env template;
}
