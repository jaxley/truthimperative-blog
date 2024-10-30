---
title: Caja Capability Model For Javascript
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:56:55-07:00
tags:
  - post
date: 2008-01-01T08:31:00.000-08:00
published: true
url: /2008/01/caja-capability-model-for-javascript.html
aliases:
  - Caja-capability-model-for-javascript
linter-yaml-title-alias: Caja-capability-model-for-javascript
---


This could be one of the coolest things to come along in a while.  I heard it mentioned at OWASP and then just found an article on [Financial Cryptography](https://financialcryptography.com/) about it as well.  
  
FYI, wikipedia article on [Capability-based security](http://en.wikipedia.org/wiki/Capability-based_security)  
  
[Links » Caja: Capability Javascript](http://www.links.org/?p=271)  

> ...rather than modify Javascript, we restrict it to a large subset. This means that a Caja program will run without modification on a standard Javascript interpreter - though it won’t be secure, of course! When it is compiled then, like CaPerl, the result is standard Javascript that enforces capability security. What does this mean? It means that Web apps can embed untrusted third party code without concern that it might compromise either the application’s or the user’s security.