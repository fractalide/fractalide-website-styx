{ lib, ... }:
with lib;
{
  id = "fractalmarket";
  title = "Fractalmarket";
  subtitle = "APP应用市场";
  content = markdownToHtml ''
    Hyperflow上的組件和應用程序可在Fractalmarket中與別人分享。

    Fractalmarket拥有以下特点：

    * 用户可在这个应用市场以FRACTAL代币买卖组件和应用程序。
    * 用户可搜寻和下载组件和应用程序。
    * Fractalmarket将会设计成一个奖励用户创建和使用可重复使用的组件的应用市场。
  '';
}
