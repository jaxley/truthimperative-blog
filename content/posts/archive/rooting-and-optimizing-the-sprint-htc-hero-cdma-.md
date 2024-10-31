---
title: Rooting And Optimizing The Sprint Htc Hero Cdma-
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:58:46-07:00
tags:
  - post
date: 2010-09-20T15:33:00.000-07:00
published: true
url: /2010/09/rooting-and-optimizing-sprint-htc-hero.html
aliases:
  - Rooting-and-optimizing-the-sprint-htc-hero-cdma-
linter-yaml-title-alias: Rooting-and-optimizing-the-sprint-htc-hero-cdma-
---


I have been meaning to write up instructions on how I updated my ROM and kernel on my CDMA HTC Hero to fix some annoying performance issues and overcome the internal memory limitation to be able to install more apps by installing them to the SD card.  Since this phone will not officially get 2.2 Froyo, I needed to do something to keep the phone relevant.  I had already ran into the max size of apps installed so was forced into taking some action.  

1.  Root your phone.  If you are running the latest 2.1 OS (version 6), the vulnerability in version 5 was patched so you cannot use that to root your phone anymore.  However, I just found a new method of rooting the phone that works like a charm and is even easier. It's called Universal Android Root [https://forum.xda-developers.com/showthread.php?t=747598](https://forum.xda-developers.com/showthread.php?t=747598)  Download the latest apk.  Enable USB debugging and plug your phone into your PC.  Use the ADB command from the android SDK to install the app.  ```
    adb install UniversalAndroot-1.6.2-beta5.apk
    ```Once you get it installed, find the universal root application and launch it. It was pretty intuitive. It even has an option to just root the phone temporarily until you reboot, which is nice for keeping your phone as pristine and secure as possible if you prefer.
2.  Install a new recovery image.  You need this to be able to perform nandroid full system backups, flash new content, wipe content before reflashing, etc.  [https://forum.xda-developers.com/showpost.php?p=4898505&postcount=1](https://forum.xda-developers.com/showpost.php?p=4898505&postcount=1)  This is the one I use on my CDMA Hero.  You may need to install the flash\_image program to your phone first and make it executable if it does not exist yet.  Here is one set of instructions on this thread that will be useful:  [https://forum.xda-developers.com/showthread.php?t=660396](https://forum.xda-developers.com/showthread.php?t=660396)
3.  Obtain the updated Sprint ROM and other files to update your phone's ROM to one that contains lots of goodies, including superuser access control, apps2sd (allows you to run and install apps to your SD card prior to Froyo), Wifi tethering, etc. but is based on the actual Sprint stock ROM package.  The thread is here with downloads and instructions:  [https://forum.xda-developers.com/showthread.php?p=6825435#post6825435](https://forum.xda-developers.com/showthread.php?p=6825435#post6825435)  You will need:
    
    *   HeroCSprintODEX\_2276516A2SDFin.zip - the actual ROM files.
    *   nework.fix\_signed.zip - I found that I needed this patch to fix some additional sluggishness
    *   phonedialer5odex\_signed.zip - I needed this to back the dialer to version 5 to fix sluggishness of the latest version. I actually put this on my wife's phone that has the stock ROM and it works great.
    
    Other optional updates that I recommend:  
    *   framework\_update\_signed.zip - this is some eye candy that is simple but slick for the UI. Does not use theming so is safe with ODEX file versions.
    *   ZenKernel-HTC-08122012.zip - [https://forum.xda-developers.com/showthread.php?t=750170](https://forum.xda-developers.com/showthread.php?t=750170) - with SetCPU (from the market), allows you to overclock your kernel. But, most importantly, it fixes the lock screen lag that is soooo annoying. Optionally, use one of the 691 kernels (meaning 691 mhz) but reports are that there is still lock screen lag so I don't use them.
4.  The ROM comes with the HTC\_IME keyboard mod that you can enable. But it has v25. I recommend updating it to v27 which fixes some bugs. [https://forum.xda-developers.com/showthread.php?t=624416](https://forum.xda-developers.com/showthread.php?t=624416)  The HTC\_IME keyboard is a modded HTC keyboard that adds some cool features and fixes nagging bugs and performs better than the stock HTC keyboard.  It adds voice input and smileys which are also kind of handy.  No Swype keyboard that I can find yet for the Hero...  Oh, get the lo-res version for the Hero since the screen is not high res.

When installing the ROM, I did not enable JIT as I have no compelling reason to do so that I'm aware of and it sounds like it may have some downsides that I don't want to incur.  I did enable app2sd though, which requires you to reformat your SD card so that you leave a partition for a linux ext filesystem for installing the apps to.  See [https://forum.xda-developers.com/showpost.php?p=7021325&postcount=2](https://forum.xda-developers.com/showpost.php?p=7021325&postcount=2) for apps2sd generic setup instructions.  Basically, if you have your SD card partitioned for it, it will be enabled.  
To install the zipped ROM images, you do NOT need to unzip them.  Just copy them to your sdcard and you can install them from the recovery boot image as-is.  
Other ROM notes:  

*   Comes with Titanium backup for root users, which can back up \_anything\_ on your phone.  I have yet to try a full backup, ROM flash, then restore to see if it saves me from having to redo my apps and settings every time I reflash but plan to do that sometime shortly as I would like to try one of the unofficial Froyo 2.2 builds for my phone (i.e. this one [https://forum.xda-developers.com/showthread.php?t=731659](https://forum.xda-developers.com/showthread.php?t=731659))
*   OMADM force close.  I never had this problem, but watch for it and update if need be:  [https://forum.xda-developers.com/showthread.php?p=7723243&highlight=adb#post7723243](https://forum.xda-developers.com/showthread.php?p=7723243&highlight=adb#post7723243)
*   With a rooted phone, you can remove some apps that you may never use.  I did this before to avoid some apps that insisted on starting on boot that I never used like Sprint TV.  [https://forum.xda-developers.com/showthread.php?p=7077498&highlight=adb+reboot#post7077498](https://forum.xda-developers.com/showthread.php?p=7077498&highlight=adb+reboot#post7077498) for one way of removing them.

I'm sure that I am missing some subtle things that were not initially obvious to me (most instructions are fairly high-level and assume you know some basics about adb commands and other things).  If I missed any, I will fill them in.  
Here is a good primer to get you started called "Take Control of your HTC CDMA Hero"  [https://forum.xda-developers.com/showthread.php?t=717416](https://forum.xda-developers.com/showthread.php?t=717416)