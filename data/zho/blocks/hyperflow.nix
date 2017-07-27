{ lib, ... }:
with lib;
{
  id = "hyperflow";
  title = "Hyperflow";
  subtitle = "快速应用程式开发平台";
  content = markdownToHtml ''
    Hyperflow是从[HyperCard](https://zh.wikipedia.org/wiki/HyperCard)中吸取灵感的。 HyperCard 是让程序员和非程序员上容易地创作应用程序的平台，不过我们从HyperCard中作出一此改动来编写Hyperflow。

    被保留的Hypercard概念:

    * 直接、清晰易学的方法，也就是HyperCard是著名特点。
    * 只需简单地在运行模式和执行模式之间切换就可以很容易地查看和测试刚构建的内容。
    * 保留卡片(card)和整叠卡片(stack)的概念，以比喻来说，一张卡片是一个网页，一个stack就是一个网站。每张卡片包含GUI组件和将所有其他卡片连接在一起形成stack的逻辑。

    被去除的Hypercard概念:

    * 去除编程语言HyperTalk，以Flowscript取而代之。因为对于比较复杂的apps，HyperTalk是不能应付的。
    * 这些stacks是被设计为可共享和可重复使用在互联网上。
  '';
}
