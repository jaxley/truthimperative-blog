---
title: Batch Transcoding Flv Audio To Oggvorbis Using Vlc
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:56:33-07:00
tags:
  - post
date: 2008-06-15T15:11:00.000-07:00
published: true
url: /2008/06/batch-transcoding-flv-audio-to.html
aliases:
  - Batch-transcoding-flv-audio-to-oggvorbis-using-vlc
linter-yaml-title-alias: Batch-transcoding-flv-audio-to-oggvorbis-using-vlc
---


Here's a handy bash script that I use to quickly batch transcode flash audio-only files into ogg/vorbis for playing on my Cowon D2:  
  

> for file in \*.flv;  
> do  
> /cygdrive/c/Program\\ Files/VideoLAN/VLC/vlc.exe -vvv $file --sout="#transcode{acodec=vorb,ab=192,channels=2}:standard{mux=ogg,dst=$file.ogg}" vlc:quit;  
> done