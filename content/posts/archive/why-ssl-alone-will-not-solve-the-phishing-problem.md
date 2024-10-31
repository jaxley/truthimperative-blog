---
title: Why SSL alone will not solve the phishing problem
date: 2006-07-09T07:44:00.000-07:00
published: true
url: /2006/07/why-ssl-alone-will-not-solve-phishing.html
tags:
  - security
  - post
created: 2024-10-06 21:27:13-07:00
updated: 2024-10-10 14:56:36-07:00
---

SSL-authenticated login pages certainly doesn't \_solve\_ the phishing problem since phishing is partly psychological/sociological and makes use of technology as a means of improving the odds of the hacking the human psyche. So, a purely technological fix is unlikely to, prima facia, address the root issues.  
  
But, the SSL change can help in a couple of key ways:  
  

  
2.  Rather than give customers 0 tools to protect themselves, we can give them at least the best tool out there so far for authenticating our site and therefore make an informed decision.
  
4.  . Rather than continuing to train users to "trust page contents" (i.e. the lock image and our feeble assurances in the "Why this is secure" page), we can retrain them to use reliable measures that are not as subject to spoofing.
  

  
  
That is not to say that SSL does not have its problems:  
  

  
2.  Who made the trust decision to put the 50-100 CA certs in the browser? Why should the user trust those introducers? How do we know that those issuers won't screw up (like Equifax/GeoTrust did recently by issuing a domain-verified cert automatically that was very similar to a real bank: [https://jordy.gundy.org/?p=49](https://jordy.gundy.org/?p=49))
  
4.    
    The UI is horrible for security. The lock is too small, it is too easy for the "simon says" problem to bite you since you don't notice when it isn't there. Some changes, such as changing the browser toolbar color based on the encryption will help, but Firefox and IE7 use different color schemes for the same semantics...
  
6.  There are usability issues with the UI. Everybody (even me) turns off the warning dialogs about submitting unencrypted form posts. That kind of annoy-user-into-submission security fails the psychological acceptability test and it doesn't work anyhow because you should generally protect the user where it counts, not warn and hope they do the right thing.
  
8.  The phishing problem is one of Identity Continuity. It's not important that an SSL certificate matches the domain, since that does not help during the initial introduction to a site. What you really should be protecting the users from is when a known relationship in the digital sense has a discontinuity. That signals a phishing attack. The analogy is SSH known\_hosts. On the initial introduction, you choose to trust the server since the likelihood that you are being MITM attacked is infinitesimal. But, if you are MITM attacked, SSH will scream loudly and not let you connect. That is what the browsers should do, although clean up the UI a bit for the unwashed masses. The MITM issue is one of a discontinuity. So, SSL in the current sense solves the wrong problem because the browsers have no means of managing site continuity information. They should. Some schemes, such as trustbar and petnames, allow friendly site logos or names to help users detect continuity problems, but their UIs are too easy to ignore if there is a problem. The user should actually be stopped from proceeding.
  

  
  
And so on. That's just off the top of my head.