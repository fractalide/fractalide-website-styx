env:

let
  stripSuffix = suffix: string:
    let
      sxl = builtins.stringLength suffix;
      sl = builtins.stringLength string;
    in
      if (sl >= sxl) && ((builtins.substring (sl - sxl) sxl string) == suffix) then
        builtins.substring 0 (sl - sxl) string
      else string;
  stripIndexHtml = stripSuffix "index.html";
  template = { conf, lib, ... }:
    arg:
      if lib.isAttrs arg
      then "${conf.siteUrl}${stripIndexHtml arg.path}"
      else if (lib.match "^(http|https|ftp|mailto)://.*$" arg) != null
           then stripIndexHtml arg
           else conf.siteUrl + (stripIndexHtml arg);

in with env.lib; documentedTemplate {
  description = "Generate a full url from a path or a page by using `conf.siteUrl`.";
  arguments = [
    {
      name = "arg";
      description = "Path or Page to generate the url.";
      type = "String | Page";
    }
  ];
  examples = [ (mkExample {
    literalCode  = ''templates.url "/foo.html"'';
    code = with env; templates.url "/foo.html";
  })
  (mkExample {
    literalCode  = ''templates.url { title = "About"; path = "/about.html"; }'';
    code = with env; templates.url { title = "About"; path = "/about.html"; };
  }) ];
  inherit env template;
}
