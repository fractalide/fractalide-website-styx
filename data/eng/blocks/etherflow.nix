{ lib, ... }:
with lib;
{
  id = "etherflow";
  title = "Etherflow";
  subtitle = "A New Ethereum Classic Client";
  content = markdownToHtml ''
    Etherflow is a set of software components that'll heavily leverage ETCDEV's Emerald SDK.

    We aim for these important results:

    * Etherflow should present a convenient interface for users to interact with the ETC blockchain.
    * Reusable components will allow deep blockchain interaction with applications created by HyperFlow.
    * Long term collaboration with ETCDEV team is required to assist expanding out Emerald SDK's functionality and ensuring it operates in a stable expected fashion.
  '';
}
