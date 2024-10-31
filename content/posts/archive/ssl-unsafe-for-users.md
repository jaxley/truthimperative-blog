---
title: SSL unsafe for users?
date: 2004-10-26T20:28:00.000-07:00
published: true
url: /2004/10/ssl-unsafe-for-users.html
tags:
  - security
  - post
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:59:43-07:00
---

"99% of SSL users have no idea how SSL works and consequently make informed decisions"  
  
Browser manufacturers try to make things easy for users but end up diluting the security properties of the hierarchical trust model.  
  
A lot of talk in recent years on the cryptography mailing list indicates that this model is too broken and perhaps should be replaced with an ad-hoc mechanism, such as the SSH model, with all web servers installing \_some\_ sort of certificate by default--even self-signed. The thoughts are that some confidentiality protection with reasonable MITM detection is better than so few sites supporting encryption since they don't want to pay Verisign blood money for a "real" certificate.  
  
You'll notice on my site that I have always used my own cert. I should probably regenerate one that is not expired...  
  

>   
> \-----Original Message-----  
> From: InfoSec News \[mailto:isn@c4i.org\]  
> Sent: Monday, March 24, 2003 12:39 AM  
> To: isn@attrition.org  
> Subject: Re: \[ISN\] Is SSL safe?  
>   
> Forwarded from: Kurt Seifried  
>   
> None of this really matters because 99% of SSL users have no idea how  
> SSL works and consequently can't make informed decisions when faced  
> with attacks such as:  
>   
> 1) Older SSL clients that don't check certificate constraints, i.e.  
> CAN-2002-0828, CAN-2002-0862, CAN-2002-0970, CAN-2002-1183,  
> CAN-2002-1407 and so on. If you don't understand what this sentance  
> means you are potentially vulnerable. I have yet to see a GOOD plain  
> english description of this problem that my mother would understand.  
>   
> 2) Verifying certificates that are out of date or issued to the wrong  
> common name (i.e. hostname). This happens a lot, my web based banking  
> provider (one of the big 4 banks in Canada) used an out of date SSL  
> certificate for about a week last year. Perhaps an insider attack at  
> work, perhaps an innocent mistake, I never got an answer out of them.  
>   
> 3) Verifying that certificates are issued from a trusted provider.  
> Most common web based SSL clients (like Netscape, IE) have over 100  
> root certificates. Have you ever heard of "Certisign Certificadora  
> Digital Ltda." (doesn't expire until 2018) or "IPS SERVIDORES" (good  
> until 2009). It seems to me that an intelligent criminal could subvert  
> one of these small firms (hostile takeover, get employed there, etc.)  
> and then have a grand old time issuing certificates to themselves.  
>   
> 4) The eternal "who cares about SSL" argument, web servers and back  
> end infrastructure is so poorly secured that most times an attacker  
> can spend a week breaking in and get a few (tens, hundreds, etc.) of  
> thousands of credit cards with all the personal data in one fell  
> swoop. This applies less so against "secure" corporate/gov/mil/etc  
> infrastructure like SSL encrypted POP email, against which targeted  
> SSL attacks are useful (to gain a password to gain further access,  
> etc.).  
>   
> 5) All the old old stuff I covered in:  
>   
> https://seifried.org/security/cryptography/20011108-end-of-ssl-ssh.html  
>   
> and  
>   
> https://seifried.org/security/cryptography/20011108-sslssh-followup.html  
>   
> Which still largely applies. \*SIGH\*.  
>   
> Kurt Seifried, kurt@seifried.org  
> A15B BEE5 B391 B9AD B0EF  
> AEB0 AD63 0B4E AD56 E574  
> https://seifried.org/security/