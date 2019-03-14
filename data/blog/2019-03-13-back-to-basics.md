{---
title = "A Focus on Social Scalability";
tags = [ "social scalability" ];
level = [ "★★" ];
author = { name = "Stewart Mackenzie"; image = "photo-stewart-min.png"; };
---}

A step back and reassessment
>>>

At FOSDEM 2019 it dawned on me that our entire approach to reproducibility is incorrect.

Right, back to the drawing board. What are the major important aspects of this system we're trying to build?
Let's take a step back from purely technical objectives. Software after all is meant to be used by people, programmer or not. Therefore the core goals should be social in nature.

[Social scalability](https://unenumerated.blogspot.com/2017/02/money-blockchains-and-social-scalability.html), a term coined by Nick Szabo describes a community that is amenable to increasing in size yet retaining the original intent of the endeavour. Let's isolate the social scalabilities of the system and focus on these entirely. What are they?

Cryptocurrency is one such social scalability enabler; in that no matter how many coins a person holds the consensus protocol treats you the same regardless. We definitely want to retain this concept because humans trade things and a medium of exchange facilitates this. Coupled with a browser which presents information, it becomes a no-brainer, because as demonstrated by the HTTP browser (of yore), they too struggled with integrating a medium of exchange.

[Information Centric Networking](https://en.wikipedia.org/wiki/Information-centric_networking) (ICN) is one other enabler. This point is more subtle because it requires knowledge of communication systems. ICN allows anyone to have the data dissemination capabilities as that of tech giants such as Twitter, Google, Facebook and Amazon AWS. Akin to the above example whereby no matter how many coins held, the protocol treats you the same. So, in ICN no matter how big your node is, the ICN protocol makes data dissemination cheap to you. Thus in order to scale your application's audience you no longer need to hire expensive software and networking engineers to scale up your TCP/IP host to support millions of concurrent connections. Data now has no canonical home and roams the network where there is demand.

The last of the social scalability factors I recently discovered when I visited [Runtime Verification Inc](https://www.runtimeverification.com) in Urbana-Champaign in Illinois, U.S.A. is what can be described as verified computing. Exploits in programming languages can be significantly mitigated by no longer using ad hoc implemented programming language interpreters and compilers and instead relying on [operational semantics](https://en.wikipedia.org/wiki/Operational_semantics). [K](http://www.kframework.org/index.php/Main_Page), a best effort implementation of operational semantics, draws from all the major theory of operational semantics and turns it into something practical, in that, K has been used to define large languages such as C, Java, Javascript to great success. But what has this got to do with a social scalability? Two reasons:

First, we can implement smart contracts using this matching logic. A proof object can be created and fed into a zk-snark which then can be put onto the blockchain and run to verify that all the steps necessary to obtain the result of a contract has been run. This means we can trust that remote computation has properly followed the steps required to obtain the result and no shenanigans were at play. Allowing us to quickly, simply and easily trust the proof object or snark instead of having to setup wetware-intensive, complicated trusted computing environments.

Second, we remove an entire class of errors associated with [language security](http://langsec.org/). The definition and implementation of a language is reduced to a single specification that is executable. This significantly lowers the implementation costs of a language. K allows one, to implement and specify a language, where the specification *is* the implementation. It's a meta-language at the correct level of abstraction which addresses the problem of implementing languages. Because, going one step deeper, computation is in essence pattern matching which can be described by First Order Logic combined with Matching Logic.

Millions of dollars are lost due to exploits of ad hoc language implementations written by deeply technical crackers. By using this meta language called K we will be able to remove this asymmetric advantage crackers have.

In each case of the above social scalability points significant asymmetric advantage is removed. Cryptocurrencies removed the costs to setup and run banking infrastructure. ICN removes the costs of data dissemination and K removes the intellectual asymmetric advantage crackers have when they exploit mismatches between language implementation and language specification (if you're lucky to have a specification in the first place!). To run a business in the information age we need financial transactions, the ability to build secure correct applications and the ability to disseminate them.

So back to the original subject of incorrectly achieving reproducibility.

We've been trying to reproduce applications by breaking applications down into atomic agents which compose into a recursive graphs. Then trying to disseminate the recursive graph of agents over an ICN by using [nix](https://nixos.org/nix). Upon examination, nix, while it's wonderful software, is in essence a system to do package dissemination over a point-to-point communication system. One of our core objectives is to remove the dependency on a point-to-point communication systems (all packages are derived from either a centrally hosted cache or via hosts like github, including all the point-to-point communication system dependent language level package managers `nix` sets about abstracting). We thus need a way to retain the reproducibility of nix whilst side stepping the explicit TCP/IP dependency. We need to build reproducibility directly into K.

Enter reproducible K. A system where all languages have the concept of named data dissemination built directly into the execution environment.

The above needs unpacking a bit: We learned long ago not to write directly to memory addresses instead let the programming language defer the job to the kernel. Memory addresses aren't fun to deal with, especially when different devices have different addressing schemes. So why do we lose our minds and all of a sudden demand using IP addresses when doing networking? We shouldn't be looking for dependencies from the file system, because most of the time transitive dependencies are not on your file system. The import mechanism should be network and file system agnostic. Just as programming languages operate on different file systems. The only way to achieve this is to remove the host centric indirection used to obtain data and name data directly. The correct place to expose this concept is exactly at the point you import or call for data in your programming language.

K needs to be modified so that `include` map directly to an ICN call to obtain data to be included. This simple change is sufficient to achieve our desired ends.

This gives us the ability to achieve [Language Oriented Programming](https://en.wikipedia.org/wiki/Language-oriented_programming) whereby all languages have a sound mathematical foundation, namely [Matching µ-Logic](http://fsl.cs.illinois.edu/index.php/Matching_mu-Logic) as implemented by K, yet retain one single execution environment that is expressive enough to implement smart contracts, proof systems, general and domain specific programming environments and verified execution scenarios.

A new project is to be started, initially called `xin` because it's the reverse of `nix`, a reproducible system. As a hat tip to K, it seems appropriate to use the letter `k`. Hence, call it `kin`.

`Kin` should consist of three major components to start off with. 1) K 2) ICN and 3) a cryptocurrency. This allows the development of correct, reproducible, reusable, composable command line applications amenable to financial transactions. Later once we have this basic setup, a K language that maps directly to a graphical user interface toolkit allows us to implement the Trulity browser.

This design gives us a platform which implements the above 3 socially scalable systems.
