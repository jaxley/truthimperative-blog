---
title: Low Bandwidth Application Dos Attacks
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:59:48-07:00
tags:
  - security
  - post
date: 2003-06-02T11:25:00.000-07:00
published: true
url: /2003/06/low-bandwidth-application-dos-attacks.html
aliases:
  - Low-bandwidth-application-dos-attacks
linter-yaml-title-alias: Low-bandwidth-application-dos-attacks
---


Interesting work and something that I can't seem to get many people to pay attention to. Not all DoS attacks are bandwidth exhaustion attacks. DoS attacks can be thought of generically as resource exhaustion or suppression attacks. This does not necessarily require using a large amount of bandwidth.  
  
The traditional thoughts on DoS attacks cause people to believe that normal modes of monitoring systems will catch DoS attacks early just because it would be hard to not notice such brazen resource consumption. However, low-flying attacks could possibly cause DoS attacks that are more difficult to detect without finer-grained application-level monitoring than is often employed.  
  
This work documents attacks on the complexity of applications themselves to cause DoS.  
  
[Denial of Service via Algorithmic Complexity Attacks](https://www.cs.rice.edu/~scrosby/hash/CrosbyWallach_UsenixSec2003/index.html "Denial of Service via Algorithmic Complexity Attacks")  
  
We present a new class of low-bandwidth denial of service attacks that exploit algorithmic deficiencies in many common applications' data structures. Frequently used data structures have \`\`average-case'' expected running time that's far more efficient than the worst case. For example, both binary trees and hash tables can degenerate to linked lists with carefully chosen input. We show how an attacker can effectively compute such input, and we demonstrate attacks against the hash table implementations in two versions of Perl, the Squid web proxy, and the Bro intrusion detection system. Using bandwidth less than a typical dialup modem, we can bring a dedicated Bro server to its knees; after six minutes of carefully chosen packets, our Bro server was dropping as much as 71% of its traffic and consuming all of its CPU. We show how modern universal hashing techniques can yield performance comparable to commonplace hash functions while being provably secure against these attacks.