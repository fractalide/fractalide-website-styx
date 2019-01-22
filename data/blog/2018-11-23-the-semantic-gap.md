{---
title = "The Semantic Gap";
tags = [ "formal semantics" "formal verification" ];
level = [ "★★" ];
author = { name = "Stewart Mackenzie"; image = "photo-stewart-min.png"; };
---}

The Semantic Gap

>>>

Executable semantics are making inroads into cryptographic currencies. This interests us greatly, for good reasons, and is one of the primary reasons we're building Fractalide on Cardano. Blockchains are facing a situation not normally encountered, the contract source code is publicly visible to the world. This is a honey pot for crackers who will certainly attempt to crack a contract with a large amount of money in it.

Having formal semantics, and semantics proof of your smart contract, puts up a clear, bright red sign to prospective attackers: "Access denied, don't even bother". New terminology such as "the semantic gap", "formal semantics", "executable semantics", "formal semantic compilation" etc have entered into the community's lexicon. This essay attempts to clarify the need for formal semantics, what problem they're solving, and how they provide a stable foundation for smart contract programmers, who live in terror that their contracts will be exploited.

```
int main (void) {
  int x = 0;
  return (x = 1) + (x = 2);
}
```

This program attempts to add 1 and 2, what does `main` return?

<ol>
  <li>According to the C "standard", it is <code>undefined</code></li>
  <li>GCC4, MSVC: <code>returns 4</code></li>
  <li>GCC3, ICC, CLANG: <code>returns 3</code></li>
  <li>In April 2011, both Frama-C (using the Jessie verification plugin) and Havoc "prove" it <code>returns 4</code></li>
</ol>

The C Standard, an 800 page document describes this sequence of characters as `undefined`. As we can see, different compilers return different results. GCC4 and the Microsoft Visual C++ compiler returns `4`, GCC3, Intel C++ Compiler and CLANG return `3`. While these two cases are considered acceptable in C, leaving the onus on the programmer to ensure their program is correct. What is preposterous is the 4th point, formal program verifiers are proving something that is `undefined` according to the standard *and* is clearly incorrect. If the software in your pacemaker exhibits this behaviour, you die. Should your smart contract exhibit this behaviour, you go broke.

Since the dawn of the bit universe created by Charles Babbage and Ada Lovelace in 1822, we've been translating application domain problems such as bookings and reservations into solutions executed in the execution domain. The abyss between the application domain and the execution domain is called the semantic gap. The task was to translate the semantics, or meaning, of a problem domain into the solution/execution domain. In the early 1950s there were no high level languages other than Plankalkül. We wrote code in machine language, hand coding 1s and 0s.
<p>
![](/img/blog/the-semantic-gap/semantic-gap-01-min.png)
<p>
Programmers crossed the treacherous semantic gap armed with pocket pens used to jot down program semantics, CPU instruction knowledge and insanely expensive computers the size of a room. In 1956, FORTRAN's first manual was written, a programming language with actual English words. Machine language programmers weren't having it, FORTRAN was less efficient, they said, real programmers coded on metal, they said.
<p>
![](/img/blog/the-semantic-gap/semantic-gap-02-min.png)
<p>
Efficiency was indeed compromised, the stalwarts' valid argument of computing time being expensive compared to, a much cheaper programmer time held fast. New computers arrived with improved instruction sets requiring programmers to relearn yet another instruction set. Rebel programmers tired of this moving target and picked up this confounded FORTRAN. It was addictive. Programmers expressed more complex ideas with less code, and FORTRAN could target different instruction sets. This meant programmers could learn a single language and build support for a new instruction set into FORTRAN. This was the first solid attempt at bridging the semantic gap.
<p>
![](/img/blog/the-semantic-gap/semantic-gap-03-min.png)
<p>
The semantic gap consists of two types of gaps, grey section bridges the specification semantic gap and the red section, the execution semantic gap. The specification gap describes a scenario when you have two different specifications of the same task. The execution gap describes a scenario whereby a single specification is implemented by two different programming languages. A good example of the specification gap is how the yellow paper uses impenetrable language to specify the Ethereum Virtual Machine, yet the paper `KEVM: A Complete Semantics of the Ethereum Virtual Machine` uses clear and precise language to describe the KEVM.

We make use of specifications, design, implementation, interpreters and translators (compilers) to translate semantics from the application domain into the execution domain. Specifications, design and implementation *are the grey side* of the bridge. Teams of people translate the application domain semantics into high-level code humans can reason about with respect to the specification.
Interpreters and translators *are the red side* of the bridge, they translate the semantics from the high-level code into the execution domain. Interpreters execute the code directly and completely bridge the execution gap, albeit execution is slower. Translators take a different approach by translating semantics from a source language to a target language along a series of interlinking languages that form the red side of the bridge, much like a simple suspension bridge. Semantics are lost at every translation step, but the resulting file (executable) created executes directly on the CPU and outperforms interpreted programs.

<p>
![](https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Pieter_Bruegel_the_Elder_-_The_Tower_of_Babel_%28Vienna%29_-_Google_Art_Project.jpg/800px-Pieter_Bruegel_the_Elder_-_The_Tower_of_Babel_%28Vienna%29_-_Google_Art_Project.jpg "Tower of Babel")
<p>

Our Machine God has scattered our virtual machines and they no longer understand one another. The Bridge of Babel is no longer fit for purpose because we used mud bricks instead of stone and melting tar instead of mortar. Our intent of making a name for ourselves has become confused. Building with formal executable formal semantics is to build with stone and mortar. Then nothing we plan to do will be impossible for us.

It's not all biblical doom and gloom. While programming languages can and do successfully bridge the execution semantic gap when it comes to smart contracts with publicly visible source code published on the blockchain you certainly want to have executable formal semantics, preferably with a signed proof attached to the contract. This approach is the only way that ensures the syntax and semantics of the programming language is completely legit.

Well what is formal syntax? Extended Backus–Naur form (EBNF) is a metasyntax which can be used to describe context-free grammar. It's used to make a formal description of a formal language, which can be used as a computer programming language.

Here's an example of what EBNF looks like:

```
digit excluding zero = "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
digit                = "0" | digit excluding zero ;
```
Here we define a *rule* for a nonterminal digit which is on the left side of the assignment ("="). A vertical bar represents an *alternative*, immediately followed by terminals enclosed in quotation marks, ending with a semicolon character. In this example we define a *digit* to be a "0" followed by a *digit excluding zero*, which can be 1, 2, 3 and so forth till 9.

So how would we define a natural number?

```
natural number = digit excluding zero, { digit } ;
```
Some definitions of natural numbers do not include 0, in this case we won't include 0. The use of `{` and `}` allows expressions to be omitted or have repeated occurrences.

How would one define an integer?

```
integer = "0" | [ "-" ], natural number ;
```
The use of `[` and `]` means whatever is in there can only have one occurrence or none at all. This allows an integer which can be a 0, a natural number or a negative number.    


For the curious, this is what a definition of EBNF looks like described in EBNF.

```
letter = "A" | "B" | "C" | "D" | "E" | "F" | "G"
       | "H" | "I" | "J" | "K" | "L" | "M" | "N"
       | "O" | "P" | "Q" | "R" | "S" | "T" | "U"
       | "V" | "W" | "X" | "Y" | "Z" | "a" | "b"
       | "c" | "d" | "e" | "f" | "g" | "h" | "i"
       | "j" | "k" | "l" | "m" | "n" | "o" | "p"
       | "q" | "r" | "s" | "t" | "u" | "v" | "w"
       | "x" | "y" | "z" ;
digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
symbol = "[" | "]" | "{" | "}" | "(" | ")" | "<" | ">"
       | "'" | '"' | "=" | "|" | "." | "," | ";" ;
character = letter | digit | symbol | "_" ;

identifier = letter , { letter | digit | "_" } ;
terminal = "'" , character , { character } , "'"
         | '"' , character , { character } , '"' ;

lhs = identifier ;
rhs = identifier
     | terminal
     | "[" , rhs , "]"
     | "{" , rhs , "}"
     | "(" , rhs , ")"
     | rhs , "|" , rhs
     | rhs , "," , rhs ;

rule = lhs , "=" , rhs , ";" ;
grammar = { rule } ;
```

So an EBNF allows one to formally define the syntax of a language, what about the semantics?
It's so uncommon for programming language designers to discuss semantics, which is a great pity.

In the [words](https://wiki.haskell.org/Wadler's_Law) of Professor Philip Wadler, the designer of the Plutus smart contract language used in Cardano:

```
In any language design, the total time spent discussing
a feature in this list is proportional to two raised to
the power of its position.

     0. Semantics
     1. Syntax
     2. Lexical syntax
     3. Lexical syntax of comments
```

As described earlier, semantics pertain to the meaning of words or a language. It would make sense to have your semantics absolutely unambiguous. Not in a hand wavey ad hoc manner but preferably in the same way we use EBNF to formally define a syntax. The earliest occurrence of formalising the semantics of a language came with Alonzo Church's lambda calculus. Funnily enough Lambda Calculus was actually meant to replace Bertrand Russell and Alfred North Whitehead's Principia Mathematica which proves 1 + 1 = 2 in some 400 odd pages.

Fast forward many years skipping a lot of work, and we arrive at the [&Kopf;-Framework](http://www.kframework.org/index.php/Main_Page) of Grigore Rosu of the [FSL research group](http://fsl.cs.illinois.edu/index.php/Formal_Systems_Laboratory) at the University of Illinois at Urbana-Champaign, together with the [Runtime Verification Ltd.](https://runtimeverification.com/).

&Kopf;-Framework allows you to define the semantics of a programming language in much the same way one would do with the syntax of a language. It goes a step further, it executes the semantics of your program written in that language. Otherwise known as Operational Semantics. Thus achieving a complete bridging of the execution semantic gap.

The approach IOHK in collaboration with Runtime Verification (RV), UIUC and AICU is putting the horse before the cart. For example the ERC20 standard had formal semantics created. Rather serious errors were found in it. Considering that some ERC20 tokens are valued into the billions of US dollars. It makes sense to use something that is proven to mean what it's intended to mean. These organisations are creating a virtual machine called IELE with formal semantics right out the box.

IELE is a smart contract virtual machine that cherry picks the best from the EVM, LLVM and slaps on formal semantics. Though in order for IELE to become a reality, the core (kore) of &Kopf;, the actual execution machine, needs to be rewritten such that it's an order of magnitude faster. If this can be achieved then there is no incentive to hand roll (program by normal means) the IELE VM. One would define the IELE language in &Kopf; and a Virtual Machine would be generated by the &Kopf;-Framework.

If the speed up is possible, it means IELE is `correct by construction`. Which essentially is the gold standard, meaning that a sound model of what needs to be created is specified and the implementation is merely used to verify that the specification is correct. One does not empirically develop IELE code testing that it is correct. The entire VM is generated on the fly.

The question might arise, how do you know &Kopf; itself is correct? Well you bootstrap your language. Which means you implement the language in the same language. Defining &Kopf; in &Kopf; and speeding up the runtime represents two major milestones that essentially closing of the loop. The former is already [complete](https://github.com/kframework/k-in-k).

It's for this reason, this strict attitude towards formal language semantics we at Fractalide, feel Cardano is a good foundation to build on. Our platform is a decentralised application platform, we go to extreme efforts to provide tools so that normal people and programmers can build decentralised applications without having to setup a webserver. Which is a single point of failure that represents a weak spot prone to tyrannical regulatory attack and monopolisation.
