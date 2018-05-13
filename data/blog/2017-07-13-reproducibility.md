{---
title = "Reproducibility";
tags = [ "reproducibility" ];
level = [ "★★" ];
author = { name = "Stewart Mackenzie"; image = "photo-stewart-min.png"; };
---}

This non-technical post introduces the concept of reproducibility.

>>>

Scientists go to great effort to document their experiments in an attempt to make their experiment reproducibile. Other scientists absolutely need to be able to reproduce the work to falsify it. After all the scientific process is a falsifiable process. The scientific body is not proving something to be true, but indeed always proving something to be false. This is why the Scientific body have little concern for proving the existence of a god.

Without reproducibility the whole show comes to screeching halt.

A package manager is supposed to reproduce an application on your system with high confidence, in most cases they fail miserably, as described by Paul Draper's [Package Management: Stop using version ranges](https://www.lucidchart.com/techblog/2017/03/15/package-management-stop-using-version-ranges/) blog post.

Not using a package manager essentially means you need to manually download, setup all the program's dependencies and transitive dependencies.

As Fractalide is a flow-based programming system, it intrinsically has hundreds of components each with their own lifecycle. It would be inconcievable to manually download and setup every transitive dependency (including which version of `libc`) every time you want to run it on a different machine. This is the equivalent of building a house of cards then asking a client to reproduce it. Your client should issue a single command, or click and the house of cards is reconstructed immediately.

For this reason [nix](https://nixos.org/nix) is chosen to be Fractalide's package manager. Nix will deterministically reproduce a hierarchy of components on different machines allowing programmers to accurately reproduce failures and problem so they can be fixed.
