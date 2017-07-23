{ lib, templates, locale, ... }:
page:
with lib;
''
<div class="col-md-4 news-block">
  <h2 class="post-title" itemprop="name headline">${page.title}</h2>
  <time datetime="${(parseDate page.date).T}">${(parseDate page.date).date.num}</time>
  ${optionalString (page ? intro) '' 
    <div class="introduction">${page.intro}</div>
  ''}
  <div class="more">
  ${templates.tag.ilink {
    to = page;
    content = i18n "Read More" locale;
  }}
  </div>
</div>
''
