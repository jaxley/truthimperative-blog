---
title: Avoiding Uri Comparison Security Bugs In Windows Apis
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - post
date: 2008-01-01T08:23:00.000-08:00
published: true
url: /2008/01/avoiding-uri-comparison-security-bugs.html
aliases:
  - Avoiding-uri-comparison-security-bugs-in-windows-apis
linter-yaml-title-alias: Avoiding-uri-comparison-security-bugs-in-windows-apis

----apis
---


This post is directly related to some work I'm going to be doing so I was happy to stumble across it in my feed reader.   
  
Bottom line:  Use IUri::IsEqual.   
  
Future extra credit:  use Reflector to find out what .Net methods for URI comparison there are and if they marshal to the good or bad methods mentioned here...  
  
[IEBlog : URI Comparison Functions](https://blogs.msdn.com/ie/archive/2007/10/24/uri-comparison-functions.aspx)  

> Investigating URI parsing related issues in various products, I’ve run across many instances of code erroneously attempting to compare two URIs for equality. In some cases the author writes their own comparison and seems to be unaware of URI semantics and in other cases the author delegates to a Windows provided function that doesn’t quite work for the author’s scenario. In this blog post I’ll describe some of the unmanaged URI comparison functions available to Win32 developers, and a few common mistakes to avoid.