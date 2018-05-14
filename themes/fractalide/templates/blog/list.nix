{ conf, lib, templates, ... }:
with lib;
page:
''
  <div class="post">
    <div class="row">
      <div class="col-md-offset-2 col-md-8">
        <div class="panel panel-default">
          <div class="panel-body">
              <h2 class="post-title">${templates.tag.ilink { to = page; }}</h2>
              <p class="post-summary intro">${page.intro}</p>
              <p class="">
                ${optionalString (page ? author) ''
                <img class="author_image" src="/img/${page.author.image}" width="28px"/>
                <span itemscope="" itemprop="author" itemtype="https://schema.org/Person">
                  <span class="post-author text-muted" itemprop="name">
                    ${if (page.author ? url)
                    then ''<a href="${page.author.url}" itemprop="url" rel="author">${page.author.name}</a>''
                    else page.author.name}
                  </span>
                </span>
                ''}
                <span class="text-muted">•</span>
                <span class="post-date text-muted">${with (parseDate page.date); "${D} ${B} ${Y}"}</span>
              </p>
          </div>
        </div>
      </div>
    </div>
  </div>
''
