env:

let template = { lib, templates, ... }:
  lib.normalTemplate (page: ''
    ${lib.optionalString (page ? title) ''
      <section${lib.optionalString (page ? section) " " + ''"${page.section}"''}>
        <div class="header_background"> <!-- title -->
         <div class="header_content_stack">
          <div class="container">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div class="text-center">
                        <h1 class="section_heading_blue fractal_white">${page.title}</h1>
                        ${lib.optionalString (page ? lede) ''
                          <p class="text_white">
                            ${page.lede}
                          </p>
                        ''}
                    </div>
                </div>
            </div>
          </div>
         </div>
        </div> <!-- title -->
      </section> ${lib.optionalString (page ? section) "<!-- ${page.section} -->"}
    ''}
    ${let renderSection = sectionName: ''
      <section id="${sectionName}">
          ${page.sections."${sectionName}".content}
      </section> <!-- ${sectionName} -->
    ''; in
      lib.concatMapStringsSep "\n" renderSection page.sectionOrder
    }
    ${lib.optionalString (page ? extraContent) page.extraContent}
  '');

in with env.lib; documentedTemplate {
  description = "Template that frames our standard page.";

  inherit env template;
}
