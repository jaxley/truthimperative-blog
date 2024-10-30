---
title: Bank Of India'S Website Compromised
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:56:47-07:00
tags:
  - post
date: 2007-10-16T08:13:00.000-07:00
published: true
url: /2007/10/bank-of-india-website-compromised.html
---


Courtesy the F-Secure blog they show a case where the Bank of India website was compromised to include malicious iframes, one of which  
  

> "...contains an obfuscated JavaScript that uses exploits to download and run a file called loader.exe. This file is a small downloader which downloads additional files that are different password stealing trojans, additional downloaders, et cetera."  

  
The stupid thing about this is that if the attackers had quietly compromised this site and done some intelligent money transfers, or web-based password capture, this may have gone unnoticed for some time.  But they took their compromise and used it to hammer user's PCs with known malware that I'm sure got Antivirus programs alarming.  Not too subtle.  
  
Good case for SSL-encrypted pages and not clicking "okay" to the "allow unencrypted content to load in encrypted pages?" dialog boxes in the browser...  Also good case for using a browser other than IE6.  
  
[Bank of India's Website Compromised - F-Secure Weblog : News from the Lab](http://www.f-secure.com/weblog/archives/00001265.html)