{ lib, templates, ... }:
with lib;
{
  id = "vision";
  title = "抱负";
  content = markdownToHtml ''
    我们的目标是创建三个基础应用程序，这些应用程序运行在一个名为Fractalide(已完成制作)的编程平台上。

    1. **${templates.tag.ilink { to = "/zho/#hyperflow"; content = "Hyperflow"; class = "page-scroll"; }}**:快速应用程式开发(RAD)平台 
    2. **${templates.tag.ilink { to = "/zho/#fractalmarket"; content = "Fractamarket"; class = "page-scroll"; }}**:应用程序市场 
    3. **${templates.tag.ilink { to = "/zho/#etherflow"; content = "Etherflow"; class = "page-scroll"; }}**:崭新以太坊经典(Ethereum Classic)客户端

    Hyperflow有助于创建可在Fractalmarket上发布的应用程序。 Etherflow允许所有人在Fractalmarket上购买应用程序或与其他以太坊经典(Ethereum Classic)持有者和合约进行交互。
  '';
  icon = "eye";
}
