{ lib, templates, ... }:
with lib;
{
  id = "whitepaper";
  title = "Whitepaper";

  content = markdownToHtml ''
    The two-pager describes the project deliverables in a succinct manner.

    * ${templates.tag.ilink { to = "/pdf/Ethereum_Classic_Infrastructure_ICO.pdf"; content = "Download Two Pager ICO Overview"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide"; content = "Current Fractalide implementation"; }}
      <img src="https://img.shields.io/github/stars/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/github/forks/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/badge/license-MPLv2-blue.svg?style=flat-square">
    * ${templates.tag.ilink { to = "/pdf/fractalideCOP.pdf"; content = "Download Master Thesis"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide-oz"; content = "Original Master Thesis Fractalide implementation"; }}
  '';

  icon = "file-text";
}
