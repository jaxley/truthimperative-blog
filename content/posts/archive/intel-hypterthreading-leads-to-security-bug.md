---
title: Intel Hypterthreading Leads To Security Bug
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - security
  - post
date: 2005-05-13T00:37:00.000-07:00
published: true
url: /2005/05/intel-hypterthreading-leads-to-security.html
aliases:
  - Intel-hypterthreading-leads-to-security-bug
linter-yaml-title-alias: Intel-hypterthreading-leads-to-security-bug

---y-bug
---


[Hyper-Threading considered harmful](http://www.daemonology.net/hyperthreading-considered-harmful/ "Hyper-Threading considered harmful")  
  
This is an interesting case where a hardware flaw can be used to subvert software security.  
  
I find it fun to ask vendors who create their own OS and processors for appliances how they ensure things such as memory page protection. I get a lot of blank stares. They often focus entirely on the macro-level security in their software and have spent little to no time addressing the basic hardware and OS-level security issues that are taken for granted by software authors.