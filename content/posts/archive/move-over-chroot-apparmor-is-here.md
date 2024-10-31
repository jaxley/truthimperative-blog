---
title: Move Over Chroot Apparmor Is Here
source: 
created: 2024-10-06 21:27:13-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - technology
  - security
  - post
date: 2006-06-22T03:55:00.000-07:00
published: true
url: /2006/06/move-over-chroot-apparmor-is-here.html
aliases:
  - Move-over-chroot-apparmor-is-here
linter-yaml-title-alias: Move-over-chroot-apparmor-is-here

----here
---


> Plugging my own product, but what the hell, it is open source :)  
>   
> AppArmor [https://opensuse.org/Apparmor](https://opensuse.org/Apparmor) is an application security container technology for Linux. It lets you create application profiles  
> (policies) that define the files that the application can read, write, and execute. It lets you do this per-application, so you actually could allow users to upload arbitrary C/binary programs and expect them to behave as you specified. It provides an inheritance model so that you can't escape from this jail by exec'ing something fun: the child is controlled by policy too.  
>   
> And for confining PHP (and PERL code run by mod\_perl, and any other language interpreted in-place by Apache) AppArmor provides a change\_hat API call and a mod\_apparmor module for Apache, so that you can have AppArmor-style profiles wrapped around individual PHP pages and mod\_perl scripts, even though they never appear in the process table.  
>   
> If you find yourself between the rock of having to run some PHP or PERL code and a hard place of not trusting that code, try confining it with AppArmor, so that if/when the code screws up, it can only screw itself.  
>   
> Crispin  
>   
> \--  
> Crispin Cowan, Ph.D. https://crispincowan.com/~crispin/  
> Director of Software Engineering, Novell https://novell.com