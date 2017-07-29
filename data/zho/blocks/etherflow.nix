{ lib, ... }:
with lib;
{
  id = "etherflow";
  title = "Etherflow";
  subtitle = "HYPERFLOW APPS和区块链的有效交流";
  content = markdownToHtml ''
    Etherflow是一組可重複使用的組件，允許由Hyperflow創建的應用程序與Ethereum Classic區塊鏈交互。

    我们致力于这些重要成果:

    * 需要与ETCDEV团队长期合作，以协助扩展Emerald SDK的功能，并确保其以稳定的可预测方式运行。
    * 虽然ICO不涵盖全面的ETC客户端，其方向大致是将Etherflow扩展到新的ETC客户端。
  '';
}
