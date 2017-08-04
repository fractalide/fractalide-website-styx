{ lib, templates, prefix, ... }:
with lib;
{
  id = "vision";
  title = "理念";
  content = markdownToHtml ''
    非技術者エンドユーザーにとって、暗号コントラクトを利用するのは直観的ではないため、暗号コントラクトを主流にすることが難しいのが現在です。

    エンドユーザーは、暗号化契約を使用するように設計された、ユーザーフレンドリーで安全な第三者アプリケーションを提供する便利なワンクリックプラットフォームを期待しています。 このプラットフォームは、ビルディング、ディストリビューション、ブロックチェーンの相互作用の3つの部分に分けられます。 

    私たちのビジョンは、ブロックチェーンに簡単なアプリケーションの構築と配布を容易にできるプラットフォームを構築することです。

    1. **${templates.tag.ilink { to = prefix + "/#hyperflow"; content = "ハイパーフロー"; class = "page-scroll"; }}**: Rapid Application Development (RAD)プラットフォーム
    2. **${templates.tag.ilink { to = prefix + "/#fractalmarket"; content = "フラクタルマーケット"; class = "page-scroll"; }}**: 暗号コントラクトマーケットプレイス
    3. **${templates.tag.ilink { to = prefix + "/#etherflow"; content = "イーサーフロー"; class = "page-scroll"; }}**: HyperFlowとブロックチェーンをの相互作用をシームレスにする再利用できるコンポネントセットセット

    **ハイパーフロー**は**フラクタルマーケット**に公開するアプリケーションの開発を容易にします。フラクタルマーケットはユーザ向け暗号コントラクトアプリケーションの標準レポジトリを目指します。
  '';
  icon = "eye";
}
