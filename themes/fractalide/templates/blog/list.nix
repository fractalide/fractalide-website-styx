{ conf, lib, templates, ... }:
with lib;
page:
''
  <div class="post">
    <div class="row">
        <div class="col-md-4">
          <div class="image">
              <img src="http://via.placeholder.com/260x200" class="img-responsive" alt="">
          </div>
        </div>
        <div class="col-md-8">
            <h2 class="post-title">${templates.tag.ilink { to = page; }}</h2>
            <div class="clearfix">
              <div style="float: left;">
                <p class="post-author">
                  ${optionalString (page ? author) ''
                  <span class="text-muted">By</span>
                  <span itemscope="" itemprop="author" itemtype="https://schema.org/Person">
                    <span class="text-muted" itemprop="name">
                      ${if (page.author ? url)
                      then ''<a href="${page.author.url}" itemprop="url" rel="author">${page.author.name}</a>''
                      else page.author.name}
                    </span>
                  </span>
                  ''}
                </p>
                <p class="post-category">
                </p>
              </div>
              <div class="text-right">
                <span class="post-date text-muted">${with (parseDate page.date); "${B} ${D}, ${Y}"}</span>
              </div>
            </div>
            <p class="intro">${page.intro}</p>
            <div class="read-more">
                <a href="${templates.url page}" class="btn btn-link">Read more</a>
            </div>
        </div>
    </div>
  </div>
''
