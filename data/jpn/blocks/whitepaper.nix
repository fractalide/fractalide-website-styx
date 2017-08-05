{ lib, templates, data, ... }:
with lib;
{
  id = "whitepaper";
  title = "ホワイトペーパー";

  content = markdownToHtml ''
    この2ページホワイトペーパーはプロジェクトの成果物を紹介します。

    * ${templates.tag.ilink { to = data.whitepaper; content = "ICO概観ホワイトペーパー"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide"; content = "現Fractalide履行"; }}
      <img src="https://img.shields.io/github/stars/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/github/forks/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/badge/license-MPLv2-blue.svg?style=flat-square">
    * ${templates.tag.ilink { to = "/pdf/fractalideCOP.pdf"; content = "修士論文のダウンロード"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide-oz"; content = "Fractalide履行の原文修士論文"; }}
  '';

  icon = "file-text";
}
