---
title: Md4 And Md5 Collision Generators
source: 
created: 2024-10-06 21:27:13-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - security
  - post
date: 2005-11-20T03:21:00.000-08:00
published: true
url: /2005/11/md4-and-md5-collision-generators.html

---.html
---


There are still not known attacks against encryption schemes that make use of these, but certainly anything relying on these hashes for integrity protection should switch to alternate mechanisms.  
  

>   
> Sent: Monday, November 14, 2005 10:48 AM  
> To: cryptography@metzdowd.com  
> Subject: MD4 and MD5 collision generators  
>   
> I am releasing my collision generators for MD4 and MD5. They have  
> significant time improvements over the ones described in the papers by Wang, et al.  
>   
> MD4 collisions can be generated almost instantly, MD5 can be generated  
> in approximately 45 minutes on my p4 1.6ghz (on average).  
>   
> [https://www.stachliu.com/collisions.html](https://www.stachliu.com/collisions.html)  
>   
> Enjoy  
> \-Patrick Stach