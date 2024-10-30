---
title: Installing An Uncrippled Ffmpeg On Ubuntu
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:59:59-07:00
tags:
  - technology
  - post
date: 2006-11-26T16:52:00.000-08:00
published: true
url: /2006/11/installing-uncrippled-ffmpeg-on-ubuntu.html
aliases:
  - Installing-an-uncrippled-ffmpeg-on-ubuntu
linter-yaml-title-alias: Installing-an-uncrippled-ffmpeg-on-ubuntu
---


I'm trying this right now on Edgy Eft:  
  
[po-ru.com: Fixing ffmpeg on Ubuntu](http://po-ru.com/diary/fixing-ffmpeg-on-ubuntu/)  

> It seems one can set DEB\_BUILD\_OPTIONS=risky to enable the missing codecs rather than editing debian/rules and building the package manually.  
>   
>   
>   
> sudo apt-get build-dep ffmpeg  
>   
>   
>   
> sudo apt-get install liblame-dev libfaad2-dev libfaac-dev libxvidcore4-dev checkinstall fakeroot  
>   
>   
>   
> DEB\_BUILD\_OPTIONS=risky fakeroot apt-get source ffmpeg --compile  
>   
>   
>   
> sudo dpkg -i ffmpeg-blah.dpkg