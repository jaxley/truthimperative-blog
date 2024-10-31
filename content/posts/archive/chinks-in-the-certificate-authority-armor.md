---
title: Chinks In The Certificate Authority Armor
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:56:37-07:00
tags:
  - post
date: 2021-05-19T15:33:00.000-07:00
published: false
url: 
aliases:
  - Chinks-in-the-certificate-authority-armor
linter-yaml-title-alias: Chinks-in-the-certificate-authority-armor
---


  
  

1.I had catalogued some high-profile CA mishaps:

a. VeriSign issued two certs to someone claiming to be Microsoft in 2001, Microsoft, Inc. (2007-02-21). ["Microsoft Security Bulletin MS01-017: Erroneous VeriSign-Issued Digital Certificates Pose Spoofing Hazard"](https://support.microsoft.com/kb/293818). Retrieved 2011-11-09.

b. Diginotar, as you indicated, was compromised. Issued 531 fraudulent certs. Bright, Peter (2011-08-30). ["Another fraudulent certificate raises the same old questions about certificate authorities"](https://arstechnica.com/security/news/2011/08/earlier-this-year-an-iranian.ars). Ars Technica. Retrieved 2011-09-01.

c. Trustwave gave one of their customers a subordinate CA for MiTM of any SSL in a DLP product and later revoked it ["Trustwave issued a man-in-the-middle certificate"](https://www.h-online.com/security/news/item/Trustwave-issued-a-man-in-the-middle-certificate-1429982.html). _The H Security_. 2012-02-07. Retrieved 2012-03-14.

d. Comodo was compromised I believe on more than one occasion, Bright, Peter (28 March 2011). ["Independent Iranian hacker claims responsibility for Comodo hack"](https://arstechnica.com/security/news/2011/03/independent-iranian-hacker-claims-responsibility-for-comodo-hack.ars). Ars Technica. Retrieved 2011-09-01.

e. The Comodo hacker claims to have infiltrated several other CAs as well, “He says that he has broken into GlobalSign, and a further four more CAs that he won't name. He also claimed that at one time he had access to StartCom.”,"Comodo hacker: I hacked DigiNotar too; other CAs breached | Ars Technica." Last modified 04/22/2014 11:30:22. https://arstechnica.com/security/2011/09/comodo-hacker-i-hacked-diginotar-too-other-cas-breached/ (accessed 4/22/2014).

f. Turktrust issued CA certificates “by mistake” that were then used to mint fraudulent Google certificates that were used in the wild, "Google Discovers Fraudulent Digital Certificate Issued for Its Domain | Threat Level | WIRED." Last modified 04/22/2014 11:04:30. [https://www.wired.com/2013/01/google-fraudulent-certificate/](https://www.wired.com/2013/01/google-fraudulent-certificate/) (accessed 4/22/2014).

g. Evaluation as of 10/27/2011 of CRLs showed that as many as 248 certificate revocations were issued by 14 distinct CA organizations because of “CA Compromise”. "How secure is HTTPS today? How often is it attacked? | Electronic Frontier Foundation." Last modified 04/22/2014 11:32:16. [https://www.eff.org/deeplinks/2011/10/how-secure-https-today](https://www.eff.org/deeplinks/2011/10/how-secure-https-today) (accessed 4/22/2014).

h. Microsoft CA certificates were forged by exploiting MD5 signatures (Flame malware), " Flame malware collision attack explained - security Research & Defense - Site Home - TechNet Blogs ." Last modified 04/22/2014 11:38:23. [https://blogs.technet.com/b/srd/archive/2012/06/06/more-information-about-the-digital-certificates-used-to-sign-the-flame-malware.aspx](https://blogs.technet.com/b/srd/archive/2012/06/06/more-information-about-the-digital-certificates-used-to-sign-the-flame-malware.aspx) (accessed 4/22/2014).

i. Thawte automatically issued a certificate to Mike Zusman for Microsoft’s live.com domain (2008), "How is SSL hopelessly broken? Let us count the ways • The Register." Last modified 04/22/2014 11:42:47. [https://www.theregister.co.uk/2011/04/11/state\_of\_ssl\_analysis/](https://www.theregister.co.uk/2011/04/11/state_of_ssl_analysis/) (accessed 4/22/2014).

j. A certificate claiming to be from RSA got included in Firefox and Mac OS that nobody could account for and even RSA initially disavowed it, "RSA says it fathered orphan credential in Firefox, Mac OS • The Register." Last modified 04/22/2014 11:45:16. [https://www.theregister.co.uk/2010/04/06/mysterious\_mozilla\_apple\_certificate/](https://www.theregister.co.uk/2010/04/06/mysterious_mozilla_apple_certificate/) (accessed 4/22/2014).

k. A Comodo reseller (CertStar) granted Eddy Nigg a mozilla.com certificate, “Five minutes later I was in the possession of a legitimate certificate issued to **mozilla.com - no questions asked - no verification checks done - no control validation - no subscriber agreement presented, nothing**.”, "Join The Revolution! » Untrusted Certificates." Last modified 04/22/2014 11:48:59. [https://blog.startcom.org/?p=145](https://blog.startcom.org/?p=145) (accessed 4/22/2014).

l. Researchers were able to demonstrate forged Verisign RapidSSL certificates by exploiting MD5 collisions (2008), "Web browser flaw could put e-commerce security at risk - CNET." Last modified 04/22/2014 11:51:43. [https://www.cnet.com/news/web-browser-flaw-could-put-e-commerce-security-at-risk/](https://www.cnet.com/news/web-browser-flaw-could-put-e-commerce-security-at-risk/) (accessed 4/22/2014).

m. Dutch CA KPN got hacked in 2011, “’Hacked server’ claims another certificate authority casualty” [https://www.zdnet.com/blog/london/hacked-server-claims-another-certificate-authority-casualty/596](https://www.zdnet.com/blog/london/hacked-server-claims-another-certificate-authority-casualty/596)  
" Google Online Security Blog: Maintaining digital certificate security ." Last modified 08/28/2014 12:41:46. https://googleonlinesecurity.blogspot.com/2014/07/maintaining-digital-certificate-security.html (accessed 8/28/2014).  Indian CA issues unauthorized google and yahoo certificates.

2. Information showing risks of trusted third party CA model uncovered (from EFF’s [defcon 18 presentation](https://www.eff.org/files/DefconSSLiverse.pdf)):

a. CAs were observed to have signed unqualified names

i. Over 6000 unique & valid “localhost” certificates issued by big-name issuers (Comodo, Go Daddy, GlobalSign, Starfield, Equifax, Digicert, Entrust, Cybertrust, Microsoft, and Verisign)

b. iSEC/EFF observed 12000 vulnerable CA certificates in the wild due to the Debian OpenSSL bug

c. Hundreds of companies and organizations have their own subordinate CAs which chain to the trusted roots that have been observed. A compromise of any one of those would be sufficient.

d. 46 countries had their own valid CAs

3. List of CAs by platform (from EFF’s [defcon 18 presentation](https://www.eff.org/files/DefconSSLiverse.pdf) or other sources):

a. Mozilla: 124 trust roots from 60 organizations

b. Microsoft: 19 default trust roots but auto-updates to over 300 from over 100 organizations

c. Apple: 211 CA certificates in iOS7 (counted table rows on [https://support.apple.com/kb/ht5012](https://support.apple.com/kb/ht5012))

d. Android:

4. List of trusted CAs by Windows or Firefox observed live on the Internet (from EFF’s [defcon 18 presentation](https://www.eff.org/files/DefconSSLiverse.pdf))::

a. 1482 CA certificates from 1167 distinct issuers across 651 organizations.