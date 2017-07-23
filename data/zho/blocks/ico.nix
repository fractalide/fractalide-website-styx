{ lib, templates, ... }:
with lib;
{
  id = "ico";
  title = "参与ICO";
  content = markdownToHtml ''
    **代币名称:** Fractal Coin
    **代币代码:** FRC
    **发行代币目的:**

    * 买卖组件双方将在${templates.tag.ilink { to = "/zho/#fractalmarket"; content = "Fractalmarket"; class = "page-scroll"; }}中以FRACTAL代币进行交易，所以FRACTAL代币具有实用价值，而不仅是投机性的。

    **重要事项：**

    *  FRACTAL代币不是一种债券，FRACTAL不代表公司股权，所以是不能获得股息的。
    * 我们不会马上将您的贡献转换成法定货币，从而造成不稳定的市场，我们的目标是以ETC支付工资。
    * 当整个开源社区的人构建软件，共享和付出，FRACTAL代币就变得有价值。

    **投资:** 请在Token Mint参与ICO并留意以下指引:

    * 不要投资超过你能承受的损失。
    * 不要投资你不明白的事情。

    注意:Token Mint还没有启动，所以ICO尚未开始
  '';
  extra = ''
    <div class="text-center">
    <a href="http://tokenmint.io" class="btn btn-xl">参与ICO</a>
    </div>
  '';
  icon = "money";
}
