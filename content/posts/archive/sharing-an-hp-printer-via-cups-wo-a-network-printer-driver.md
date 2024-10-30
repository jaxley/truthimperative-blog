---
title: Sharing an HP Printer via CUPS w/o a network printer driver
date: 2005-10-10T03:25:00.000-07:00
published: true
url: /2005/10/sharing-hp-printer-via-cups-wo-network.html
tags:
  - technology
  - post
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 15:00:13-07:00
---

HP has several printers where they provide huge driver downloads of 75-350 megabytes but none of them come with a network INF installer (you can look in autorun.inf and see references to Drivers/Network but those directories aren't there)  
  
Two printers that I know have this problem are the:  
  
HP PSC 750xi  
HP PSC 1210xi  
  
I run a linux print server so I want to connect the printers to the linux box and share them out via IPP provided by CUPS. This requires some software gymnastics on Windows because the typical HP drivers expect the printer to be plugged directly into the local USB cable, not served out over IPP. I saw similar problems of other HP users when they tried to use Windows printer sharing to remote computers on a network.  
  
I have been able to get the latest 750xi driver to install on an IPP printer by pointing to the right INF file in the HP printer driver directory (c:\\Program Files\\Hewlett-Packard\\AiO\\hp psc 700 series) after installing the huge software package on the windows box. I never had to plug the printer into windows.  
  
Now, the PSC 1210xi is another story. I had to download the 160 megabyte driver/software package from the HP website and install it as if I were installing the printer locally. However, I could not get any of the INF files to work.  
  
I found the solution on the Internet is to find this section in the win98 INF file (hpoupdrx.inf) and comment out the line with a semicolon:  
  
\[ControlFlags\]  
;ExcludeFromSelect=\*  
  
This is what prevents windows from showing a listing of compatible printers when you point to this INF file.  
  
Then, add your network printer and select Have Disk... for the driver. Navigate to c:\\temp\\HP All-in-One Series Web Release\\enu\\drivers\\win9x\_me and the hpoupdrx.inf will show up. When you select this, a list of the printers supported by the driver will show up and you can then select the right driver and proceed and windows will not be the wiser.  
  
This was installed on win2k without any problems.