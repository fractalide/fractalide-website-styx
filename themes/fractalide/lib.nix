{ lib }:
with lib;
{
  i18n = base: lang:
  let langData = {
    "Read More" = { "zho" = "阅读更多"; };
  }; in attrByPath [ base lang ] base langData;
}
