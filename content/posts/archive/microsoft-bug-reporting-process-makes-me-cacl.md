---
title: Microsoft Bug Reporting Process Makes Me Cacl
source: 
created: 2024-10-06 21:27:13-07:00
updated: 2024-10-10 14:58:31-07:00
tags:
  - security
  - post
date: 2006-10-09T13:28:00.000-07:00
published: true
url: /2006/10/microsoft-bug-reporting-process-makes.html
aliases:
  - Microsoft-bug-reporting-process-makes-me-cacl
linter-yaml-title-alias: Microsoft-bug-reporting-process-makes-me-cacl
---


The story of how Microsoft has ended up with so many unconnected and uncoordinated versions of command-line tools to manage setting and displaying ACL (Access Control List) entries is funny enough, but wait until you hear about my experience trying to report a bug in the tool. First, on the sordid history that has lead to three versions of the same tool, instead of one version that actually works correctly and handles all situations. There was first cacls.exe, which shipped with windows AFAIK. That was missing some key features so in all their wisdom, Microsoft released xcacls.exe in a resource kit that made up for the shortcomings in cacls.  
  
So, I found a small bug in Microsoft's  
  
I called Microsoft to find out how I could report the bug in XCACLS.vbs and after voice jail and being put through the regular support cruft they said that the only way to report bugs is by US Mail! They don't have any email address or way to report them via their support line. I told them to forget it. I'd just post something on my blog so that someone having the same problem can find it via google (and that then maybe Microsoft might google it someday so they can fix the problem).