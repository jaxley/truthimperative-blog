---
title: Getting To The Root Of Id Theft Problems
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:58:23-07:00
tags:
  - Privacy
  - post
date: 2005-04-11T01:50:00.000-07:00
published: true
url: /2005/04/getting-to-root-of-id-theft-problems.html
aliases:
  - Getting-to-the-root-of-id-theft-problems
linter-yaml-title-alias: Getting-to-the-root-of-id-theft-problems
---


There is an article on ID theft causes that has a great summary of the fundamental factors in ID theft from entities entrusted with your private data [They can't steal data you don't have](https://www.computerworld.com/hardwaretopics/storage/story/0,10801,100717,00.html)  
  

>   
> We have observed that some of the sensitive data that gets stolen fits into one of several categories:  
>   
> 
>   
> *   Data that was never needed
>   
> *   Data that was needed but should never have been stored
>   
> *   Data that was originally needed but was kept far beyond its useful life
>   
> *   Data that should never have been stored in an unencrypted form
>   
> 
>   
>   
> At some point, the question "Did you consider not having this data" is going to become a standard part of lawsuits. If you're an IT manager, are you planning for that day?  

  
  
I had actually included these questions in a decision tree for my corporate privacy strategy. Most people go right to the "encrypt" sensitive data and don't back up and ask these more fundamental "behavioural" questions that actually are often a) more effective at solving/eliminating the problems and b) have less drawbacks than simply "encrypt everything everywhere, but still store it".  
  
I've seen the "encrypt everything everywhere" mantra effectively require "copies of encryption keys everywhere", which gives your corporation a false sense of security. "The data's encrypted", the executives say. However, if you cannot implement secure key management (you have to know that you need to do this, then have the knowledge to design the solution to be effective and manageable, then you have to be able to implement it across diverse groups who don't all understand cryptography...), then you effectively have the keys to decrypt the data right next to each of your excessive, unnecessary encrypted copies of that sensitive data.  
  
Beware the buzzword-compliant solution!