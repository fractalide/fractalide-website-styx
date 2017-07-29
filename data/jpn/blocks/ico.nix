{ lib, templates, prefix, ... }:
with lib;
{
  id = "ico";
  title = "ICOに参加";
  navbarTitle = "ICO";
  content = markdownToHtml ''
    **通貨名:** Fractal Coin  
    **通貨記号:** FRC  
    **通貨目的:**

    * FRACTALコインは${templates.tag.ilink { to = prefix + "/#fractalmarket"; content = "フラクタルマーケット"; class = "page-scroll"; }}のコンポーネント売り手とバイヤーの間で取引されます。 FRACTALコインは本質的に投機的なものではなく、実用性があります。

    **重要な注意点**：

    * FRACTALは証券ではなく、FRACTALは会社株式を表すものではないので、配当を得ることはできません。
    * 私たちは即座にあなたのコントリビューションをフラット通貨に変換せず、不安定な市場を作り出します。実際にはETCで給料を支払うことを目指しています。
    * FRACTALコインを価値あるものにするために、ソフトウェアの構築、共有、取引する人々のオープンソースコミュニティ全体が必要です。

    **コントリビュート:**

    次のガイドラインに従い、Token MintのICOに参加ください:

    * あなたの余裕以上にコントリビューションすることはできません。
    * 理解せず投資はできません。


    注意: Token MintがリリースされるまでICOは準備中です。
  '';
  extra = ''
    <div class="text-center">
    <a href="http://tokenmint.io" class="btn btn-xl">ICOに参加</a>
    </div>
  '';
  icon = "money";
}
