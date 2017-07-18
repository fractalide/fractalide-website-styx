{ templates, lib, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        <div class="col-md-2 text-center">
        </div>
        <div class="col-md-10">
        <p>${data.content}</p>
        </div>
      </div>
    '';
  })
)
