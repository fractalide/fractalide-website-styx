{ templates, lib, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        <div class="col-md-2 text-center">
        <i class="fa fa-eye fa-5x" aria-hidden="true"></i>
        </div>
        <div class="col-md-10">
        <p>${data.content}</p>
        </div>
      </div>
    '';
  })
)
