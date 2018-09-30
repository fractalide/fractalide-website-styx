{ lib }:
rec {
  /* URL of the site, must be set to the url of the domain the site will be deployed.
     Should not end with a '/'.
  */
  domain = "fractalide.com";
  siteUrl = "http://${domain}";

  /* Theme specific settings
     it is possible to override any of the used themes configuration in this set.
  */
  theme = {
    blog.index.itemsPerPage = 5;
    site.title = "Fractalide";
    site.logo = "/img/logo.png";
    lib.bootstrap = { enable = true; version = "3.3.7"; };
    lib.font-awesome = { enable = true; version = "4.7.0"; };
    lib.googlefonts = [ "Nunito+Sans:400,900" ];
    lib.mathjax = { enable = true; version = "2.7.5"; };
  };
}
