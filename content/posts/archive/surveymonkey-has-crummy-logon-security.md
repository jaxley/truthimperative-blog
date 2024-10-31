---
title: SurveyMonkey has crummy logon security
date: 2010-06-06T05:02:00.000-07:00
published: true
url: /2010/06/surveymonkey-has-crummy-logon-security.html
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:43-07:00
---

FYI, [SurveyMonkey](https://www.surveymonkey.com) is a great site, but they have really crappy security. They actually store your password in the clear, or in reversibly-encrypted format. If you request your forgotten login and/or password, they actually helpfully email you both your login \_and\_ your cleartext password. What year is it again? That is the kind of kindergarten mistake that there is no excuse for making. How to securely handle logons to systems and applications is fairly standardized and there are lots of simple options for supporting secure one-way hashes that are immune to a variety of attacks. No excuse for security this bad...  
  
Fortunately, they allow you now to sign in with your Google login so that might be a better option -- get them out of the authentication business that it appears they have no business being in.