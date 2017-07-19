{ lib, ... }:
with lib;
{
  id = "etherflow";
  title = "Etherflow";
  subtitle = "嶄新以太坊經典(Ethereum Classic)客戶端";
  content = markdownToHtml ''
    Etherflow是一套软件组件，可以大量利用ETCDEV的Emerald SDK。

    我们致力于这些重要成果:

    * Etherflow提供一个方便的界面，供用户与ETC数据区块链交互。
    * 可重复使用的组件将允许数据区块链与HyperFlow创建的应用程序进行交互。
    * 需要与ETCDEV团队长期合作，以协助扩展Emerald SDK的功能，并确保其稳定的预期方式运作。
  '';
}
