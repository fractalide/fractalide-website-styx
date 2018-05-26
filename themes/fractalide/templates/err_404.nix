env:

let template = { lib, templates, ... }:
  lib.normalTemplate (page: ''
    <section${lib.optionalString (page ? section) (" id=" + ''"${page.section}"'')}>
      ${lib.optionalString (page ? title) ''
        <div class="header_background"> <!-- title -->
          <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <h1 class="section_heading_blue fractal_white">${page.title}</h1>
                        ${page.content}
                    </div>
                </div>
            </div>
          </div>
        </div> <!-- title -->
      ''}
    </section>
  '');

in with env.lib; documentedTemplate {
  description = "Template that frames our standard page.";

  inherit env template;
}
