---
title: Securely rooting your HTC Hero
date: 2009-11-11T13:06:00.000-08:00
published: true
url: /2009/11/securely-rooting-your-htc-hero.html
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:43-07:00
---

The best guide I found for reliably getting root access to your android HTC Hero device is here:[  How To: Root Your CDMA HTC Hero (Sprint/Verizon) | The Unlockr](http://theunlockr.com/2009/11/07/how-to-root-your-cdma-htc-hero-sprint-verizon/)  
  
However, as a security guy, I notice that none of the guides discuss anything about the implications of the process from a security perspective, so I will add a bit of extra tips and observations and explain how it works.  
  
By default, Android devices run applications as low privileged user accounts on the underlying Linux operating system.  If you have the application RoboTop installed, you can actually see the users that each process runs as.  For example, the robotop process and its child 'top' processes all run as 'app\_60'.  
  
This is a good secure-by-default design for the operating system, however there are some things that you must do as root to have enough rights at the OS level to complete your task.  For my case, I needed to be able to clean the /data/boot-cache directory to work around an annoying defect on the HTC Hero that was preventing application upgrades from persisting across a reboot.  Some applications (SSH server, I believe) also need to run as root.  
  
But, Google does not provide any means for getting root access as an end user.  But the community has come up with all kinds of ways to get around this on various devices.  If you have physical access to a device, it is generally pretty easy to gain full access to it \_somehow\_.  In the case of the Hero, it essentially involves:  
  
1\. Running a Linux kernel exploit that allows you to run arbitrary programs as root.  Discouragingly, the program to do this is a binary with no source code.  But it is claimed to be based on this kernel bug:  [Sprint Hero HAS BEEN ROOTED@! - Android Forums](http://androidforums.com/sprint-htc-hero/14814-sprint-hero-has-been-rooted.html)  
2\. Using the exploit to launch a shell as root.   
3\. Using the root shell to create a setuid root shell so that you can gain root anytime in the future without the exploit.  
  
However, there are some serious security implications of doing this:  
  
1\. The procedures don't tell you to delete /data/local/asroot2, so you end up leaving a program that can run arbitrary code as root on your system in a known location  
2\. The procedures have you create a setuid root shell as /system/bin/su.  However, this allows anyone or any application to run arbitrary code on your phone as the highest privilege user using a binary at a known location.  

So, you may have root but you have absolutely no way to control it.  And applications that require root now expect to find a setuid root shell in /system/bin/su to gain root.  Any application can now do anything it wants, including replace parts of your operating system for whatever nefarious purpose (malicious, wireless worm, extortion, annoyance, etc.)  
  
But, all is not lost.  You can get control back with the Superuser application.  I've read through the design and it sounds on the face of it to be a reasonable approach:  [My Brain Hurts: Fixing the "setuid su" security hole on Modified Android RC30](http://www.koushikdutta.com/2008/11/fixing-su-security-hole-on-modified.html) Instructions on installing it and download of the files (source code is available as well):  http://www.koushikdutta.com/2008/11/update-to-superuser.html  
  
The install.bat file did not work for me though.  I got a permission denied trying to write a file as a non-root user into /sysadmin/bin.  Actually, the low user privileges cannot write to many places on the filesystem.  Instead of copying the bin/su file directly, I copied it to /data/local/tmp and then \_as root\_ on the phone, I copied it into /sysadmin/bin and changed the permissions.  
  
The next step is to first run the Superuser application on the phone so that it can replace the files and set the permissions properly to implement the protection.  
  
After you do this, you will now get a visible request each time an application tries to execute /system/bin/su.  You got control and auditing back.  
  
Oh, and what you also need to remember to do is delete /data/local/asroot2.  You don't need it anymore and it only makes your system vulnerable to keep it around.  If you ever needed it again, you can copy it back.  

  
  

<!-- ![](http://img.zemanta.com/pixy.gif?x-id=fc1992c0-aa9e-8fbd-9d9b-4a3868a318ca) -->