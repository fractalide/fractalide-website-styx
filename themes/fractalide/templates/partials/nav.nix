env:

let template = env: args:
  let
    data = env.data;
    site = env.conf.theme.site;
    lib = env.lib;
    page = args.page;
    stripSuffix = suffix: string:
      let
        sxl = builtins.stringLength suffix;
        sl = builtins.stringLength string;
      in
        if (sl >= sxl) && ((builtins.substring (sl - sxl) sxl string) == suffix) then
          builtins.substring 0 (sl - sxl) string
        else string;
    stripIndexHtml = stripSuffix "index.html";
  in ''
${if page.path == "/index.html" then ''
  <nav id="menu" class="navbar navbar-default navbar-fixed-top" data-spy="affix" data-offset-top="200" role="navigation">
'' else ''
  <nav id="menu" class="navbar navbar-inverse navbar-fixed-top" role="navigation">
''}
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar-collapse" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="navbar_toggle_collapsed glyphicon glyphicon-menu-hamburger"></span>
        <span class="navbar_toggle_expanded glyphicon glyphicon-remove"></span>
      </button>
      <a class="navbar-brand" href="/"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
      ${
        let
          hasMenuCurrent = currentItem: path: false;
          renderItem = currentItem:
            if currentItem ? children then ''
              <li class="dropdown ${if (hasMenuCurrent currentItem page.path) then "active" else ""}">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${currentItem.name} <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  ${
                    let
                      renderChild = child: ''
                        <li class="${if (stripIndexHtml page.path) == child.url then "active" else ""}">
                          <a href="${child.url}" target="${if child ? target then child.target else ""}">${child.name}</a>
                        </li>
                      '';
                    in
                      lib.concatStringsSep "\n" (map renderChild currentItem.children)
                  }
                </ul>
              </li>
            '' else ''
              <li class="${if (stripIndexHtml page.path) == currentItem.url then "active" else ""}">
                ${if currentItem ? pre then ''
                  <a href="${currentItem.url}" target="_blank">
                    <img alt="${currentItem.name}" src="/img/${currentItem.pre}" width="20px">
                  </a>
                '' else ''
                  <a href="${currentItem.url}">${currentItem.name}</a>
                ''}
              </li>
            '';
        in
          lib.concatStringsSep "\n" (map renderItem data.nav)
      }
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
'';
in with env.lib; documentedTemplate {
  description = ''
    Template rendering the nav header
  '';
  inherit env template;
}
