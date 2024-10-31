---
title: Google Play Safe Browsing Safer Android Mobile Ecosystem
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:59:37-07:00
tags:
  - post
date: 2015-04-07T13:54:00.001-07:00
published: true
url: /2015/04/google-play-safe-browsing-safer-android.html
aliases:
  - Google-play-safe-browsing-safer-android-mobile-ecosystem
linter-yaml-title-alias: Google-play-safe-browsing-safer-android-mobile-ecosystem
---


A recent incident at my work came to my attention involving a takedown request for an unauthorized app in Google Play using my company's brand.  This happens often in appstores all over the world, which is why having brand protection monitoring for these is really critical.  It is all too easy for these to slip into even legitimate appstores like Google Play.  
  
One thing I noticed when I was investigating this incident was that the Google Play application page has a section that allows a developer to specify a website link, with a name "Visit Website".  

![](/googleplay-visitwebsite.tiff)

Google Play app metadata, including Visit Website

  
I happened to notice that the website link for the application in question also included our brand/company name in the URL.  I wanted to visit it to see what else I could learn from what they had on that site.  When I clicked on the link, however, it went through a redirect at Google (e.g. https://www.google.com/url?q=https://example.example.com) where Google [Safe Browsing](https://www.google.com/transparencyreport/safebrowsing/) actually flagged the URL as a phishing site.  
  

![](/phishing-warning-google.tiff)

Google phishing warning

Which made me wonder - if Google's left hand (Safe Browsing) has knowledge of a suspected phishing site, shouldn't that inform Google's right hand (Google Play) that any application tied to such a URL is also potentially untrustworthy?  Essentially, if trust can propagate transitively, then the opposite (suspicion / risk) should also propagate transitively.  If you take this even further, you should propagate that suspicion through a graph from the app containing the suspicious link up to the developer of the app and then back down to any other app that developer has associated with them in Google Play.  This would be something that would be easily automated given the description of the machine learning in the [Google Android Security 2014 Report](https://static.googleusercontent.com/media/source.android.com/en/us/devices/tech/security/reports/Google_Android_Security_2014_Report_Final.pdf) already done to analyze applications:  

> "Google’s systems use machine learning to see patterns and make connections that humans would not. Google Play analyzes millions of data points, asset nodes, and relationship graphs to build a high-precision security-detection system."

I would then imagine Google Play could take one or more of several actions if URLs are provided that get Safe Browsing scores low enough:  
  

1.  Apps or developers and their apps could be delisted from Google Play until a human has reviewed the URL and app in more detail.  Google [announced just last month](https://android-developers.blogspot.com/2015/03/creating-better-user-experiences-on.html) they are going to be augmenting human review of apps in Google Play so this would dovetail with those efforts.
2.  Google Play could and should include clear, usable UI warnings for users searching and browsing apps about the suspicion/risk so that they can make informed trust decisions.
3.  The Google Play Verify Apps could further come into play if apps are confirmed malware/badware/Potentially Harmful Apps (PHAs) to warn users who may have already installed such an application or block the app.  This would also seem to dovetail with other [recently-announced efforts](https://googleonlinesecurity.blogspot.com/2015/04/android-security-state-of-union-2014.html) in their [Google Android Security 2014 Report](https://static.googleusercontent.com/media/source.android.com/en/us/devices/tech/security/reports/Google_Android_Security_2014_Report_Final.pdf) to help crack down on these kinds of applications in the Android ecosystem.