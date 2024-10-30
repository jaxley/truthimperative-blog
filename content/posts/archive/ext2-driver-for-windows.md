---
title: Ext2 Driver For Windows
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 15:00:11-07:00
tags:
  - post
date: 2007-08-22T15:34:00.000-07:00
published: true
url: /2007/08/ext2-driver-for-windows.html
---


I had previously used ext2fsd, but that was quite a pain to set up.  This has a nice installer and lets you map your Linux drive right to a drive letter in Windows because it is a full kernel-mode file system driver (Installable File System driver).  It supports read/write too.  Doesn't support any security on the drive so caveat emptor.  
  
It doesn't support any partitions using volume management either (not a surprise).  
  
[Ext2 IFS For Windows](http://www.fs-driver.org/)  

> provides Windows NT4.0/2000/XP/2003 with full access to Linux Ext2 volumes (read access and write access). This may be useful if you have installed both Windows and Linux as a dual boot environment on your computer.