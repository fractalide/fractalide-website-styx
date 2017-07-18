{
  id = "whitepaper";
  title = "白皮书";

  blocks = [{
    text = ''
      这一页简报以简洁的方式描述了该项目。它涵盖了已完成的工作，硕士论文发表后的最新进展以及将来须要完成的工作。
    '';
    links = [{
      to = "/pdf/fractalideCOP.pdf";
      text = "下载一页简报";
    } {
      to = "https://github.com/fractalide/fractalide";
      text = "目前已完成的源代码";
      extra = ''
        <img src="https://img.shields.io/github/stars/fractalide/fractalide.svg?style=flat-square">
        <img src="https://img.shields.io/github/forks/fractalide/fractalide.svg?style=flat-square">
        <img src="https://img.shields.io/badge/license-MPLv2-blue.svg?style=flat-square">
      '';
    }];
  } {
    text = ''
    '';
    links = [{
      to = "/pdf/fractalideCOP.pdf";
      text = "下载硕士论文";
    } {
      to = "https://github.com/fractalide/fractalide-oz";
      text = "硕士论文的源代码";
    }];
  }];
}
