{ templates, lib, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        <div class="col-md-2 text-center">
        <i class="fa fa-money fa-5x" aria-hidden="true"></i>
        </div>
        <div class="col-md-10">
        <p>${data.content}</p>
        <p>${templates.tag.ilink { to = data.link; content = "Join ICO"; }}</p>
        </div>
      </div>
    '';
  })
)
