{ conf, lib, templates, ... }:
with lib;
page:
''
  <div class="post">
    <h2 class="post-title">${templates.tag.ilink { to = page; }}</h2>
    <span class="post-date">${with (parseDate page.date); "${D} ${b} ${Y}"}</span>
    ${page.intro}
  </div>
''
