---
title: Ipsec Esp Protocol Flaw Discovered
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - security
  - post
date: 2005-05-13T08:41:00.000-07:00
published: true
url: /2005/05/ipsec-esp-protocol-flaw-discovered.html
aliases:
  - Ipsec-esp-protocol-flaw-discovered
linter-yaml-title-alias: Ipsec-esp-protocol-flaw-discovered

---vered
---


[NISCC Vulnerability Advisory IPSEC - 004033](https://www.niscc.gov.uk/niscc/docs/al-20050509-00386.html?lang=en "NISCC Vulnerability Advisory IPSEC - 004033")  
  
From what I have read on this, the flaw in ESP only will affect you if you are using ESP for confidentiality protection only (no integrity check in ESP) and are relying on other layers for integrity protection (e.g. AH or the application layer). I would never recommend you configure IPSec in this manner. Confidentiality protection without integrity protection in the same layer is not very useful IMHO. And it can be dangerous, as this flaw indicates.