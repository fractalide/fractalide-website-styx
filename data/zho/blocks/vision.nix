{ lib, templates, ... }:
with lib;
{
  id = "vision";
  title = "理念";
  content = markdownToHtml ''
    现在，非技术性用户并不容易明白和使用已发布的加密合约。因此，加密合约并不容易进入主流。

    终端用户都期望可有一个方便的一键式平台，而这平台提供容易操作且安全，和第可运用加密同约的第三方应用程序。这个平台可以分为三部分：建设、分配和区块链互动。

    我们的目标是建立一个平台，使区块链友好应用程序的构建和分配变得容易。

    1. **${templates.tag.ilink { to = "/zho/#hyperflow"; content = "Hyperflow"; class = "page-scroll"; }}**:快速应用程式开发(RAD)平台 
    2. **${templates.tag.ilink { to = "/zho/#fractalmarket"; content = "Fractalmarket"; class = "page-scroll"; }}**:加密合约app的应用市场
    3. **${templates.tag.ilink { to = "/zho/#etherflow"; content = "Etherflow"; class = "page-scroll"; }}**:一组可重用的组件，使Hyperflow应用程序有效地使用区块链。

    Hyperflow有助于创造可在Fractalmarket上发布的如Etherflow的应用程序和组件。 Fractalmarket旨在成为一个主要应用市场，而这应用市场是容许终端用户和第三方供应商买卖加密合约应用程序。
  '';
  icon = "eye";
}
