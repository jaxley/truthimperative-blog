---
title: Is Php The New C
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:59:57-07:00
tags:
  - security
  - post
date: 2005-10-30T12:34:00.000-08:00
published: true
url: /2005/10/is-php-new-c.html
aliases:
  - Is-php-the-new-c
linter-yaml-title-alias: Is-php-the-new-c
---


I've been wondering lately if PHP is much like C from a security perspective in that the chances that if you are using PHP for an application that your application is secure depends on tribal knowledge about "what not to do" with the basic language. Another way to say this is that like C, PHP gives you plenty of rope to hang yourself if you don't know what you are doing. Which is unfortunate for a language that should be safer by default for use by UI programmers.  
  
This posting from Andrew van der Stock brings up some specific issues with the PHP language that could really help improve security in the same way that GCC compiler warnings when using insecure functions help with awareness.  
  

>   
> \-----Original Message-----  
> From: Andrew van der Stock \[mailto:vanderaj@greebo.net\]  
> Sent: Friday, June 24, 2005 10:07 PM  
> To: Benjamin Livshits  
> Cc: webappsec@securityfocus.com  
> Subject: Re: Languages/platforms used for Web apps. Any stats?  
>   
> I don't know of any stats, but if anyone was to make a study, that's  
> where I'd focus on.  
>   
> However, saying that:  
>   
> \* I review J2EE finance apps used in very large institutions. I find  
> plenty of problems which need fixing  
> \* I look after a PHP forum, which definitely could improve  
> \* In my previous job, the most vulnerable app I ever reviewed was  
> written in ASP in VBScript  
>   
> I don't think the language has much to do with it beyond basic security  
> posture. PHP could do a lot to redress the problems, for example, by:  
>   
> \* making echo do htmlentities by default, and having a special echo /  
> print which doesn't in case you really meant to spit out HTML  
> \* deprecating the old function based MySQL drivers (ie warnings when  
> E\_ALL is used) in favor of the MySQLi drivers or PDO which have prepared  
> statements  
> \* in the next version of PHP, remove support for register\_globals and  
> make url\_fopen permanently false  
> \* Remove implicit declarations and add optional strong typing which  
> really means it  
>   
> The basic security posture of PHP has been improving, but honestly, it  
> really depends on the quality of the coders and if they are aware of the  
> security options open to them. The other thing is that there is a lot of  
> PHP code out there written in the PHP 3 days which sorta runs okay on  
> PHP 4 and 5, which shouldn't. PHP 3 really was a security nightmare -  
> everything in the interpreter was set to be the most insecure possible  
> posture with maximal attack surface area.