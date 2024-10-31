---
title: Linux Usb Bugs
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:59:51-07:00
tags:
  - post
date: 2007-08-11T12:41:00.000-07:00
published: true
url: /2007/08/linux-usb-bugs.html
aliases:
  - Linux-usb-bugs
linter-yaml-title-alias: Linux-usb-bugs
---


Seems as if many devices don't like Linux's USB device autosuspend feature.  Many will stop functioning and will need to be disconnected and reconnected to function again.  I've got a multi-card reader that will hang and get these errors.  It was a problem on my old computer and is still plaguing me on my new one.  Glad to see that it's going to be fixed.  Newer kernels >= 2.6.22 have a feature that lets you turn autosuspend off without having to recompile the kernel:  
  
  
sudo echo -1 > /sys/module/usbcore/parameters/autosuspend  
  
[\[linux-usb-devel\] usb-storage autosuspend bug?](https://www.mail-archive.com/linux-usb-devel@lists.sourceforge.net/msg56202.html)  
  
[Bug #85488 - Comment #363](https://bugs.launchpad.net/ubuntu/+source/linux-source-2.6.20/+bug/85488/comments/363)  
  
[Bug #85488 in linux-source-2.6.20 (Ubuntu): “some usb\_devices fault if usb\_suspend enabled”](https://bugs.launchpad.net/ubuntu/+source/linux-source-2.6.20/+bug/85488)