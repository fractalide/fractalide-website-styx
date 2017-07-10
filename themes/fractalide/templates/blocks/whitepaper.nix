{ templates, lib, ... }:
with lib;
normalTemplate (data:
  templates.blocks.basic (data // {
    content = ''
      <div class="row">
        <div class="col-md-2 text-center">
        <i class="fa fa-file-text fa-5x" aria-hidden="true"></i>
        </div>
        <div class="col-md-10">
          <div class="row">
            <p>${data.text1}</p>
            <p>${templates.tag.ilink { to = data.link1; content = "Download One Pager"; }}</p>
            <p>${templates.tag.ilink { to = data.implementation1; content = "Current implementation"; }} <img src="https://img.shields.io/github/stars/fractalide/fractalide.svg?style=flat-square"> <img src="https://img.shields.io/github/forks/fractalide/fractalide.svg?style=flat-square"> <img src="https://img.shields.io/badge/license-MPLv2-blue.svg?style=flat-square">
            </p>
          </div>
          <div class="row">
            <p>${data.text2}</p>
            <p>${templates.tag.ilink { to = data.link2; content = "Download Master Thesis"; }}</p>
            <p>${templates.tag.ilink { to = data.implementation2; content = "Original Master Thesis implementation"; }}</p>
          </div>
        </div>
      </div>
    '';
  })
)
