---
title: Memory Errors Trick Virtual Machines
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:56:48-07:00
tags:
  - security
  - post
date: 2004-10-26T20:33:00.000-07:00
published: true
url: /2004/10/memory-errors-trick-virtual-machines.html
aliases:
  - Memory-errors-trick-virtual-machines
linter-yaml-title-alias: Memory-errors-trick-virtual-machines
---


Interesting paper on how to use memory errors to attack a virtual  
computer. The attack exploits the fact that a "time of compilation"  
check is not necessarily valid at "time of use."  
  
This happens to be the theory behind the Java ByteCode verifier. I just heard Whit Diffie talk yesterday at SecureWorld Expo about how the run-time check of the bytecode is intended to validate that proper array bounds checking is going to be done, for example.