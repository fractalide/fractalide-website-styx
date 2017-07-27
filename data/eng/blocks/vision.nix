{ lib, templates, ... }:
with lib;
{
  id = "vision";
  title = "Vision";
  content = markdownToHtml ''
    It is not intuitive for non-technical end users to interact with published cryptocontracts. For this reason cryptocontracts will not easily reach mainstream.

    What is expected; a convenient one-click infrastructure that delivers well designed user facing applications which contain the business rules to interact with the contract's immutable rules. The end user should barely see the cryptocontract address and primarily interact with the application.

    The vision is to create three infrastructure level applications that enable the above.

    1. **${templates.tag.ilink { to = "/#hyperflow"; content = "Hyperflow"; class = "page-scroll"; }}**: A Rapid Application Development (RAD) platform
    2. **${templates.tag.ilink { to = "/#fractalmarket"; content = "Fractalmarket"; class = "page-scroll"; }}**: A cryptocontract app marketplace
    3. **${templates.tag.ilink { to = "/#etherflow"; content = "Etherflow"; class = "page-scroll"; }}**: A set of reusable components that make Hyperflow applications interacting with the blockchain seamless.

    **Hyperflow** facilitates the creation of applications which can be published on **Fractalmarket**. **Fractalmarket** aims to be the canonical repository for user facing cryptocontract applications created by third party vendors.
  '';
  icon = "eye";
}
