{ lib, templates, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        ${if (data ? icon) then ''
        <div class="col-md-2 text-center">
        <i class="fa fa-${data.icon} fa-5x" aria-hidden="true"></i>
        </div>
        <div class="col-md-10">''
        else ''<div class="col-md-12">''}
        ${optionalString (data ? content) data.content}
        </div>
        ${optionalString (data ? extra)   data.extra}
      </div>
    '';
  })
)
