---
title: Md5 Demonstrated Very Broken But Worse Some Cas Were Still Using It
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - post
date: 2008-12-30T16:15:00.000-08:00
published: true
url: /2008/12/md5-demonstrated-very-broken-but-worse.html

---.html
---


Now, a proof-of-concept showing that the long-known MD5 vulnerabilities can be actually used to fake a CA certificate.  This could be really bad if done by a bad guy.  And it has long been known that to hedge your bets, your certs should use either both MD5 and SHA-1 or just SHA and drop MD5 altogether.  But apparently some ridiculous CAs didn't get that message and should not be in the business they are in IMO because of such a collossal error.  Equifax Secure Global eBusiness CA-1 is one of the certificates shown to use md5rsa.  From the slashdot discussion, here is a reposting of other CAs still using MD5:  

> RapidSSL  
> FreeSSL  
> TrustCenter  
> RSA Data Security (!)  
> Thawte (!)  
> verisign.co.jp

I expect this kind of thing from Equifax because they seem to do everything but the right thing in any interaction I've had with them online (e.g. why would they decide it a good idea to direct people to https://consumerinfo.com as an Equifax property? That seems like the phishiest thing I've come across. Seriously?) But RSA? Thawte?  
  
I'll repeat again my analogy I have used in the past for those who don't get the implications:  

> "If you used a daycare for your child that you found to have strewn about broken glass, hypodermic needles, frayed electrical cords, etc. would you not switch to a new daycare?"  
>   
> "Okay, now assume for example, that the bad daycare in the above example cleaned all of that up and pleaded that they would never be so careless again.  Would you bring your child back to that daycare?  If so, why?  If they were so careless in the past, and there are so many other better daycare facilities, why should you risk your child's security on someone so careless and clueless?"

Now, there is a caveat that is possible and I call it the Jack-in-the-box caveat.  In the aftermath of the E-coli illnesses attributed to Jack-in-the-Box restaurants many, many years ago, when they reopened I was not hesitant to have a burger there.  Why?  Because it was clear that they were under very tight scrutiny from the government and health agencies due to what they went through.  But, other restaurants were potential ticking timebombs.  It's the devil you know vs. the devil you don't.  
  
[Emergent Chaos: Now will you believe MD5 is broken?](https://www.emergentchaos.com/archives/2008/12/now_will_you_believe_md5.html)