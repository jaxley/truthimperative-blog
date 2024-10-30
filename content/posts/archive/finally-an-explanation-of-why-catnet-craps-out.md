---
title: Finally An Explanation Of Why Catnet Craps Out
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:56:39-07:00
tags:
  - post
date: 2009-02-04T02:42:00.000-08:00
published: true
url: /2009/02/finally-explanation-of-why-catnet-craps.html
aliases:
  - Finally-an-explanation-of-why-catnet-craps-out
linter-yaml-title-alias: Finally-an-explanation-of-why-catnet-craps-out
---


Ever since CAT.NET was released I have not been able to successfully use it for a typical solution/project.  It actually causes Visual Studio to crash after running for a while and taking all of the available memory with it...  
  
Even with the command-line tool, any large set of assemblies being analyzed seems to consume more than CAT.NET can get the .Net framework to allocate (not to mention the entire system grinds to a halt while it is running).  The reason is due to how .Net needs to allocate contiguous pages of memory and the 32 bit per-process memory limitations.  The solution for now is to run the command-line tool on 64 bit windows or vista or to split up the analysis into smaller sets of assemblies.  
  
BTW, I think that "Call Flow Super Graph" would be an \_awesome\_ band name.  
  
[The Connected Information Security Group : Current Memory Limitations of CAT.NET](http://blogs.msdn.com/cisg/archive/2009/01/12/current-memory-limitations-of-cat-net.aspx)  

> Even with virtual memory there are limits to how much memory a single .NET application can allocate. As reported in recent blog post a 32-bit process, such as the CAT.NET Visual Studio plug-in version can only allocate about 1200 MB, even on a 4GB RAM (32-bit) system. Moreover another shortcoming of the current implementation is that when CAT.NET runs out of memory is it exits with an unhandled OutOfMemory (OOM) exception, unfortunately this does not get reported by the Visual Studio plug-in and the plug-in just seems to hang.