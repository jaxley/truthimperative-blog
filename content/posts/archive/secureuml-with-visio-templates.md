---
title: SecureUML, with Visio templates
date: 2005-07-11T04:02:00.000-07:00
published: true
url: /2005/07/secureuml-with-visio-templates.html
tags:
  - security
  - post
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:58:31-07:00
---

[Mark Curphey's Blog](https://www.threatsandcountermeasures.com/blogs/marksblog/ "Mark Curphey's Blog")  
  
I am very methodical when it comes to security design and security reviews so I am sure that these templates will come in very handy to ensure uniform coverage of requirements and mechanisms.  
  
My only quibble so far is that they call this "SecureUML". The UML isn't Secure, nor is having a well-defined Authorization model imply security (look no further than the Sarbanes-Oxley efforts that define wonderful processes and models, but the auditor testing never covers the effectiveness of the underlying mechanisms implementing these controls...)  
  

>   
> There are a few simple steps that can help when defining authorization requirements and an extension to the Unified Modeling Language called SecureUML that is very powerful for documenting unambiguous authorization models, specifically RBAC (roles based access control). My colleague Rudolph Araujo (Security Developer MVP) has built a Visio template for creating SecureUML models that is also available here. One of the things I specifically like about UML and SecureUML is that it forces you to really think about things and promotes best practice where you are not operating on undocumented assumptions.  
>   
> First things first, lets define some simple steps to creating an authorization model.  
>   
> 1\. Identify Users (actors)  
> 2\. Identify Application Specific Roles  
> 3\. Map Users to Roles Based on Business Function  
> 4\. Identify Resources  
> 5\. Identify Actions  
> 6\. Identify Authorizations Constraints