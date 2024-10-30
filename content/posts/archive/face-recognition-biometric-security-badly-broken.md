---
title: Face Recognition Biometric Security Badly Broken
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:58:48-07:00
tags:
  - post
date: 2009-02-15T01:33:00.000-08:00
published: true
url: /2009/02/face-recognition-biometric-security.html
aliases:
  - Face-recognition-biometric-security-badly-broken
linter-yaml-title-alias: Face-recognition-biometric-security-badly-broken
---


It was only a matter of time that this would be broken.  If you have one of these laptops that uses this software, you should disable it.  
  
My guess would be that just a simple webcam is not going to be able to get enough information to be able to tell the difference between a fake 2-d picture of an individual and an actual 3-d person.  They probably need some sort of additional 3-d scanner that samples depths on a face as well or similar technique.   
  
The hack seems to rely on faking the image comparison algorithms since ultimately these systems are storing the original facial image and using image processing on it.  
  
[Researchers Hack Faces In Biometric Facial Authentication Systems](http://www.darkreading.com/vulnerability/researchers-hack-faces-in-biometric-faci/213901113)  

> "There is no way to fix this vulnerability," Duc says. "Asus, Lenovo, and Toshiba have to remove this function from all the models of their laptops ... \[they\] must give an advisory to users all over the world: Stop using this \[biometric\] function."  
>   
> An attacker can edit and adjust the lighting and angle of a phony photo to ensure the system will accept it, according to the researchers. "Due to the fact that a hacker doesn't know exactly how the face learnt by the system looks like, he has to create a large number of images...let us call this method of attack 'Fake Face Bruteforce.' It is just easy to do that with a wide range of image editing programs at the moment," they wrote in their paper.

  
  

<!-- ![](http://img.zemanta.com/pixy.gif?x-id=16be0692-3694-4020-bbb7-98594c7fe96a) -->