{ templates, lib, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        <div class="col-md-2 text-center">
        <i class="fa fa-file-text fa-5x" aria-hidden="true"></i></a> 
        </div>
        <div class="col-md-10">
        <p>${data.text}</p>
        <p>${templates.tag.ilink { to = data.link; content = "Download whitepaper"; }}</p>
        </div>
      </div>
    '';
  })
)
