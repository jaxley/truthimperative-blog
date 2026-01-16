---
title: Wrapped Web Apps on Mobile Need Extra Security Diligence
date: 2014-07-29T07:56:00.001-07:00
published: false
url:
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:21-07:00
tags:
  - post
---

I've heard developers and others assume that if you have an HTML5 web application and decide to "wrap" it to create an installable binary application you can deploy to your mobile devices that you don't really have to worry about mobile security -- just secure it as a normal web application.  
  
However, even just "wrapping" a web application in a PhoneGap/Cordova wrapper and leaving it to run in web views (whether iOS or Android) means that you have increased the [attack surface](https://www.owasp.org/index.php/Attack_Surface_Analysis_Cheat_Sheet) of your application. In addition to standard web application security risks, you now have ventured into the land of mobile application security risks.  
  
What kinds of risks might you be exposed to when simply wrapping an application?  I've mostly organized them into the OWASP mobile top 10 2013 taxonomy.  

*   Platform vulnerabilities

*   Insecure platform components (e.g. OpenSSL or Apple SecureTransport flaws, such as ["goto fail"](https://support.apple.com/kb/HT6147))
*   Vulnerable unpatched/unpatchable platform (Android end-of-life or unmaintained devices)

*   [M3: Insufficient Transport Layer Protection](https://www.owasp.org/index.php/Mobile_Top_10_2014-M3)

*   Browser-based applications rely on trusted-third-party certificate validation and browser UI chrome and hints for end users (humans) to validate they are talking to the correct server. Hybrid mobile web applications often hide this chrome from the user to maximize real-estate and appear more native than web.  Which means that the onus for validating remote endpoint identities with something like [Certificate pinning](https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning) lay with the application developer (which is a good thing to have this ability)
*   WebView (Android) and UIWebView (iOS) (which run all of the web pages in a wrapped application) both provide no native TLS validation capability. Requires special code using lower-level APIs to do properly.
*   If you support new tabs in UIWebView, you have to remember to update the address bar and other UI elements yourself to enable the end user to validate the remote site identity.

*   [M2: Insecure Data Storage](https://www.owasp.org/index.php/Mobile_Top_10_2014-M2)

*   File downloads have little to no protection except for the sandbox.
*   You do not get control over how the cache is stored/protected, such as weaving in SQLCipher to encrypt the cache.

*   [M4: Unintended Data Leakage](https://www.owasp.org/index.php/Mobile_Top_10_2014-M4)

*   Android webviews cannot disable caching entirely.  
*   Side-channel data leakage via Keyboard cache, web cache, cookie cache, application backgrounding screenshots, clipboard (copy/paste).

*   With certain settings, the local filesystem may be exposed to any malicious javascript running in the context of the HTML page via file:// URLs.  Again, script injection vulnerabilities can result in significant exposure beyond the traditional browser.

*   [M7:  Client Side Injection](https://www.owasp.org/index.php/Mobile_Top_10_2014-M7)

*   UIWebView (iOS) parses many file formats automatically without user intervention and could allow for exploit if navigation was controllable by an attacker.
*   The browser Same Origin Policy [is not enforced](https://labs.mwrinfosecurity.com/blog/2012/04/23/adventures-with-android-webviews/) on Android WebViews for exposed javascript interfaces, so any iframe on a HTML page could invoke your javascript-to-native bridge calls and have access to the functionality or data provided.

There are several risks to web applications whether they are wrapped or not that can be mitigated (and should) in mobile applications.  Simply wrapping an application without applying additional mobile security controls leaves these risks unmitigated when they could be to make your application even more secure.  You might consider whether it would be a lack of "due care" to omit these best practices controls that you could implement but have not.

*   [M3: Insufficient Transport Layer Protection](https://www.owasp.org/index.php/Mobile_Top_10_2014-M3)

*   Mobile devices don't have a hard-wired connection, so any accidental usage of insecure transport (e.g. typo of http instead of https) can lead to compromise.  Native mobile applications can intercept requests and detect http requests and abort, but wrapped apps cannot.  

*   [M4: Unintended Data Leakage](https://www.owasp.org/index.php/Mobile_Top_10_2014-M4)

*   Non-effaceable storage (mostly Android these days) used for cache, persistent cookies, HTML5 local storage, downloads so sensitive data can persist in NVRAM and be physically recoverable.  

*   You could mitigate this by controlling caching

*   File downloads that are allowed to use other helper applications on the mobile device to open/edit/view the files can result in leaking sensitive information outside of your application sandbox to potentially untrusted applications that may be malicious or insecurely handle the information outside of your application's control.

I have seen few apps remain simple HTML5 apps for long though.  Eventually, pieces of functionality migrate to take advantage of the native mobile experience, such as logon, offline data access, launching helper applications, playing media files, etc.  Now, you have a hybrid application and increased attack surface even more because you have combined three different attack surfaces in one application, meaning you have to worry about all three:  

*   Web Application Security Risks
*   Native Mobile Application Risks
*   Hybrid Mobile Application Risks

Some additional areas of attack surface, specific to the mobile hybrid integration (many of these risks still apply to the server-side components for other reasons whether used by mobile or not):  

*   [M7: Client Side Injection](https://www.owasp.org/index.php/Mobile_Top_10_2014-M7)

*   If you add a javascript-to-native bridge, such as Android's [addJavascriptInterface](https://developer.android.com/reference/android/webkit/WebView.html#addJavascriptInterface(java.lang.Object,%20java.lang.String)) or the [JSExport](https://www.bignerdranch.com/blog/javascriptcore-example/) capabilities in iOS7+, any Cross-Site Scripting (XSS) vulnerability might enable an attacker to remotely execute native code in your application.  Secure transport becomes hyper-critical in these situations, and on Android, restricting to only the secure versions.

*   [M10: Lack of Binary Protections](https://www.owasp.org/index.php/Mobile_Top_10_2014-M10)
*   [M9: Improper Session Handling](https://www.owasp.org/index.php/Mobile_Top_10_2014-M9)
*   [M6: Broken Cryptography](https://www.owasp.org/index.php/Mobile_Top_10_2014-M6)
*   [M5: Poor Authentication and Authorization](https://www.owasp.org/index.php/Mobile_Top_10_2014-M5)
*   [M8: Security Decisions Via Untrusted Inputs](https://www.owasp.org/index.php/Mobile_Top_10_2014-M8)
*   [M1: Weak Server Side Controls](https://www.owasp.org/index.php/Mobile_Top_10_2014-M1)

The story is not all bad.  There are security advantages of a **_properly secured_** mobile website in a wrapped application vs. a browser. 

*   Sandboxing.  

*   Being an installed application, your wrapped web application gets separate cache, local storage quota, web settings, cookie storage, etc. from all other sites.
*   Protection from many reflected cross-site scripting attacks.  Traditional browser applications can be attacked from other pages/tabs within a general purpose browser.

*   Better mobile security controls available

*   You get to run native code outside of the browser that can provide more capabilities to validate platform security and enforce additional security controls that browsers have to .  You could incorporate root/jailbreak detection, malware detection, code protection, 

 Just keep in mind that _**properly securing**_ the application is a nontrivial amount of work on each platform, equivalent to