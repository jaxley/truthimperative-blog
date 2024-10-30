---
title: Flashback More On Php Security
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 15:00:08-07:00
tags:
  - security
  - post
date: 2005-10-30T13:40:00.000-08:00
published: true
url: /2005/10/flashback-more-on-php-security.html
aliases:
  - Flashback-more-on-php-security
linter-yaml-title-alias: Flashback-more-on-php-security
---


I dug this out for additional evidence of how PHP gives programmers too much rope to hang themselves, not unlike C.  
  
\-J  
  

>   
> \-----Original Message-----  
> From: David Wheeler \[mailto:dwheeler@ida.org\]  
> Sent: Wednesday, August 08, 2001 2:06 PM  
> To: me  
> Subject: PHP  
>   
> Ben Ford said:  
>   
> \>>Don't call it a weakness of the language, call it by its true name:  
> \>> Lazy Programming.  
>   
> If this was a common problem in other languages, I might agree with you.  
> But it's not. Essentially all other computer languages do \_NOT\_ let  
> attackers set the state of arbitrary program variables to arbitrary  
> values, and then require programmers to constantly reset  
> values if they'd like to prevent attackers from controlling them.  
>   
> I'm not saying that PHP is some horrible, unfixable language.  
> I've posted to PHP-DEV a relatively simple set of changes that would  
> make it possible to eliminate the problem, and others have proposed  
> other approaches. And those who can control their PHP configuration can  
> obviously do so and eliminate the problem right now for their  
> applications.  
>   
> Yes, you can write secure applications in PHP. But it requires  
> herculean effort. It's "obvious" when the application is small  
> that some variable needs to be unset, that's true, assuming you know to  
> look.  
> But once you call functions, you have to have global knowledge of all  
> global values that the function uses, including the complete transitive  
> closure of all functions it calls directly & indirectly -- and that  
> INCLUDES the implementation of the library functions you call. And you have to  
> redo the analysis when you use a new version of PHP. You could argue  
> that all PHP developers do this... but I wouldn't believe you.  
>   
> It's certainly true that all languages have "gotchas".  
> This one is larger than most (in my opinion), though. And we should be  
> striving in our computer languages to make it easy, not hard, to write  
> secure programs.  
>   
> If some application can be used securely in theory, but its user  
> interface is so hard to use that it cannot PRACTICALLY be used securely,  
> then it's still insecure. I argue that the same is true for programming languages.