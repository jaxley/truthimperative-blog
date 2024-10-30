---
title: History Of Buffer Overflow Protection
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:58:12-07:00
tags:
  - security
  - post
date: 2004-10-26T20:24:00.000-07:00
published: true
url: /2004/10/history-of-buffer-overflow-protection.html
aliases:
  - History-of-buffer-overflow-protection
linter-yaml-title-alias: History-of-buffer-overflow-protection
---


A great (old) post to Risks 22.74 about the past issues with designing solutions to buffer overflows in hardware. Also, a link to a paper describing the history of these efforts that I'll be looking to check out.  
  
Crispan was just spotted at SecureWorld Expo in Seattle today...  
  
\-Jason  
  
\----------------  
Date: Sat, 10 May 2003 19:19:12 -0700  
From: Crispin Cowan  
Subject: Re: OpenBSD ... protects against buffer-overflow ... (Ardley, R  
22.72)  
  
\>What is not so apparent is why technology that was developed and  
\>operating over 30 years ago is just being re-invented in software.  
  
Because what was developed in operating systems over 30 years ago was  
use of heavily segmented architectures. Over 20 years ago (the Intel  
432) it was discovered (the hard way) that such architectures run  
horribly slowly compared to RISC architectures. Since the debacle of the  
432, even CISC processors such as the x86 have migrated towards RISC  
style instruction processing.  
  
What OpenBSD is implementing is a variety of software schemes to make up  
  
for the lack of hardware protection for array bounds. Some of these  
schemes (Openwall's non-executable stack) are  
performance neutral: just mark the stack segment non-executable. Some  
(ProPolice, a re-implementation of StackGuard  
) are very cheap  
, much cheaper than  
enforcing memory safety in hardware.  
  
Unfortunately, one of these enhancements (W^X) is not so cheap. Here,  
they try to make all writable pages non-executable, and vice versa. This  
  
is problematic on the x86 architecture because waaaay back in the day,  
Intel decided that memory pages did not need separate Read and Execute  
permission bits in the TLB (only segments have separate R and X bits,  
not pages). The W^X hack has to do a lot of work with TLB faults to  
compensate for this simple omission.  
  
\>The Burroughs 6700 implemented a hardware solution to the problem by  
\>assigning 3 bits of very 51 bit memory location to the type of data  
\>contained.  
  
The 432 did something similar, and the performance penalty was  
astronomical. For a survey of buffer overflow attacks and defenses,  
check out these papers:  
  
"Buffer Overflows: Attacks and Defenses for the Vulnerability of  
the Decade". Crispin Cowan, Perry Wagle, Calton Pu, Steve Beattie,  
and Jonathan Walpole. DARPA Information Survivability Conference and  
Expo (DISCEX) [http://schafercorp-ballston.com/discex/](http://schafercorp-ballston.com/discex/), Hilton Head  
Island SC, January 2000. Also presented as an invited talk at SANS  
2000 [http://www.sans.org/sans2000/sans2000.htm](http://www.sans.org/sans2000/sans2000.htm), Orlando FL, March  
2000\. PDF [http://immunix.com/%7Ecrispin/discex00.pdf](http://immunix.com/%7Ecrispin/discex00.pdf).  
  
"Software Security for Open Source Systems". Crispin Cowan. IEEE  
Security & Privacy Magazine [http://www.computer.org/security/](http://www.computer.org/security/),  
February 2003, Volume 1, Number 1  
[http://www.computer.org/security/sp2003/j1toc.htm?SMSESSION=NO](http://www.computer.org/security/sp2003/j1toc.htm?SMSESSION=NO),  
pages 35-48. PDF  
[http://wirex.com/%7Ecrispin/opensource\_security\_survey.pdf](http://wirex.com/%7Ecrispin/opensource_security_survey.pdf).  
  
Crispin Cowan, Ph.D., Chief Scientist, Immunix http://immunix.com  
http://immunix.com/~crispin/ http://www.immunix.com/shop/