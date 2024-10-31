---
title: Unintended consequences of improved SSL UI in browsers
date: 2005-07-07T05:45:00.000-07:00
published: true
url: /2005/07/unintended-consequences-of-improved-ssl.html
tags:
  - security
  - post
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:56:59-07:00
---

[SSL Organization Vulnerabilities](https://geotrust.com/resources/advisory/sslorg/index.htm "SSL Organization Vulnerabilities")  
  

>   
> The following example web site spoofs demonstrate the vulnerabilities that exist if First-Generation vetting practices for digital certificates are used in combination with new browser enhancements which bring the certificate Organizational information forward and displayed next to the SSL Lock symbol.  

  
  
Spoofers these days are adapting very fast to new technology to counter their tactics. This is one in which adversaries are generating certificates with Organization information that matches a target site to spoof, and dumb "Trusted" third party CAs happily sign these certificates. Some browsers, such as Opera, are now providing the organization information directly to users to help them make better trust decisions. Unfortunately, this is rearranging deck chairs on the Titanic since the SSL TTP model is totally broken--it does not allow for adequate authentication of sites to end users, hence the rampant phishing attacks and soon to be man-in-the-middle attacks (my prediction).