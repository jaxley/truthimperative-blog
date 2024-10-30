---
title: Pci Pa Dss Draft Does Away With Requirement For Persisting Credit Card Data
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:56:39-07:00
tags:
  - post
date: 2008-01-01T08:39:00.000-08:00
published: true
url: /2008/01/pci-pa-dss-draft-does-away-with.html
aliases:
  - Pci-pa-dss-draft-does-away-with-requirement-for-persisting-credit-card-data
linter-yaml-title-alias: Pci-pa-dss-draft-does-away-with-requirement-for-persisting-credit-card-data
---


  
One of my biggest beefs with the security technology industry and even with auditors and legislators has been to mindlessly push encryption as the solution to data theft problems.  
  
To quote Bruce Schneier again:  
  

> The ultimate solution.  Well, the payment application vendors, supposedly prodded by the likes of Visa and Mastercard, have been recording varying levels of details about payment transactions for 18 months.  Thus, the credit card companies have been part of the problem here and with this requirement change, they can become part of the solution for once.  They have a great racket...

I did a very detailed decision tree previously that I'll have to get out there for helping design systems with privacy in mind decide what they should store and if they do store it, how long to store it and how to protect it.  The flow starts with the question:  Do you really need to store this data?  If yes, the next question would be:  For how long?  If you start with encryption, you miss out on even asking these questions which could result in \_more security by design\_ and \_lower risk\_.  
  
It all depends on your threat model whether encryption solves your problem or not.  If the data theft is due to an application or business logic flaw, then encryption is unlikely to do anything for you (e.g. an XSS attack can reveal encrypted data just fine...)  
  
[Group drafts rules to nix credit-card storage](http://www.securityfocus.com/news/11496)