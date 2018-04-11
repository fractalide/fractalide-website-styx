env:

let
  contentList = env.lib.loadDir {
    dir = ./site-partials-content;
  };
  attrs = builtins.listToAttrs (map (fileAttrs: {
    name = fileAttrs.fileData.basename;
    value = fileAttrs.content;
  }) contentList);
in
  attrs
