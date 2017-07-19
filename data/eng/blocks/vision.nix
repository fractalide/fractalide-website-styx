{ lib, templates, ... }:
with lib;
{
  id = "vision";
  title = "Vision";
  content = markdownToHtml ''
    The vision is to create three foundational applications that run on an existing programming platform called Fractalide.

    1. **${templates.tag.ilink { to = "/#hyperflow"; content = "Hyperflow"; class = "page-scroll"; }}**: A Rapid Application Development (RAD) platform
    2. **${templates.tag.ilink { to = "/#fractalmarket"; content = "Fractamarket"; class = "page-scroll"; }}**: An integrated app marketplace
    3. **${templates.tag.ilink { to = "/#etherflow"; content = "Etherflow"; class = "page-scroll"; }}**: A new Ethereum Classic client

    **Hyperflow** facilitates the creation of applications which can be published on **Fractalmarket**. **Etherflow** allows people to purchase applications on **Fractalmarket** or interact with other Ethereum Classic holders and contracts.
  '';
  icon = "eye";
}
