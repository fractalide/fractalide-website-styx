{---
title = "Reusability and Composability";
tags = [ "reusability" "Composability" ];
level = [ "★★" ];
author = { name = "Stewart Mackenzie"; };
---}

This non-technical post introduces the concepts of reusability and composability and why they are important.

>>>

The phrase `Do One Thing and Do It Well` derives from the [Unix Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy), which is a distillation of good programming habits accumulated over time.

`DOTADIW` is a convention which tends to make programming simpler by constraining possible bugs to small bits of code that do one thing only. When code becomes entangled it becomes difficult to get to the root of the problem. So programmers will go to great lengths to separate concerns into different functions, modules, indeed different executables entirely.

For those of you using a Unix, be it MacOS or Linux this is why there are so many different command line tools such as `cat`, `ls`, `grep` etc. Each pretending to do one thing well.

Once you have a suite of these specialized tools, one needs to compose them. In Unix, each tool has an input (`stdin` standard input) and two outputs (`stdout` standard output and `stderr` standard error). These standard communication channels are shared between all these tools, essentially it means they speak the same language.

When programs conform to `DOTADIW` and have a means to compose together they automatically become reusable. Indeed the reusability factor of a tool goes even higher when it is used in ways the original designer hadn't intended it to be used.

It's not a trivial task to achieve reusability, it requires years of programming to get it right, after all, good programmers write good code, great programmers reuse good code.

Fractalide achieves a high degree of component reusablitiy by defining networks of black box Agents, which exchange typed data across predefined connections using message passing, where the connections are specified externally to the processes. These black box Agents can be reconnected endlessly to form different executable Subgraphs without having to be changed internally.

This type of programming is called [Flow-based Programming](https://en.wikipedia.org/wiki/Flow-based_programming) and was discovered by J. Paul Morrison in the early 1970s.

A programmer can move much faster when relying on nice composible reusable modules. These modules have been battle hardened by other users, bugs have been squashed and optimizations have been done. It's less code a programmer has to write allowing them to focus on the business requirements.

To illustrate the importance of reusability, a private sector space company has gone to great effort to achieve reusable rockets, allowing them to undercut their competition by a significant margin. Typically the rocket industry will drash their first stage and pay for another.

{{ templates.media.giphy { id = "PDxh2xVRbsHe0"; height = 360; width = 480; } }}

Reproducability and composability will only get you so far. To make it really concoction really potent you need a reproducible system. Subject for another [blog post](/news/2017-07-13-reproducibility.html).
