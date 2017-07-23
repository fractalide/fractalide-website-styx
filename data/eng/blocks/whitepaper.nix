{ lib, templates, ... }:
with lib;
{
  id = "whitepaper";
  title = "Whitepaper";

  content = markdownToHtml ''
    The one-pager describes the project in a succinct manner. It covers what has been done, the latest advancements after the Master Thesis implementation and what still needs to be done to reach our end goal.

    * ${templates.tag.ilink { to = "/pdf/Ethereum_Classic_Infrastructure_ICO.pdf"; content = "Download Two Pager"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide"; content = "Current implementation"; }}
      <img src="https://img.shields.io/github/stars/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/github/forks/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/badge/license-MPLv2-blue.svg?style=flat-square">
    * ${templates.tag.ilink { to = "/pdf/fractalideCOP.pdf"; content = "Download Master Thesis"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide-oz"; content = "Original Master Thesis implementation"; }}
  '';

  icon = "file-text";
}
