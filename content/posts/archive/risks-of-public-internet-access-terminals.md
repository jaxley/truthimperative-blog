---
title: Risks Of Public Internet Access Terminals
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:56:41-07:00
tags:
  - security
  - post
date: 2003-03-13T14:49:00.000-08:00
published: true
url: /2003/03/risks-of-public-internet-access.html
aliases:
  - Risks-of-public-internet-access-terminals
linter-yaml-title-alias: Risks-of-public-internet-access-terminals
---


This story about 16M Yen (~$136,000) stolen from someone's CityBank online banking service after the user's password was compromised at an Internet cafe highlights the tremendous risk of insecure client computers. It does not make a darned bit of difference what crypto strength you were to use, it is so trivial to install a keystroke capture device that nobody would _ever_ notice that will catch everything before it is encrypted.  
  

> "Using encryption on the Internet is the equivalent of arranging an armored car to deliver credit-card information from someone living in a cardboard box to someone living on a park bench." -- Gene Spafford

  
  
The trend toward SSL-based VPNs and Internet-enabling everything under the sun leads to uncontrolled client-side access that significantly increases this risk. Gartner is "bullish" on these SSL-based VPNs but I'm not convinced that their convenience outweighs the increased risk in many cases. You would need to deploy token authentication at a minimum with these solutions but you would still be at risk of general data compromise. In any company with a large amount of employees, training everyone to not use their personal computer, a library computer, an Internet cafe computer, etc. to access such a solution would be difficult and not entirely effective. Users will choose the convenience over security much (all?) of the time.  
  
Full story below and at [CNN.com](https://www.cnn.com/2003/TECH/internet/03/06/internet.theft.ap/index.html)  
  
Date: Fri, 07 Mar 2003 00:40:28 +0900  
From: Chiaki Ishikawa  
Subject: 16M Yen stolen from sniffed bank passwords at Internet Cafe  
On March 6th, two men have been arrested for illegally transferring 16  
million YEN from someone's CityBank online banking service account to a  
third party account and then take the money from it, Tokyo police announced.  
\>From the descriptions of newspaper articles, it seems that one of the  
culprits has installed keyboard sniffer programs on about hundred PCs at a  
dozen or so Internet Cafes in Tokyo and Kanagawa prefecture (south of  
Tokyo). He has regularly visited the cafes and brought back the recorded  
data with him, and searched for ID/password, and other identification  
information.  
At the charged man's home, the police has found ID/password for 719  
accounts, and about a couple of hundred user profiles meant for dating  
services.  
One such ID/password for a man's City Bank online banking service was used  
to transfer 16 million Yen to a different account at another bank from which  
the money was withdrawn.  
This is the first time that a keyboard sniffer is implicated in a large  
scale ID theft in Japan, from what I know.  
It beats me, though, why anyone wants to use a PC at Internet cafe for one's  
banking service. (We should assume doing something on it, like writing a  
memo, for example, is akin to writing on a memo pad on a desk at a public  
library under which a carbon paper may be secretly placed to record  
information and we never know. For that matter, even without the carbon  
paper, we often can see the telephone number, etc. left by the previous user  
by looking at the indented marks on the next paper sheet, don't we? )  
I think the general public should be taught more about the security  
implications of various Internet services, which may look useful and handy  
on the surface, but may not be so attractive if the security implications  
are taken into account. I think it should be the responsibility for the  
service provider to tell such risks, but I am not sure how to go about  
writing a law because "risk" is a relative thing.  
This has been a busy week for computer security professionals in Japan.  
First the computer system for handling nations's flight plans collapsed on  
the morning March 1st. Then a large credit card company, Oriental Corp.,  
announced the leak of 15,000 user profiles to a member of an underground  
gang group who blackmailed the company and was arrested. Then this  
incident.  
I hope the general public will start to pay more attention to the computer  
security issues thanks to these high-profile incident. (The ID theft using  
keyboard sniffer was the front page head line article in the evening edition  
of \*Asahi Shimbun\*. It occupies about 1/5 of the paper and is very  
conspicuous.)