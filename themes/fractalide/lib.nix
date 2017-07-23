{ lib }:
with lib;
{
  i18n = base: locale:
  let translations = {
    "Read More" = { "zho" = "阅读更多"; };
  }; in attrByPath [ base locale ] base translations;
}
