env:

let template = { lib, templates, ... }:
  lib.normalTemplate (page: ''
    <div class="container">
    ${page.content}
    </div> <!-- container -->
  '');

in with env.lib; documentedTemplate {
  description = "Template that wraps our usual `container` div around the content.";

  inherit env template;
}
