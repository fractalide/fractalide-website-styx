{ pages
, templates
}:

[
  { name = "Home"; url = "/"; }
  { name = "About us"; url = "/about_us/"; }
  {
    name = "Solutions";
    children = [
      { name = "Hyperflow"; url = "/hyperflow/"; }
      { name = "Fractalmarket"; url = "/fractalmarket/"; }
      { name = "Services"; url = "/development-and-analysis/"; }
      { name = "Cardano Stake Pool"; url = "/cardano-stake-pool/"; }
    ];
  }
  {
    name = "Resources";
    children = [
      { name = "Research"; url = "/research/"; }
      { name = "Documentation"; url = "/documentation/"; }
      { name = "GitHub"; url = "https://github.com/fractalide/"; target = "_blank"; }
      { name = "FAQs"; url = "/faqs/"; }
    ];
  }
  { name = "Roadmap"; url = "/roadmap/"; }
  { name = "Blog"; url = "/blog/"; }
  { name = "Twitter"; pre = "twitter-min.png"; url = "http://twitter.com/fractalide"; }
  {
    name = (templates.icon.font-awesome "rss-square") + ''<span class="sr-only">Atom</span>'';
    url  = pages.feed.path;
  }
]
