---
title: "Update:  Google Play store not taking advantage of Safe Browsing data to inform risk of apps in the store "
date: 2021-04-27T07:59:00.008-07:00
published: true
url: /2021/04/update-google-play-store-not-taking.html
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:43-07:00
---

I realized that I had never closed the loop on the flaw I discovered in the Google Play store years back.

I had discovered a missed opportunity for Google's own Safe Browsing information to inform the Google Play machine learning to detect suspicious mobile applications and alert users or block those apps and potentially force them through a human review cycle to verify them.  
  
During an incident at JP Morgan Chase, we were alerted to a malicious banking application in the Google Play store targeting JP Morgan Chase customers. The URL in the Google Play application listing was correctly flagged by Google's own Safe Browsing API as malicious. However, Google's Android app review did not consider this information when deciding to allow the application to be published. Nor did Google Play take advantage of this information to flag the app for review or unpublish it or even warn users that the application may be suspicious due to its association with the malicious URL.  
  
Google chose not to fix this. Closed as "Won't Fix (Infeasible)" ¯\\\_(ツ)\_/¯

It's no surprise to still see articles like this 5 years later, [Google Play Store Is Main Distributor of Malicious Apps, Study Reveals.](https://www.pcmag.com/news/study-reveals-googles-play-store-is-main-distributor-of-malicious-apps) (2020, November 12) and this one from just \*yesterday\* [Malware From Google Play Store Infects 700,000 Users](https://www.silicon.co.uk/mobility/smartphones/google-play-malware-etinu-394150). (2021, April 26)

Their official Android safety page has this gem: 

> Google Play Protect helps you download apps without worrying if they’ll hurt your phone or steal data. We carefully scan apps every day, and if we detect a bad one, we’ll let you know and tell you what to do next. And we study how it works. Because everything we learn improves the way we screen apps. So you stay safer.  
> [https://www.android.com/safety/](https://www.android.com/safety/)  

Well, they're not using "everything we learn" to "improve the way we screen apps".

My original questions to the Android team are still unanswered:

*   Is Google Play store taking advantage of Safe Browsing API data to identify risky appstore apps?
*   Is it able to flag app uploads that match risky Safe Browsing data and block them from the appstore unless there is human review, for example?  
*   Is it able to hide or flag applications that are already in the Appstore so that unsuspecting users do not unwittingly install a likely malicious application associated with unsavory sites?

My original writeup:  

Google Play + Safe Browsing = Safer Android Mobile Ecosystem. (2015, April 7). Retrieved from [https://truthimperative.axley.net/2015/04/google-play-safe-browsing-safer-android.html](https://truthimperative.axley.net/2015/04/google-play-safe-browsing-safer-android.html)