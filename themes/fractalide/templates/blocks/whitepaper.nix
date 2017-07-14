{ templates, lib, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        <div class="col-md-2 text-center">
        <i class="fa fa-file-text fa-5x" aria-hidden="true"></i>
        </div>
        <div class="col-md-10">
          ${mapTemplate (block: ''
          <div class="row">
            <p>${block.text}</p>
            <ul>
              ${mapTemplate (link: ''
                <li>${templates.tag.ilink { to = link.to; content = link.text; }}${optionalString (link ? extra) " ${link.extra}"}</li>
              '') block.links}
            </ul>
          </div>
          '') data.blocks}
        </div>
      </div>
    '';
  })
)
