{ pages
, templates
}:

[
  { name = "About us"; url = "/about_us/"; }
  #{ name = "ICO"; url = "/ico/"; }
  {
    name = "Solutions";
    children = [
      { name = "Hyperflow"; url = "/hyperflow/"; }
      { name = "Fractalmarket"; url = "/fractalmarket/"; }
      { name = "Services"; url = "/development-and-analysis/"; }
      { name = "Cardano Wallet"; url = "/cardano-wallet/"; }
    ];
  }
  {
    name = "Stake Pools";
    children = [
      { name = "Cardano (LUCEO)"; url = "/stake-pool/cardano-luceo/"; }
      { name = "Cardano (ADA)"; url = "/stake-pool/cardano-ada/"; }
      { name = "Tezos (XTZ)"; url = "/stake-pool/tezos-xtz/"; }
    ];
  }
  {
    name = "Resources";
    children = [
      { name = "Research"; url = "/research/"; }
      { name = "Community"; url = "/community/"; }
      { name = "Documentation"; url = "/documentation/"; }
      { name = "GitHub"; url = "https://github.com/fractalide/"; target = "_blank"; }
      { name = "FAQs"; url = "/faqs/"; }
      { name = "Blog"; url = "/blog/"; }
      { name = "Twitter"; pre = "twitter-min.png"; url = "http://twitter.com/fractalide"; }
      {
        name = (templates.icon.font-awesome "rss-square") + ''<span class="sr-only">Atom</span>'';
        url  = pages.feed.path;
      }
    ];
  }
  { name = "Roadmap"; url = "/roadmap/"; }
]
