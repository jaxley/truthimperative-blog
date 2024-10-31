---
title: Password Hash Dash
source: 
created: 2024-10-06 21:27:13-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - security
  - post
date: 2005-11-09T23:26:00.000-08:00
published: true
url: /2005/11/password-hash-dash.html
aliases:
  - Password-hash-dash
linter-yaml-title-alias: Password-hash-dash

----dash
---


[Rainbow Crack](https://www.rainbowcrack-online.com/?x=md5) is a time/memory tradeoff tool that can break passwords knowing just the password hash. So, those people who still think that disclosing password hashes is not a big deal...  
  
SANS documented and proved, using a modified version of Rainbow Crack, something that I have suspected for a while. That [Oracle's proprietary password hashes are weak](https://www.sans.org/rr/special/index.php?id=oracle_pass) There are plenty of good ways to do this that it's a wonder these days that people still roll-their-own crypto. The SANS team is releasing an update to Rainbow Crack that can crack Oracle passwords.