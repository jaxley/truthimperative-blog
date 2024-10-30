---
title: Nvidia Driver Breaks Remode Desktop On Windows Xp Solution
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:56:51-07:00
tags:
  - post
date: 2008-09-07T09:21:00.000-07:00
published: true
url: /2008/09/nvidia-driver-breaks-remode-desktop-on.html
aliases:
  - Nvidia-driver-breaks-remode-desktop-on-windows-xp-solution
linter-yaml-title-alias: Nvidia-driver-breaks-remode-desktop-on-windows-xp-solution
---


Gotta love Google.  
  
I added this key, rebooted and now I'm back in business!  
  
[NVIDIA Forums -> WHQL 175.16 - remote desktop fails](http://forums.nvidia.com/index.php?showtopic=67147&st=60)  

> This problem is not specific to any one graphics company. It can probably happen with printer drivers too.  
>   
> The root of the problem is that the session image space is too small and it can't load any more drivers into it. The session image space is shared for the display driver drivers and printer drivers. rdpdd = remote desktop protocol display driver.  
>   
> You can fix this bug by increasing the size of the session image space via a registry key. Add the following key:  
> \[HKEY\_LOCAL\_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management\]  
>   
> "SessionImageSize"=dword:00000020  
>   
> 0x20 == 32 MB works on my system anyway.