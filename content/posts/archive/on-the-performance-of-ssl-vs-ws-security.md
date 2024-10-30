---
title: On The Performance Of Ssl Vs Ws Security
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:59:38-07:00
tags:
  - post
date: 2006-11-20T15:11:00.000-08:00
published: true
url: /2006/11/on-performance-of-ssl-vs-ws-security.html
aliases:
  - On-the-performance-of-ssl-vs-ws-security
linter-yaml-title-alias: On-the-performance-of-ssl-vs-ws-security
---


I've been meaning to rant about this for a while.  
  
I'm sick and tired of hearing about the false dichotomy of WS-Security versus SSL and why its performance is somehow going to be so much better than SSL transport encryption of SOAP-based web services.  Pundits often point out that SSL has to encrypt the \_whole payload\_ while WS-Security can be used to digitally sign and/or encrypt only those attributes that absolutely need encrypting or signing.  
  
This kind of reasoning is preposterous and is nowhere near being based on any facts or data, yet these talking points are ever-popular with the "SOA: the Armageddon is near" or WS-NotJustForBreakfastAnymore crowd.  
  
For these people, I have one simple question for you about the assertion that WS-Security is always going to perform better in software than simply using SSL intelligently for the entire transport:  
  
**How is it that you can claim that WS-Security digital signature or encryption (with one \_or more\_ asymmetric plus 1  \_or more\_ symmetric crypto operation per request PLUS base64 encoding bloating the request PLUS extra SOAP XML tag hierarchies wrapping the encrypted/signed data section that need to be transferred over the network) is going to be faster in general than SSL (with one asymmetric crypto operation at session initiation, and henceforth 1 symmetric crypto operation per packet)?  
  
**It has often been vendors of XML firewalls and Microsoft web services evangelists that are the worst offenders.  I'd love to hear some answers you get to this question.  I haven't gotten a sensible one yet.  
Asymmetric crypto operations are roughly 1000 times slower than symmetric crypto operations.  I would love to see actual hard data based on a valid underlying test scenario proving that WS-Security is faster than SSL even in the face of this reality.  But nobody who makes these claims has it and I can't see it just based on the orders of magnitude difference between the computing time required for the crypto.  That is even before you factor in the additional latency for transmitting the extra bytes for the WS-Security payload and the extra parsing time and the likely need to have to encrypt and decrypt multiple separate data elements individually.  
  
Yes, in the purported SOAP-router kind of network where SOAP is treated as if it were a wire-level protocol there are problems with SSL since it is not end-to-end, but that is a red herring when we are debunking the claims of enhanced performance.  Stop changing the subject!  There can be a place for WS-Security in some advanced SOA scenarios, but strictly on performance, I can't see there being any comparison.  And most people aren't implementing anything like the SOAP architects envisioned anyway (but don't let that stop the vendors from beating that drum).  Most people are still using SOAP for point-to-point services which often replace other wire-transports or technologies (e.g. DCOM, CORBA, proprietary XML services, etc.)  
  
Performance issues with SSL have generally nothing to do with the fact that you are encrypting an entire payload instead of just subsets of the data.  For small messages that typical SOAP calls are, this is perhaps a few clock cycles per request.  I can say from lots of experience with lots of development teams that at least 90% of the performance problems with SSL in general are due to seriously flawed implementations.  The other 10% is generally actual performance impact because the systems on which it is running are vastly undersized because the system was not designed to be secure (but rather designed on the omission or hope that they wouldn't have to size it to handle the required security).  
  
If you implement SSL to intelligently minimize the asymmetric crypto operations to the absolute minimum by pooling connections and pinning them up and using keepalives, then you are barely going to notice its impact, especially on properly-sized hardware or if you use hardware crypto accelerators.  But if it is done incorrectly, or not accounted for in sizing, SSL will remain the whipping boy of many an environment.  
  
Oh, and I have data showing how SSL can actually \_speed up\_ connections under certain conditions.