{ lib }:
with lib;
{
  i18n = base: lang:
  let langData = {
    "Read More" = { "zho" = "閱讀更多"; };
  }; in attrByPath [ base lang ] base langData;
}
