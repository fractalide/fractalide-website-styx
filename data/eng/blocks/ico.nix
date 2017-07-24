{ lib, templates, ... }:
with lib;
{
  id = "ico";
  title = "Join ICO";
  content = markdownToHtml ''
    **Token Name:** Fractal Coin  
    **Token Symbol:** FRC  
    **Token Purpose:**

    * The FRACTAL coin will be traded between component sellers and buyers in the ${templates.tag.ilink { to = "/#fractalmarket"; content = "Fractalmarket"; class = "page-scroll"; }}. This coin has real utility and not just speculative in nature.

    **Important note:**

    * FRACTAL is **not** a security, you **cannot** earn dividends as FRACTAL does not represent company equity.
    * We will not immediately convert your contributions into Fiat currency thus creating an unstable market, indeed we aim to pay salaries in ETC.
    * It takes an entire open source community of people building, sharing, trading and contributing software for the FRACTAL coin to become valuable.

    **Contribute:**

    Please participate in the ICO over at Token Mint as long as you follow these guidelines:

    * Don't invest more than you can afford to lose.
    * Don't invest in things you don't understand.

    Note: Token Mint has not launched yet so the ICO isn't ready yet
  '';
  extra = ''
    <div class="text-center">
    <a href="http://tokenmint.io" class="btn btn-xl">Join ICO</a>
    </div>
  '';
  icon = "money";
}
