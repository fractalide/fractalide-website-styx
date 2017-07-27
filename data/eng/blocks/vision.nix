{ lib, templates, ... }:
with lib;
{
  id = "vision";
  title = "Vision";
  content = markdownToHtml ''
    Cryptocontracts will never reach mainstream as long as we keep publishing contracts to a blockchain address and expect grandmothers to interact with that address.
    What is expected; convenient one-click infrastructure that delivers well designed user facing applications which contain the business rules to interact with the contract's immutable rules. The end user should barely see the cryptocontract address and primarily interact with the application.

    The vision is to create three infrastructure level applications.

    1. **${templates.tag.ilink { to = "/#hyperflow"; content = "Hyperflow"; class = "page-scroll"; }}**: A Rapid Application Development (RAD) platform
    2. **${templates.tag.ilink { to = "/#fractalmarket"; content = "Fractamarket"; class = "page-scroll"; }}**: An integrated app marketplace
    3. **${templates.tag.ilink { to = "/#etherflow"; content = "Etherflow"; class = "page-scroll"; }}**: A set of reusable components that make Hyperflow applications interacting with the blockchain seamless.

    **Hyperflow** facilitates the creation of applications which can be published on **Fractalmarket**. **Fractalmarket** aims to be the canonical repository for user facing cryptocontract applications created by third party vendors.
  '';
  icon = "eye";
}
