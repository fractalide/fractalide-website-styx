{ lib, templates, ... }:
with lib;
{
  id = "whitepaper";
  title = "白皮书";

  content = markdownToHtml ''
    这两页简报以简洁的方式描述此项目。

    * ${templates.tag.ilink { to = "/pdf/whitepaper_zho.pdf"; content = "下载ICO两页简报"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide"; content = "目前Fractalide的源代码"; }}
      <img src="https://img.shields.io/github/stars/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/github/forks/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/badge/license-MPLv2-blue.svg?style=flat-square">
    * ${templates.tag.ilink { to = "/pdf/fractalideCOP.pdf"; content = "下载硕士论文"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide-oz"; content = "硕士论文的源代码"; }}
  '';

  icon = "file-text";
}
