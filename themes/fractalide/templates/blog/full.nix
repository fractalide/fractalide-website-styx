{ lib, templates, ... }:
with lib;
normalTemplate (page: ''

<article class="post-container" itemscope="" itemtype="http://schema.org/BlogPosting">
<header class="post-header">
  <div class="header_gradient">
    <div class="container">
      <div class="row">
        <div class="col-md-offset-0 col-md-12 text-center">
          <h1 class="post-title section_heading_blue no_fractal" itemprop="name headline">${page.title}</h1>
          <p class="post-author">
            ${optionalString (page ? author) ''
            <span itemscope="" itemprop="author" itemtype="https://schema.org/Person">
              <span class="text-muted" itemprop="name">
                ${if (page.author ? url)
                then ''<a href="${page.author.url}" itemprop="url" rel="author">${page.author.name}</a>''
                else page.author.name}
                <time class="text-muted" datetime="${(parseDate page.date).T}">${with (parseDate page.date); "• ${B} ${D}, ${Y}"}</time>
              </span>
            </span>
            ''}
          </p>
        </div>
      </div>
    </div>
  </div>
</header>

  <div class="container blog_post">
    <div class="row">
      <div class="col-md-offset-2 col-md-8">
        <div class="post-content clearfix" itemprop="articleBody">
          ${page.content}

          ${optionalString (page ? multipages) (templates.bootstrap.pager { inherit (page.multipages) pages index; })}
        </div>
      </div>
    </div>
  </div>
</article>
'')
