{ lib, templates, ... }:
with lib;
normalTemplate (page: ''

<div class="header_gradient">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-center">
                    <h1 class="section_heading_blue fractal_white">${page.title}</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="blog_list">
  <div class="container">
    <div class="row">
      <div class="col-md-12">

        <div class="posts">
          ${mapTemplate templates.blog.list (page.items or [])}
        </div>

        <div class="text-center">
          ${optionalString (page ? pages) (templates.bootstrap.pagination { inherit (page) pages index; })}
        </div>

      </div>
    </div>
  </div>
</div>
'')
