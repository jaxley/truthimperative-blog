---
title: Dead To Me Word 2007 Auto Save Recovery
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:59:58-07:00
tags:
  - post
date: 2009-01-25T12:28:00.000-08:00
published: true
url: /2009/01/dead-to-me-word-2007-auto-save-recovery.html
---


You would think that there might be some compelling reason to upgrade from Office 2003 to 2007, or perhaps to consider paying for office instead of the wonderful [Openoffice.org 3.0](https://openoffice.org/) that is totally free.  You would have thought wrong as far as this instance goes.  
  
My wife recently had a problem where the stupid windows auto-updates rebooted her computer in the middle of the night and she had (contrary to normal practice) not saved a new document to a filename.  But fortunately, there were the office Auto Saves, right?  
  
Well, to recap:  
  
\* Auto save worked just fine.  
\* But what if a user is not paying attention when they next launch Word and ignore the auto save recovery window upon recovery?  Uhh, word nicely deletes the autosave file.  Even [VIM](https://vim.org/) would err on the side of leaving your auto-recovery file in place.  
\* Fortunately, I have nightly backups.  So, I was able to recover the .asd file from the temporary directory (strangely %USERPROFILE%\\Application Data\\Microsoft\\Word by default).  Now what?  
\* It should be as simple as File -> Open, right?  Well, that's what [Microsoft's own documentation](https://support.microsoft.com/kb/316951/en-us) says you should do.  But this is WRONG.  You get an "Unsupported file type" error or similar.  
\* It was only after renaming to a .docx file and trying to open it that a helpful message said, "if you are trying to recover a file, open it \_this\_ way".  
\* Sheesh, can't the program  
a) know how to open and deal with its own damned auto recover files in the first place?  or  
b) not require the \_user\_ to do something different.  Reminds me of Bill Cosby as Noah when god tells him he's got two male animals and he has to go back out and get a female instead, Noah says, "I'm not going to do that -- you change one of them!!"   
  
\* One Internet posting about how to restore this was to use Open Office Writer to open the .asd file and save as a .doc file.  That actually works great.  
  
Open Office can do it the user-friendly way, why not Word?  What exactly do you get for $400 list price again?