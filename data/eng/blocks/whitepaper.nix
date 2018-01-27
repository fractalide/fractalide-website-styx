{ lib, templates, data, ... }:
with lib;
{
  id = "whitepaper";
  title = "Resources + Research";

  content = markdownToHtml ''

    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide"; content = "Current Fractalide implementation"; }}
      <img src="https://img.shields.io/github/stars/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/github/forks/fractalide/fractalide.svg?style=flat-square">
      <img src="https://img.shields.io/badge/license-MPLv2-blue.svg?style=flat-square">
    * ${templates.tag.ilink { to = "https://riot.im/app/#/room/#fractalide:matrix.org"; content = "Riot Channel"; }}
    * ${templates.tag.ilink { to = "https://t.me/joinchat/HXdgc1CvRT6K3A4la7AApQ"; content = "Telegram Group"; }}
    * ${templates.tag.ilink { to = "/pdf/fractalideCOP.pdf"; content = "Fractalide Master Thesis"; }}
    * ${templates.tag.ilink { to = "https://github.com/fractalide/fractalide-oz"; content = "Original Master Thesis Fractalide Implementation"; }}
    * ${templates.tag.ilink { to = "https://iohk.io/research/papers/#XJ6MHFXX"; content = "Ouroboros Praos"; }}
    * ${templates.tag.ilink { to = "https://iohk.io/research/papers/#S7KC2KGJ"; content = "A Treasury system for Cryptocurrencies"; }}
    * ${templates.tag.ilink { to = "https://iohk.io/research/papers/#JT5XKNBP"; content = "A Formal Specification of the Plutus Core Language"; }}
    * ${templates.tag.ilink { to = "http://www.kframework.org/index.php/Main_Page"; content = "K-Framework"; }}
  '';

  icon = "file-text";
}
