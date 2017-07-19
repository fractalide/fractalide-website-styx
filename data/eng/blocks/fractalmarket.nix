{ lib, ... }:
with lib;
{
  id = "fractalmarket";
  title = "Fractalmarket";
  subtitle = "An Integrated App Marketplace";
  content = markdownToHtml ''
    HyperFlow components and applications should be shared with people. This will be done via FractalMarket.

    FractalMarket has these features:

    * Users may buy and sell components and applications for FRACTAL.
    * Users may search and download components and applications.
    * We are aligning FractalMarket to reward people for creating and using reusable components.
  '';
}
