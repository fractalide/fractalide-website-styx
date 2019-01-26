{ pages
, templates
}:

[
  { name = "Vision"; url = "/vision/"; }
  #{ name = "ICO"; url = "/ico/"; }
  {
    name = "Solutions";
    children = [
      { name = "Trulity"; url = "/trulity/"; }
      { name = "Mercat Cross"; url = "/mercat/"; }
      { name = "Luceo"; url = "/luceo/"; }
    ];
  }
  {
    name = "Stakepools";
    children = [
      { name = "Overview"; url = "/stake-pool/"; }
      { name = "Luceo (CEO)"; url = "/stake-pool/luceo-ceo/"; }
      { name = "Tezos (XTZ)"; url = "/stake-pool/tezos-xtz/"; }
      { name = "Cardano (ADA)"; url = "/stake-pool/cardano-ada/"; }
    ];
  }
  {
    name = "Resources";
    children = [
      { name = "Videos"; url = "/videos/"; }
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
