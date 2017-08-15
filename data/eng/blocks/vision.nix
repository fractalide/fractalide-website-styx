{ lib, templates, prefix, ... }:
with lib;
{
  id = "vision";
  title = "Vision";
  content = markdownToHtml ''
    Fractalide is a marketplace of reusable components that can be used with graphical programming tools to build a solution to virtually any problem.

    Currently it is unintuitive for non-technical end users to interact with published cryptocontracts. For this reason cryptocontracts will not easily reach mainstream.

    End users expect a convenient one-click platform that delivers user friendly yet secure third party applications which are designed to use cryptocontracts.
    This platform can be broken down into three parts: building, distribution and the blockchain interaction parts.

    The vision is to build a platform that makes the building and distribution of blockchain friendly applications laughably easy.

    1. **${templates.tag.ilink { to = prefix + "/#hyperflow"; content = "Hyperflow"; class = "page-scroll"; }}**: A Rapid Application Development (RAD) platform
    2. **${templates.tag.ilink { to = prefix + "/#fractalmarket"; content = "Fractalmarket"; class = "page-scroll"; }}**: A cryptocontract app marketplace
    3. **${templates.tag.ilink { to = prefix + "/#etherflow"; content = "Etherflow"; class = "page-scroll"; }}**: A set of reusable components that make Hyperflow applications interacting with the blockchain seamless.

    **Hyperflow** facilitates the creation of applications and components such as **Etherflow** which can be published on **Fractalmarket**. **Fractalmarket** aims to be the main marketplace that allows buying and selling of cryptocontract applications between third party vendors and end users.
  '';
  icon = "eye";
}
