{ lib }:
with lib;
{
  # URL of the site, must be set to the url of the domain the site will be deployed
  siteUrl = "https://fractalide.github.io/fractalide-website-styx";

  theme = {
    site.title = "Fractalide";

    #news.index.itemsPerPage = 5;

    footer = {
      copyright = "Copyright &copy;2017 Fractalide. All Rights Reserved.";
      social = [
        { icon = "fa-twitter";  link ="https://twitter.com/fractalide"; }
      ];
      quicklinks = [
        { text = "Foo"; link ="#"; }
      ];
    };

    lib = {
      jquery.enable = true;
      bootstrap.enable = true;
      font-awesome.enable = true;
      googlefonts = [
        "Orbitron"
        "Montserrat:400,700"
        "Droid Serif:400,700,400italic,700italic"
        "Roboto Slab:400,100,300,700"
      ];
      highlightjs = {
        enable = true;
        style = "github";
        extraLanguages = [ "nix" "rust" "capnp" ];
      };
    };
  };

}
