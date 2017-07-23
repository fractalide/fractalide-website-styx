{ lib, templates, ... }:
with lib;
normalTemplate (page: ''
  <div class="container">
  <h1>${page.title}</h1>
  <div class="faq">
    ${mapTemplate (f:
      templates.bootstrap.panel { heading = f.q; body = f.a; }
    ) page.items}
  </div>
  </div>
'')
/*
    ${mapTemplate (f:
      templates.bootstrap.panel { heading = f.q; body = f.a; }
    ) page.items}
*/
