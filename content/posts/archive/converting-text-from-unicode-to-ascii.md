---
title: Converting Text From Unicode To Ascii
source: 
created: 2024-10-06 21:27:13-07:00
updated: 2024-10-10 14:59:15-07:00
tags:
  - technology
  - post
date: 2006-06-19T09:11:00.000-07:00
published: true
url: /2006/06/converting-text-from-unicode-to-ascii.html
aliases:
  - Converting-text-from-unicode-to-ascii
linter-yaml-title-alias: Converting-text-from-unicode-to-ascii
---


Just had to convert some text files from Unicode to ASCII and used Vim to do it:  
  
Open each file and notice that vim says \[converted\] at the bottom, indicating that it has transparently opened the unicode file to let you edit that file.  
  
On each file, change the file encoding setting to latin1 (basic ASCII):  
  
  
  
Then save the file and it will be converted:  
  
  
  
FYI, The vim docs note that changing the "encoding" setting does not affect existing text so that won't work.