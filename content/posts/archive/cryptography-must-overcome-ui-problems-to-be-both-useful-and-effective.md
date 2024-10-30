---
title: Cryptography Must Overcome Ui Problems To Be Both Useful And Effective
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:59:18-07:00
tags:
  - security
  - post
date: 2005-06-29T13:05:00.000-07:00
published: true
url: /2005/06/cryptography-must-overcome-ui-problems.html
aliases:
  - Cryptography-must-overcome-ui-problems-to-be-both-useful-and-effective
linter-yaml-title-alias: Cryptography-must-overcome-ui-problems-to-be-both-useful-and-effective
---


A great paper to read up on, especially given that Phishing is showing us that the "Trusted Third Party" model as implemented in today's web browsers is horribly broken.  
  
[Don Davis' Cryptography Articles](http://world.std.com/~dtd/). Specifically, read "Compliance Defects in Public-Key Cryptography".  
  
Abstract:  
Public-key cryptography has low infrastructural overhead because public-key users bear a substantial but hidden administrative burden. A public-key security system trusts its users to validate each others' public keys rigorously and to manage their own private keys securely. Both tasks are hard to do well, but public-key security systems lack a centralized infrastructure for enforcing users' discipline. A "compliance defect" in a cryptosystem is such a rule of operation that is both difficult to follow and unenforceable. This paper presents five compliance defects that are inherent in public-key cryptography; these defects make public-key cryptography more suitable for server-to-server security than for desktop applications.  
  
The slides (78 Kbytes) PDF (78 Kbytes) discuss a topic that the paper only touches upon: the complexity of thoroughly checking a certificate issuance-chain, to see whether any of the certs in the chain have been revoked recently. Even in the best case, this is a surprisingly messy procedure. See slides 12 & 13, and their annotations.