---
title: Debunking Biometric Assumptions
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - security
  - post
date: 2005-06-29T03:48:00.000-07:00
published: true
url: /2005/06/debunking-biometric-assumptions.html
aliases:
  - Debunking-biometric-assumptions
linter-yaml-title-alias: Debunking-biometric-assumptions

---tions
---


[Chris Hill's biometrics thesis:](http://chris.fornax.net/biometrics.html)  
  
This is a very interesting development. It challenges a key assumption that people have made about biometrics:  
  

> "that stored biometrics pose no threat to their owner (if they are stolen by another party), because it is not possible to recreate the original biometric from the stored data."  

  
  
So, attackers can potentially bypass biometric systems in a couple of ways if they can compromise digital representations of biometric data (from storage or by sniffing, e.g. USB sniffer or keyboard sniffer): They can recreate new physical biometrics that will have properties indistinguishable from the original.  
  

>   
> "I demonstrated that it is possible to recreate a biometric artefact that is equivalent to the original biometric provided to the system. This means that while a third party will not be able to generate the original biometric, they will be able to generate something that is indistinguishable from it, as far as the biometric software is concerned."  

  
  
Adam Shostack also had some additional comments on this today, pointing out the privacy implications of such a breach:  
  

>   
> The answer is you can reconstruct fingerprints from common systems.  
>   
> Daniel David Walker referred me to some work by Andy Adler, who pointed  
> out Ross, Shah and Jain, "Towards Reconstructing Fingerprints from  
> Minutiae Points."\[1\]  
>   
> \[1\] [http://www.csee.wvu.edu/~ross/pubs/RossReconstruct\_SPIE05.pdf](http://www.csee.wvu.edu/~ross/pubs/RossReconstruct_SPIE05.pdf)  
>   
> Some additional tidbits are on my blog at  
> [http://www.emergentchaos.com/archives/001443.html](http://www.emergentchaos.com/archives/001443.html)  

  
  
Imagine lost biometric passports allowing the creation of counterfeit passports with "real" biometric data on them. And further imagine trying to prove that it wasn't you who bombed that plane in Lebanon. "But we logged you going through security...and biometrics are \_unique\_ and \_unforgeable\_". \*Shiver\*