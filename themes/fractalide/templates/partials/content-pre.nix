{ conf, lib, templates, data, ... }:
{ page }:
with lib;
let
  extraClass = optional ((attrByPath ["body" "class"] false page) != "home") "navbar-shrink";
in
templates.bootstrap.navbar.default {
  id = "main-nav";
  brand = ''<a class="navbar-brand page-scroll" href="${templates.url "/#page-top"}"><img src="${templates.url "/img/fractalide.svg"}"> FRACTALIDE</a>'';
  extraClasses = [ "navbar-fixed-top" ] ++ extraClass;
  content = [
    (templates.bootstrap.navbar.nav {
      align = "right";
      items = data.menu;
      currentPage = page;
    })
  ];
}
