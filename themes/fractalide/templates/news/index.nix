{ lib, templates, ... }:
with lib;
normalTemplate (page: ''
  <div class="container">
  <h1>${page.title}</h1>
  <div class="posts">
    ${mapTemplate templates.news.list (page.items or [])}
  </div>

  <div class="text-center">
  ${optionalString (page ? pages) (templates.bootstrap.pagination { inherit (page) pages index; })} 
  </div>
  </div>
'')
