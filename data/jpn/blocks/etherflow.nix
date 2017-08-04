{ lib, templates, prefix, ... }:
with lib;
{
  id = "etherflow";
  title = "イーサフロー";
  subtitle = "ハイパーフローアップとブロックチェーンのシームレス相互作用";
  content = markdownToHtml ''
    イーサフローは、${templates.tag.ilink { to = prefix + "/#hyperflow"; content = "ハイパーフロー"; class = "page-scroll"; } }で作られたアプリケーションとイーサリアムクラッシックのシームレス相互作用を可能にするコンポネントセットです。

    私たちの目指す成果:

    * Emerald SDKの機能を拡張し、安定した予測可能な方法で動作することを保証するためにも、ETCDEVチームとの長期的な協力が必要です。 
    * ETC DEVライブラリを使用してEtherflowを作成し、Hyperflowアプリケーションがブロックチェーンの相互作用を持つようにします。
    * ICOは完全なETCクライアントをカバーしていませんが、一般的な方向はEtherflowとHyperflowを新しいETCクライアントに拡張します。
  '';
}
