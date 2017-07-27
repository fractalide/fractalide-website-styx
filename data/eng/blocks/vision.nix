{ lib, templates, ... }:
with lib;
{
  id = "vision";
  title = "Vision";
  content = markdownToHtml ''
    It is unintuitive for non-technical end users to interact with published cryptocontracts. For this reason cryptocontracts will not easily reach mainstream.

    What is expected; a convenient one-click infrastructure that delivers beautiful 3rd party vendor applications which are designed to interact with cryptocontracts. The end user should primarily interact with the applications.

    The vision is to create three infrastructure level applications that enable the above.

    1. **${templates.tag.ilink { to = "/#hyperflow"; content = "Hyperflow"; class = "page-scroll"; }}**: A Rapid Application Development (RAD) platform
    2. **${templates.tag.ilink { to = "/#fractalmarket"; content = "Fractalmarket"; class = "page-scroll"; }}**: A cryptocontract app marketplace
    3. **${templates.tag.ilink { to = "/#etherflow"; content = "Etherflow"; class = "page-scroll"; }}**: A set of reusable components that make Hyperflow applications interacting with the blockchain seamless.

    **Hyperflow** facilitates the creation of applications which can be published on **Fractalmarket**. **Fractalmarket** aims to be the canonical repository for user facing cryptocontract applications created by third party vendors.
  '';
  icon = "eye";
}
