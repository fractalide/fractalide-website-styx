env:

let template = { lib, templates, ... }:
  lib.normalTemplate (page: ''
    <section${lib.optionalString (page ? section) " " + ''"${page.section}"''}>
      ${lib.optionalString (page ? title) ''
        <div class="header_gradient"> <!-- title -->
          <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <h1 class="section_heading_blue fractal_white">${page.title}</h1>
                    </div>
                </div>
            </div>
          </div>
        </div> <!-- title -->
      ''}
      <div class="container">
        ${page.content}
      </div> <!-- container -->
    </section>
    ${lib.optionalString (page ? extraContent) page.extraContent}
  '');

in with env.lib; documentedTemplate {
  description = "Template that frames our standard page.";

  inherit env template;
}
