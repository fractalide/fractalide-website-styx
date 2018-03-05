{ lib, templates, prefix, ... }:
with lib;
{
  id = "etherflow";
  title = "Why CARDANO?";
  subtitle = "A safe, secure, scalable blockchain";
  content = markdownToHtml ''
    Designed from first principles, the CARDANO blockchain will be the most powerful, customizable, scalable platform out there.

    Although Fractalide is not associated with IOHK, Cardano Foundation nor Emurgo, we feel strongly that CARDANO is the way of the future hence we're putting money on that horse.

    Reasons for choosing CARDANO:

    * CARDANO is designed in layers, separating money from the machine. The Settlement Layer and Computation Layer exist independently of each other.
    * The Computation Layer makes use of Grigore Rosu's K-Framework, an executable semantics framework. Meaning any programming language created with it is formally specified out of the box. Ensuring your smart contract code does exactly what it's meant to do. Thus taking significant steps at avoiding catastrophic events like the Ethereum DAO cracking event and the Parity multi-sig debacle.
    * Plutus the CARDANO smart contract programming language is designed by Philip Wadler.
    * High (enough) assurance code: CARDANO implements Ouroboros, a provably secure Proof of Stake consensus algorithm, where the semantic gap between implementation and theory was closed by incremental developments ensuring shipped code accurately matches specification.
    * Ouroboros draws a few important ideas from Silvio Micali's Algorand and thus is in the same family of energy efficient and democratic Proof of Stake algorithms.
    * The development and research team behind CARDANO are best of breed.
    * A treasury using Liquid Democracy takes steps at ensuring the CARDANO blockchain is properly maintained.
  '';
}
