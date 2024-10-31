---
title: Stupid Android market bug STILL affects 2.1 OS
date: 2010-06-14T14:17:00.000-07:00
published: true
url: /2010/06/stupid-android-market-bug-still-affects.html
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:42-07:00
---

I can't believe this hasn't been fixed yet.  I was not about to reset back to factory defaults and I had been meaning to root my phone anyhow so went this route.  It was difficult to find a solution that did NOT require resetting to factory defaults.  Enjoy.  
  
[Issue 3477 - android - HTC Hero - can't sign Gmail account if user skips signing when initially using the phone. - Project Hosting on Google Code](https://code.google.com/p/android/issues/detail?id=3477)  

> referring to my comment 37 above, and 16 ...  
> (1) First you need to root the phone. I had to Google how to do this, I found the solution (for 2.0, not 2.01) on some German site (yes, careless, I know).  
> (2) Then, you need a a terminal app (such as "Better Terminal Emulator"). With the terminal app you can navigate in the file system of the phone. However, you need root access (above) to be able to see the folder "/data/data/\[and so on\]". Without root access you cannot navigate to this folder. Then you need some Unix-fu to navigate to the correct folder, and remove the correct files. Look up the commands "ls", "cd", "rm", and "rmdir" (my Unix-fu was just sufficient, thank fate). Maybe a file manager app would to for step 2, I don't know. The process is likely slightly different for each phone (mine's a Milestone).