{ lib, ... }:
with lib;
{
  id = "hyperflow";
  title = "Hyperflow";
  subtitle = "Rapid Application Development platform";
  content = markdownToHtml ''
    Hyperflow draws much inspiration from [HyperCard](https://en.wikipedia.org/wiki/HyperCard). It allows programmers and non-programmers to easily build problem solving applications. Though we will differ from HyperCard on these points.

    HyperCard concepts to keep:

    * The intuitive, semantically clear and easy to learn approach HyperCard is famous for.
    * It's very easy to see and test what you just built, by simply switching between a run mode and execution mode.
    * Keep the concept of cards and stacks, a good analogy is a card is a webpage and a stack is a website. Each card contains GUI components and logic that links all the other cards together to form an stack of cards.

    HyperCard concepts to remove:

    * Remove the HyperTalk programming language and replace it with Flowscript. HyperTalk isn't a powerful enough programming language for more serious apps.
    * Design it such that stacks can be shareable and reproducible across networks of computers.
  '';
}
