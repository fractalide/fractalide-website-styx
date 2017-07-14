{ templates, lib, pages, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        ${mapTemplate templates.news.block (take 3 data.items)}
      </div>
      <div class="row more-updates">
      ${templates.tag.ilink { class = [ "btn" "btn-primary" ]; to = head pages.newsIndex; content = "More Updates"; }}
      </div>
    '';
  })
)
