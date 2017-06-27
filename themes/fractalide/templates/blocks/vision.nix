{ templates, lib, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        ${data.content}
      </div>
    '';
  })
)
