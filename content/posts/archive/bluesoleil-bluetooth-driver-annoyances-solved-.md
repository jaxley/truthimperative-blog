---
title: Bluesoleil Bluetooth Driver Annoyances Solved-
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:56:50-07:00
tags:
  - post
date: 2009-01-25T12:37:00.000-08:00
published: true
url: /2009/01/bluesoleil-bluetooth-driver-annoyances.html
aliases:
  - Bluesoleil-bluetooth-driver-annoyances-solved-
linter-yaml-title-alias: Bluesoleil-bluetooth-driver-annoyances-solved-
---


One annoyance is that, by default, the Bluesoleil driver does not work as a Limited user account.  Since I run exclusively as a limited user on windows XP, that was annoying.  Fortunately, there is a solution:  run it at startup as a higher-priv user.  There are negative security implications to this, especially in light of my blog posting about software/driver rot because OEMs don't get to maintain the latest driver versions, but the risk may be worth the reward.  
  
[Windows XP + Limited Accounts + Bluetooth - WiFi-Forum - Wi-Fi Discussion Forum](http://www.wifi-forum.com/wf/showthread.php?p=380886)  

> In registry editor, go to ....HKEY\_LOCAL\_MACHINE/SOFTWARE/Microsoft/Windows/Currentversion/single click "Run". On the right side u'll see the softwares which run on system startup. Here u have to put ur Bluesoleil executable in the following way.  
>   
> "maus right-click"/new/stringvalue/give a name like "Bluesoleil"/maus right-click on "Bluesoleil"/Modify/here give the path of the executable, someting like "C:\\Program Files\\IVT Corporation\\Bluesoleil\\Bluesoleil.exe"  

  
  
Another annoyance was the dreaded "\_\_\_\_\_\_\_\_\_\_\_\_" error you often get upon installation or reinstallation or upgrade of the drivers. The vendor's solution is not very helpful "cleanly uninstall before installation", especially if the install had failed so you \_can't\_ uninstall. But there is a solution gleaned from an International site:  
  
[no puedo instalar bluetooth | Ayuda, no, puedo, instalar, bluetooth | 2412322 | 3345 / 5](http://www.configurarequipos.com/tema2412322-15-5.html)  

> Right click in HKEY\_CLASSES\_ROOT. Choose Permissions... Click in advanced. In the new window check the box Replace permission entries on all child objects with entries shown here that apply to child objects. Click OK.  
>   
> Repeat this to the HKEY\_LOCAL\_MACHINE. Probably you will receive some denied warnings in this step. This is completely normal.

  
  
Again, there may be security implications of doing this so take care.  
  
Another thing that could get in the way is a firewall or anti-spyware program preventing registry modification so watch for that too.