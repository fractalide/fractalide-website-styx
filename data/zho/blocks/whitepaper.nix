{
  id = "whitepaper";
  title = "白皮書";

  blocks = [{
    text = ''
      The one-pager describes the project in a succinct manner. It covers what has been done, the latest advancements after the Master Thesis implementation and what still needs to be done to reach our end goal.
    '';
    links = [{
      to = "/pdf/fractalideCOP.pdf";
      text = "Download One Pager";
    } {
      to = "https://github.com/fractalide/fractalide";
      text = "Current implementation";
      extra = ''
        <img src="https://img.shields.io/github/stars/fractalide/fractalide.svg?style=flat-square">
        <img src="https://img.shields.io/github/forks/fractalide/fractalide.svg?style=flat-square">
        <img src="https://img.shields.io/badge/license-MPLv2-blue.svg?style=flat-square">
      '';
    }];
  } {
    text = ''
      The entire master thesis describes the Hypercard implementation in detail. This is probably not for the casual investor due to the indepth technical descriptions.
    '';
    links = [{
      to = "/pdf/fractalideCOP.pdf";
      text = "Download Master Thesis";
    } {
      to = "https://github.com/fractalide/fractalide-oz";
      text = "Original Master Thesis implementation";
    }];
  }];
}
