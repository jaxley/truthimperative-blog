---
title: Google Smart Lock For Passwords A Bit Too Easy
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:58:21-07:00
tags:
  - post
date: 2021-05-23T20:02:00.030-07:00
published: false
url: 
aliases:
  - Google-smart-lock-for-passwords-a-bit-too-easy
linter-yaml-title-alias: Google-smart-lock-for-passwords-a-bit-too-easy
---


Note: I did this investigation way back in 2016. I had written it up to share with Google but forgot to publish it!

I had many discussions with the product team about this at the time and reported it as a security issue but nothing came of my report.

The product team at the time said that there were changes in flight already to address some of the issues. I'm sure it has been improved. As I've moved out of mobile security I haven't had a need or chance to circle back and follow up.  

Abstract
========

An investigation of the [Google Smart Lock for Passwords](https://get.google.com/smartlock/) implementation and API reveals some design and mobile security weaknesses that make it too easy for threat actors in privileged positions to steal credentials for any app that has stored them in Smart Lock.  You would not want the disclosure of a Google account password, for example, to be a sufficient condition to dump all of the Smart Lock for Passwords credentials.  However, the way the system is implemented, this could be all that is required (or disclosure of a google master token).  Some suggestions are offered in the Summary section that could improve the security of the design and make it more resistant to complete data compromise.

Background
==========

  

I recently took a look at the Smart Lock for Passwords capability to investigate the security of the solution and understand what risk there might be to applications storing credentials in there to possibly share between web and mobile applications.  I wanted to fully understand what was preventing an arbitrary application from dumping all of your credentials stored at Google.

  

Most alarming to me was when I found [this quote](https://developers.google.com/identity/smartlock-passwords/android/retrieve-credentials), “Because the Credentials API does not require authentication...”  I thought, “Wait, some of the most sensitive information that Google is encouraging people to store in the cloud is available via an API that requires no authentication?  How can that possibly be secure?”  Since the API presumably only makes available the accounts that a specific application has stored for itself, there must be some sort of identification going on so that Google’s APIs know which application is requesting the credentials to avoid disclosing app credentials to other applications.  I figured that there was likely some sort of identification required, perhaps even some obfuscation going on to make it difficult to invoke the API outside of Google’s environment to steal data.

  

The typical mechanism for accessing user information that Google APIs require to constrain which information which applications are allowed to obtain is through the use [OAuth 2.0](https://developers.google.com/identity/protocols/OAuth2) grants.  Applications typically need to establish credentials in the Google Developer Console (a client ID and a client secret for server-side applications; Android applications that are publicly available via the app store cannot safely embed the client secret inside the application so Android applications actually provide a SHA1 hash of their application signing key as a surrogate “credential”)  But Smart Lock for Passwords doesn’t use this.  What does it use?

  

I started by running the [credentials quickstart application](https://github.com/googlesamples/android-credentials/) in Github on an Android emulator.  I wanted to start off by seeing what kind of logcat information was dumped during this process as well as intercept the network calls to figure out what the client was telling the server to convince it to release the credentials. [Burp Suite](https://portswigger.net/) free edition was sufficient for the task, especially with the simple [Protobuf decoder](https://portswigger.net/bappstore/ShowBappDetails.aspx?uuid=bd8c70d3f1b74679b2a9fed03d36e81a) extension.  I just needed to forward the emulator web calls through the burp proxy:

  

~/Library/Android/sdk/tools/emulator -dns-server 8.8.8.8 -avd Nexus\_5\_API\_22\_x86 -http-proxy 127.0.0.1:8080

  

The first task was to uncover what services were involved to understand the underlying API. As a prerequisite step, I added a test google account to the Emulator so that there would be a google account available for Smart Lock to persist data.  Then I launched the sample app on the emulator in debug mode to step through the call flow as each API call was made.  I walked through and stored sample credentials in Smart Lock (login:  username1).

  

Android phones make a \*ton\* of network calls so wading through all of the intercepted calls took a bit of finesse.  Fortunately, the API calls stood out pretty nicely:

  

GET /credentials/v1/credentials/Z%3AADqtAZyR2AJ0MWvMaSaAYWtGVB55mXRyHj8LuUWWE8i0pjjNWHLEnaA1XNFTFa7%2FzLnF81Bp3Rowi80mfjKfxxsklc9ddRPgJg%3D%3D?alt=proto&header.playServicesVersion=8115000&obfuscationKey=FFCE887DEC814C0D2C3EFC3C28649D501B63F5F9741299787B33F3C6B1DB5B45&url=android%3A%2F%2F5TQ-NNe-QMzeZoDo-E-vuI4IoUdLY5EVlz6\_q0CQfy2CWry2UOTLuxTGMpaFsPxIAuYQ\_DEpxqoLAVZB7Ol39A%3D%3D%40com.google.codelab.smartlock.different HTTP/1.1

Accept-Encoding: gzip

Authorization: OAuth ya29.aALKZ....-iS1WX30zzQo

User-Agent: unused/0 (generic\_x86 LMY48X); gzip

Host: www.googleapis.com

Connection: close

  

That is a call to get a particular credential by credential ID and returns data like the following (JSON version shown here for human readability instead of the default protobuf - it’s pretty handy to change alt=proto in the URL to alt=json to get JSON readable response data):

  

{

 "credential": {

  "id": "Z:ADqtAZyR2AJ0MWvMaSaAYWtGVB55mXRyHj8LuUWWE8i0pjjNWHLEnaA1XNFTFa7/zLnF81Bp3Rowi80mfjKfxxsklc9ddRPgJg==",

  "url": "android://5TQ-NNe-QMzeZoDo-E-vuI4IoUdLY5EVlz6\_q0CQfy2CWry2UOTLuxTGMpaFsPxIAuYQ\_DEpxqoLAVZB7Ol39A==@com.google.codelab.smartlock.different/",

  "mainDomain": "com.google.codelab.smartlock.different",

  "username": "username1",

  "password": "E8605C2B3C913A7295BF35B5F6C41797",

  "signonRealm": "android://5TQ-NNe-QMzeZoDo-E-vuI4IoUdLY5EVlz6\_q0CQfy2CWry2UOTLuxTGMpaFsPxIAuYQ\_DEpxqoLAVZB7Ol39A==@com.google.codelab.smartlock.different/",

  "serverContext": "CvMGCmZaOkFEcXRBWnlSMkFKME1Xdk1hU2FBWVd0R1ZCNTVtWFJ5SGo4THVVV1dFOGkwcGpqTldITEVuYUExWE5GVEZhNy96TG5GODFCcDNSb3dpODBtZmpLZnh4c2tsYzlkZFJQZ0pnPT0SZlo6QURxdEFad2owN2JUQmNhb1NVaHZ2RXZTalR0amx6VzQ1VkhtTFk2YlJzUytqdEwvZ1dRd2xuVTlBN3BMM21jREZGT3p5TlhQSlNMemlPb0FRa0lxbnpVRGltQ08zdVZDV0E9PSDF5vap6afKAiiRjM\_ooyow\_ovP6KMqOgllbmNyeXB0ZWR4AKoB0QSKsxbMBArJBApYWlNraERNQVIxempBVm9QYjR1a0lwYTZzcy91Mm9uRzRVQzdrSXV6aW1sTVEyMmkvZExkRmZXc1BKSjBMb3RaazVzQm1JS2NRTVhqLzQ0UzU1MExGaXc9PRLsA3l0UFkwWTBGVkhab0VScDBpRDBGM294SndQN1lJblZ5SEpNU1BxcEhMeFRyZ3laVS9TNkh6RXlRY2pGTWRaN0hCRWUxaDNVYm1PNGZEd0s0YzZhdkZtZVNnMGpta2lTRTdybVl4UzRKWE0yWEM0WTE0S0xEVUx3OVJ0MzNUN09RZWVPQ3R0eFJBNy9CQXB1RVBTelU0V09BcUZNUmJ3dnlZUzN3ZlZCeGV6MzFhYlJGVEw4dll0NWNUNDh0RTExeEFBL0ZNTzhldmdMRHBsOW5GSW9hcU5zUXV3OVdQMlYrU2VZZGdXUWROaVFSTVpUWWFKdEpoZ3BxY096VjBpek5vaXh3NUw0eHdRaVRLYTFWWnlDSXpuSThXT3FESGcyMUkyVkZSTndxQzlvQlNaVzg0REJhRUtDK256YWlsdWRBSGtwaWNsYVpmT3R4aGR3K0ZCQkdhbkM5WkFXbTlPWE5DS1kzalYvRkhZQ2Y2WGFvWDd5cmNIYkljTWxmcDk3NmJIdDlZa2hkT0p6WndwMFNBS2Jna3dYVmN4MlkzT3BXVHJGRjBvQUhNUGRiMStWTmRSTkhWaVdKQjZrNUYwcWFOK3Via3NZTjBrY1dKQ1RvTm5oRjA5a296aG45THdqL003ZTZkRittVldnPboBHGh6SmJGT2hjTlZkbDJ6MDBxRW5HaEM5RVZiMD3CAQiAAAAAAAAAABIlejAwMDAwMTUyLTNjMWItNzNjNi0wMDAwLTAwMDAwMDAwMDAwMA=="

 }

}

  

I was able to observe the credential storage API calls as well (protobuf data in the POST body below is obscured by document formatting but is pretty readable):

  

POST /credentials/v1/credentials?alt=proto&header.playServicesVersion=8115000&obfuscationKey=E2330CD3F79DD18B93F77367BCFD77709C839D8423CB331445976B6D94C634AF HTTP/1.1

Content-Type: application/x-protobuf

Accept-Encoding: gzip

Authorization: OAuth ya29.aALKZ...1WX30zzQo

User-Agent: unused/0 (generic\_x86 LMY48X); gzip

Content-Length: 185

Host: www.googleapis.com

Connection: close

android://5TQ-NNe-QMzeZoDo-E-vuI4IoUdLY5EVlz6\_q0CQfy2CWry2UOTLuxTGMpaFsPxIAuYQ\_DEpxqoLAVZB7Ol39A==@com.google.codelab.smartlock.different        username1 457E75BC1D77C1AA0AC448D6358F0E4A

  

So far, I found the credential retrieval call and a call showing how a credential gets stored.  But what I didn’t have was information on how the client gets made aware of the credential IDs to build the request for that specific credential.  I wondered if there was a call to return a dump of all of the available credential IDs. GET /credentials/v1/credentials didn’t return anything.  I started looking at other calls made and couldn’t find one, so I surmised that Google Play Services may have already retrieved and cached the list of IDs before I started capturing.  This was confirmed when I tried to add a new credential outside of the application by making a call using [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en).  That credential didn’t show up in the pick list the next time I tried to login to the sample app using Smart Lock.  It did show up later after restarting the emulator though.  

  

I needed to start fresh so I removed the google account and re-added it to the Emulator to force lots more API calls to be made to sync google profile data, etc.  Hidden amongst the logged calls was what I was looking for (again, I’m showing the JSON response that I got by replaying the request in Burp with alt=json):

  

GET /credentials/v1/credentialGroups?alt=proto&header.playServicesVersion=8115000&mask.bestMatchCredential=true&mask.affiliationInfo=true&mask.isSyncRequest=true&mask.returnOriginSettings=true HTTP/1.1

Accept-Encoding: gzip

Authorization: OAuth ya29.agJ8lWPpK-...csD1IlDIw

User-Agent: unused/0 (generic\_x86 LMY48X); gzip

Host: www.googleapis.com

Connection: close

Response (JSON format):

{

 "credentialGroup": \[

  {

   "id": "Z:ADqtAZyR2AJ0MWvMaSaAYWtGVB55IUQ7g4uvXuhsrZmh26QHH/GAqhFoCMWU9HFWo7+TtY4ZbepSFB1HqUw20klRjUqApx1DRw==",

   "credential": \[

 {

 "id": "Z:ADqtAZyR2AJ0MWvMaSaAYWtGVB55IUQ7g4uvXuhsrZmh26QHH/GAqhFoCMWU9HFWo7+TtY4ZbepSFB1HqUw20klRjUqApx1DRw==",

 "url": "android://5TQ-NNe-QMzeZoDo-E-vuI4IoUdLY5EVlz6\_q0CQfy2CWry2UOTLuxTGMpaFsPxIAuYQ\_DEpxqoLAVZB7Ol39A==@com.google.codelab.smartlock/",

 "mainDomain": "com.google.codelab.smartlock",

 "username": "username1",

 "signonRealm": "android://5TQ-NNe-QMzeZoDo-E-vuI4IoUdLY5EVlz6\_q0CQfy2CWry2UOTLuxTGMpaFsPxIAuYQ\_DEpxqoLAVZB7Ol39A==@com.google.codelab.smartlock/",

 "serverContext": "Ct8GCmZaOkFEcXRBWnlSMkFKME1Xdk1hU2FBWVd0R1ZCNTVJVVE3ZzR1dlh1aHNyWm1oMjZRSEgvR0FxaEZvQ01XVTlIRldvNytUdFk0WmJlcFNGQjFIcVV3MjBrbFJqVXFBcHgxRFJ3PT0SZlo6QURxdEFad2owN2JUQmNhb1NVaHZ2RXZTalR0amx6VzQ1VkhtTFk2YlJzUytqdEwvZ1dRd2xuVTlBN3BMM21jREZGT3p5TlhQSlNMemlPb0FRa0lxbnpVRGltQ08zdVZDV0E9PSDV\_6TeuafKAijcrsPioyowu4724KMqOgllbmNyeXB0ZWR4AKoBvQSKsxa4BAq1BApYWlNraERNQVIxempBVm9QYjR1a0lwYTZzcy91Mm9uRzRVQzdrSXV6aW1sTVEyMmkvZExkRmZXc1BKSjBMb3RaazVzQm1JS2NRTVhqLzQ0UzU1MExGaXc9PRLYA0xXbmMvUGw3b2Vvd0pxejNIbnViREtjZVJDVzk1VEt3SHZjSHNUQkI3Z2syT0V0NENkQ2I5SHVSeE5aNWhCV1dJTXhuWEpUcFVMeWpSSTZvVzd0MG1VYVlxUll1NTVJODFEY2d0b2hGY1duNlZQSmZNaEhqMnMxaEZ3M0hrVDFYdEhXZEZpUyt4SzVnZFdMWC9XbksrNGMrcWpFNDYvSFg1cjgydGszZHhUd1RuUFhuVFBpSklpclBqaXBjZVBpc2RIK2VJMGd2N1FBbFJRMW1CeGxSbnovMVQ4VDAwNmlDRzFjZjFLV0p5S3N6Qm1VV0wvS2hiUGhzb0M3WG5ZdjF3MVJWNGlRZmVncm9Zd3A1ZSswMERGL3lmc0pVMzdBK1YwSk40LzRGTWcrOGRwalYrUkhBK1duM3BPelFXS3JGUjgwVnNCYmdMdzZFeHJDUzRqV3Y5U2NUK1JwOWZFcFhld2Z4b3o4SXI1QlNndEVVdFJOcE1lZFM0dTdTejhaZ3JjZTUvWHl2MXdWVm1kczYrVjRwTnljSXZDam1aWDloYUJGNGJ5NDBaNWJ2cXkzT0twZ09iaHBZdzNZOHJjbDJadEY2RVRxT2tTejljS05vYW9iTE1nPT26ARxlanVVbURFR2NwWDM4bEVXaW5sS0UyTUw2eEU9wgEIgAAAAAAAAAASJXowMDAwMDE1Mi0zYzFiLTczYzYtMDAwMC0wMDAwMDAwMDAwMDA="

 }

   \],

   "isMasterPassword": false

  },

  {

   "id": "Z:ADqtAZyR2AJ0MWvMaSaAYWtGVB55mXRyHj8LuUWWE8i0pjjNWHLEnaA1XNFTFa7/zLnF81Bp3Rowi80mfjKfxxsklc9ddRPgJg==",

   "credential": \[

 {

 "id": "Z:ADqtAZyR2AJ0MWvMaSaAYWtGVB55mXRyHj8LuUWWE8i0pjjNWHLEnaA1XNFTFa7/zLnF81Bp3Rowi80mfjKfxxsklc9ddRPgJg==",

 "url": "android://5TQ-NNe-QMzeZoDo-E-vuI4IoUdLY5EVlz6\_q0CQfy2CWry2UOTLuxTGMpaFsPxIAuYQ\_DEpxqoLAVZB7Ol39A==@com.google.codelab.smartlock.different/",

 "mainDomain": "com.google.codelab.smartlock.different",

 "username": "username1",

 "signonRealm": "android://5TQ-NNe-QMzeZoDo-E-vuI4IoUdLY5EVlz6\_q0CQfy2CWry2UOTLuxTGMpaFsPxIAuYQ\_DEpxqoLAVZB7Ol39A==@com.google.codelab.smartlock.different/",

 "serverContext": "CvMGCmZaOkFEcXRBWnlSMkFKME1Xdk1hU2FBWVd0R1ZCNTVtWFJ5SGo4THVVV1dFOGkwcGpqTldITEVuYUExWE5GVEZhNy96TG5GODFCcDNSb3dpODBtZmpLZnh4c2tsYzlkZFJQZ0pnPT0SZlo6QURxdEFad2owN2JUQmNhb1NVaHZ2RXZTalR0amx6VzQ1VkhtTFk2YlJzUytqdEwvZ1dRd2xuVTlBN3BMM21jREZGT3p5TlhQSlNMemlPb0FRa0lxbnpVRGltQ08zdVZDV0E9PSDF5vap6afKAiiRjM\_ooyow\_ovP6KMqOgllbmNyeXB0ZWR4AKoB0QSKsxbMBArJBApYWlNraERNQVIxempBVm9QYjR1a0lwYTZzcy91Mm9uRzRVQzdrSXV6aW1sTVEyMmkvZExkRmZXc1BKSjBMb3RaazVzQm1JS2NRTVhqLzQ0UzU1MExGaXc9PRLsA3l0UFkwWTBGVkhab0VScDBpRDBGM294SndQN1lJblZ5SEpNU1BxcEhMeFRyZ3laVS9TNkh6RXlRY2pGTWRaN0hCRWUxaDNVYm1PNGZEd0s0YzZhdkZtZVNnMGpta2lTRTdybVl4UzRKWE0yWEM0WTE0S0xEVUx3OVJ0MzNUN09RZWVPQ3R0eFJBNy9CQXB1RVBTelU0V09BcUZNUmJ3dnlZUzN3ZlZCeGV6MzFhYlJGVEw4dll0NWNUNDh0RTExeEFBL0ZNTzhldmdMRHBsOW5GSW9hcU5zUXV3OVdQMlYrU2VZZGdXUWROaVFSTVpUWWFKdEpoZ3BxY096VjBpek5vaXh3NUw0eHdRaVRLYTFWWnlDSXpuSThXT3FESGcyMUkyVkZSTndxQzlvQlNaVzg0REJhRUtDK256YWlsdWRBSGtwaWNsYVpmT3R4aGR3K0ZCQkdhbkM5WkFXbTlPWE5DS1kzalYvRkhZQ2Y2WGFvWDd5cmNIYkljTWxmcDk3NmJIdDlZa2hkT0p6WndwMFNBS2Jna3dYVmN4MlkzT3BXVHJGRjBvQUhNUGRiMStWTmRSTkhWaVdKQjZrNUYwcWFOK3Via3NZTjBrY1dKQ1RvTm5oRjA5a296aG45THdqL003ZTZkRittVldnPboBHGh6SmJGT2hjTlZkbDJ6MDBxRW5HaEM5RVZiMD3CAQiAAAAAAAAAABIlejAwMDAwMTUyLTNjMWItNzNjNi0wMDAwLTAwMDAwMDAwMDAwMA=="

 }

   \],

   "isMasterPassword": false

  }

 \]

}

  

I should point out that in the middle of all of this, I had built another copy of the sample application with a different identifier (appending .different to the suffix) and installed it onto the phone so I could play with two different applications (even with different signing keys) and see if one could access the credentials of another perhaps.  What you see in the response above includes \*all\* credentials for \*all\* applications stored on the user’s account.  That was alarming to me from a secure design perspective because it means that it could be possible for a rogue application to invoke this API to reveal all of the credential IDs that could then be retrieved one-by-one to dump every password on the user’s account!  

  
  

Aside: What does it look like if you have a Chrome passphrase and try to list credentials (since Smart Lock doesn’t yet work if you have a Chrome passphrase)?

GET [https://www.googleapis.com/credentials/v1/credentialGroups?alt=json&header.playServicesVersion=8115000&mask.bestMatchCredential=true&mask.affiliationInfo=true&mask.isSyncRequest=true&mask.returnOriginSettings=true](https://www.googleapis.com/credentials/v1/credentialGroups?alt=json&header.playServicesVersion=8115000&mask.bestMatchCredential=true&mask.affiliationInfo=true&mask.isSyncRequest=true&mask.returnOriginSettings=true)

{

  "error": {

 "errors": \[

 {

 "domain": "global",

 "reason": "failedPrecondition",

 "message": "CUSTOM\_PASSPHRASE"

 }

 \],

 "code": 400,

 "message": "CUSTOM\_PASSPHRASE"

  }

}

  

  

What I needed to figure out was what the minimum required information that a rogue application would need to invoke these API calls to know how good the protection was.  

  

I made many requests by intercepting them in Burp Suite and suppressed parameters and diddled with parameters to see what would be accepted and not.  I also tried to replace identifiers from another application in the credentials requests.  The bottom line was that you just need:

  

1.  An OAuth access token for the credentials API (which you can just ask AccountManager for)
    

1.  The string has\_permission=1 needs to be sent in the auth call \*one time\* only to trick Google into thinking your application has permission to request the scope.  Then, you don’t need it anymore and all other requests will succeed to return the access token.
    

3.  The credential ID to request (which you can get by listing all of the credentials IDs)
    
4.  The application android:// url, also referred to as the signonRealm (which you can get by listing all of the credentials IDs)
    
5.  An obfuscation key (which the caller supplies so you can reuse one or make up a new one)
    

  

I saw that every request included an OAUth access token.  So my first question was, where did that come from?  And what kind of scopes does that token have?  Scrolling back through the request interception log, I found lots of /auth requests that return all kinds of different OAUth tokens for different services.  The one that matched the credentials calls is this one that goes against a completely different service endpoint, android.clients.google.com:

  

POST /auth HTTP/1.1

device: 32e7a0507b8a3051

app: com.google.android.gms

Accept-Encoding: gzip

User-Agent: GoogleAuth/1.4 (generic\_x86 LMY48X); gzip

Content-Length: 526

content-type: application/x-www-form-urlencoded

Host: android.clients.google.com

Connection: close

device\_country=us&operatorCountry=us&lang=en\_US&sdk\_version=22&google\_play\_services\_version=8115270&system\_partition=1&has\_permission=1&service=oauth2%3Ahttps%3A%2F%2Fwww.googleapis.com%2Fauth%2Flogin\_manager&androidId=32e7a0507b8a3051&check\_email=1&Email=redacted%40gmail.com&app=com.google.android.gms&client\_sig=58e1c4133f7441ec3d2c270270a14802da47ba0e&callerPkg=com.google.android.gms&callerSig=58e1c4133f7441ec3d2c270270a14802da47ba0e&Token=oauth2rt\_1%2FFB8Iu0R9VsKw...\_sgfheVM0XT

RESPONSE:

HTTP/1.1 200 OK

Content-Type: text/plain; charset=utf-8

Cache-Control: no-cache, no-store, max-age=0, must-revalidate

Pragma: no-cache

Expires: Fri, 01 Jan 1990 00:00:00 GMT

Date: Wed, 13 Jan 2016 22:20:54 GMT

X-Content-Type-Options: nosniff

X-Frame-Options: SAMEORIGIN

X-XSS-Protection: 1; mode=block

Server: GSE

Connection: close

Content-Length: 175

Auth=ya29.aAK3TU....0vIKANwqI

issueAdvice=auto

Expiry=1452729234

storeConsentRemotely=0

isTokenSnowballed=0

  

The request includes an OAUth 2.0 scope of oauth2:[https://www.googleapis.com/auth/cclog](https://www.googleapis.com/auth/cclog) and includes what appears to be an OAUth 2.0 refresh token (Token=oauth2rt… above)  The response includes the access token that is able to use any of the credentials API calls.  What this indicates is that there is not a specific OAUth 2.0 grant or scope for retrieving credentials.

  

Okay, but I want to see how deep the rabbit hole \*really\* is.  Where does the OAUth 2.0 refresh token come from?  And what’s stopping just anyone from getting one?

  

Well, that turns out to be another /auth call much earlier (probably right after you add your google account) that gets a God-level OAUth token with these scopes:

  

services=mail,reader,cl,talk,groups2,notebook,analytics,alerts,ig,toolbar,youtube,lh2,wise,writely,pages,u2u,local,sprose,news,grandcentral,ah,android,wave,lso,goanna\_mobile,sierra,jotspot,hist,chromiumsync,multilogin,androidmarket,oz,webupdates,doritos,code,omaha,friendview

  

POST /auth HTTP/1.1

device: 32e7a0507b8a3051

app: com.google.android.gms

Accept-Encoding: gzip

User-Agent: GoogleAuth/1.4 (generic\_x86 LMY48X); gzip

Content-Length: 6091

content-type: application/x-www-form-urlencoded

Host: android.clients.google.com

Connection: close

  

androidId=32e7a0507b8a3051&device\_country=us&lang=en\_US&google\_play\_services\_version=8489000&sdk\_version=22&Email=redacted%40gmail.com&ACCESS\_TOKEN=1&droidguard\_results=CgZimH0iTnfYLotsaLotsaBase64StuffaAlnw&service=ac2dm&add\_account=1&Token=oauth2\_4%2F...Ra1OoyyolMgU

  

HTTP/1.1 200 OK

Content-Type: text/plain; charset=utf-8

Cache-Control: no-cache, no-store, max-age=0, must-revalidate

Pragma: no-cache

Expires: Fri, 01 Jan 1990 00:00:00 GMT

Date: Thu, 04 Feb 2016 23:06:18 GMT

X-Content-Type-Options: nosniff

X-Frame-Options: SAMEORIGIN

X-XSS-Protection: 1; mode=block

Server: GSE

Connection: close

Content-Length: 842

  

Token=oauth2rt\_1/4CEqSPIQvnWIQiC08EQ\_6ETjeT3lE47FYwBePJhaD

Auth=DQAAAAEBAAC5UGIeKbD801y...P7l1HnsGcPoyfUc4orQ

SID=BAD\_COOKIE

LSID=BAD\_COOKIE

services=mail,reader,cl,talk,groups2,notebook,analytics,alerts,ig,toolbar,youtube,lh2,wise,writely,pages,u2u,local,sprose,news,grandcentral,ah,android,wave,lso,goanna\_mobile,sierra,jotspot,hist,chromiumsync,multilogin,androidmarket,oz,webupdates,doritos,code,omaha,friendview

Email=redacted@gmail.com

GooglePlusUpdate=0

firstName=Foo

lastName=Bar

  

This article, "Sbktech: Inside the Android Play Service's magic OAuth flow." Last modified 01/27/2016 12:05:28. [https://sbktech.blogspot.com/2014/01/inside-android-play-services-magic.html](https://sbktech.blogspot.com/2014/01/inside-android-play-services-magic.html) (accessed 2/9/2016), goes into more detail on how Google Play Services OAuth2 flow works.  He refers to the refresh token as the “master token” stored in the AccountManager.  But, as you see in the request, an OAuth bearer token is used to request this master token.  Where did it come from?  

  

Going deeper down the rabbit hole, we find another request before this to get that first token that is a one-time use token.  This is a request that occurs when you first add an account onto your phone (and type your login/password and any 2FA token code).

  

POST /\_/signin/speedbump/embeddedsigninconsent?hl=en&\_reqid=454310&rt=j HTTP/1.1

Host: accounts.google.com

Connection: close

Content-Length: 549

X-Same-Domain: 1

Origin: https://accounts.google.com

Google-Accounts-XSRF: 1

User-Agent: Mozilla/5.0 (Linux; Android 5.1.1; Android SDK built for x86 Build/LMY48X) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/39.0.0.0 Mobile Safari/537.36 MinuteMaid

Content-Type: application/x-www-form-urlencoded;charset=UTF-8

Accept: \*/\*

Referer: https://accounts.google.com/embedded/setup/android?source=android&xoauth\_display\_name=Android%20Phone&tmpl=new\_account&ph=15555215554&imsi=310260000000000&lang=en&langCountry=en\_us&hl=en-US&cc=us

Accept-Encoding: gzip, deflate

Accept-Language: en-US

Cookie: GoogleAccountsLocale\_session=en; SID=DQAAABIBAABWmvlFeyN..y5ScYlW2UmvmFyK4iqI; LSID=DQAAABUBAAAiGKFoMO..3WdWqS\_wqbnC1xzoDo; HSID=AC5qKZ8mCKZ7m\_cop; SSID=Al-cgb..; APISID=s3gb7Fvr..fcjx4yP2A; SAPISID=uPpNe6g..mf3wm2T; ACCOUNT\_CHOOSER=AF..Ov2t0ESC\_qfXg; NID=75=Y6tBzgQEG..\_SoSw; GEM=CgptaW51dGVtYWlkEOninvSqKg==; GAPS=1:2liFPA..6yQmYZnIu; TC=AHnYQLziHv59FT0w..telN184UA==

X-Requested-With: com.google.android.gms

  

continue=https%3A%2F%2Faccounts.google.com%2Fo%2Fandroid%2Fauth%3Flang%3Den%26cc%26langCountry%3Den\_%26xoauth\_display\_name%3DAndroid%2BDevice%26source%3Dandroid%26tmpl%3Dnew\_account%26return\_user\_id%3Dtrue&f.req=%5B%22gf.siesic%22%2C1%2C%5B%5D%5D&azt=AFoagUV9..4627074412&deviceinfo=%5B%2232e7a0507b8a3051%22%2C22%2C8489000%2C%5B%2215555215554%22%5D%2Ctrue%2C%22US%22%2C0%2Cnull%2C%5B%5D%2C%22EmbeddedSetupAndroid%22%2Cnull%2C%5B0%2Cnull%2C%5B%5D%2Cnull%2Cnull%2C%2232e7a0507b8a3051%22%5D%2C2%5D&gmscoreversion=8489000&

  

And what you get back is..

  

HTTP/1.1 200 OK

Content-Type: application/json; charset=UTF-8

X-Frame-Options: DENY

Content-Disposition: attachment; filename="response.txt"

Cache-Control: no-cache, no-store, max-age=0, must-revalidate

Pragma: no-cache

Expires: Fri, 01 Jan 1990 00:00:00 GMT

Date: Thu, 04 Feb 2016 23:06:13 GMT

X-Content-Type-Options: nosniff

X-XSS-Protection: 1; mode=block

Server: GSE

Set-Cookie: GAPS=1:6civmAVIA..IUesG1t;Path=/;Expires=Sat, 03-Feb-2018 23:06:13 GMT;Secure;HttpOnly;Priority=HIGH

Set-Cookie: oauth\_token=oauth2\_4/terTCjHvqj..yyolMgU;Path=/;Secure;HttpOnly

Set-Cookie: TC=EXPIRED;Path=/;Expires=Mon, 01-Jan-1990 00:00:00 GMT;Secure

Set-Cookie: user\_id=12345;Path=/;Secure;HttpOnly

Alternate-Protocol: 443:quic,p=1

Alt-Svc: quic=":443"; ma=604800; v="30,29,28,27,26,25"

Connection: close

Content-Length: 52

  

)\]}'

  

\[\[\["gf.sisb",3,,\["gf.cr",1\]

\]

,\["e",2,,,69\]

\]\]

  

Now, there were actually several other requests and responses before and after this but this is the one that gets the gold.

  

What we have so far is that a legitimate application invoking the Smart Lock for Passwords APIs is actually communicating via IPC with Google Play Services.  Google Play Services then packages up and makes the actual REST API calls including its own OAUth tokens for the particular Google account selected.  Google Play Services interacts with one endpoint to do all of the OAUth token retrieval and another endpoint for all of the credentials API calls.

  

  

What if any OAuth access token an app obtains from Google for a Google user could be used to invoke the credentials API and steal that user’s credentials?  That would be an epic fail.  

  

Hypothesis #1:  Perhaps an application could use legitimate Google APIs to request an OAUth token for a user with a particular scope that may have access to invoke the credentials API.

  

I added some Java code to the sample application to request an OAUth token of varying kinds using the standard Google Play APIs.  Could I request a token with the magical set of scopes that would let me get a refresh token that could be used to retrieve credentials?

  

I created an AsyncTask that I could call with parameters to change what I’m requesting to get different types of tokens

  

private class GetOAuthTokenTask extends AsyncTask<Void, Void, String> {

  

Context mContext;

String mEmail;

String mScope;

  

AsyncResponse delegate \= null;

  

@Override

protected void onPostExecute(String result) {

delegate.processFinish(result);

       }

  

       GetOAuthTokenTask(Context context, String name, String scope, AsyncResponse delegate) {

this.mContext \= context;

this.mEmail \= name;

this.mScope \= scope;

this.delegate \= delegate;

       }

  

protected String doInBackground(Void... params) {

try {

// We can retrieve the token to check via

               // tokeninfo or to pass to a service-side

               // application.

String token = GoogleAuthUtil.getToken(mContext,

mEmail, mScope);

delegate.processFinish(token);

} catch (UserRecoverableAuthException e) {

// This error is recoverable, so we could fix this

               // by displaying the intent to the user.

e.printStackTrace();

} catch (IOException e) {

               e.printStackTrace();

} catch (GoogleAuthException e) {

               e.printStackTrace();

           }

return null;

       }

   }

}

  

interface AsyncResponse {

void processFinish(String result);

}

  

And I invoked this using a simple method in an Activity.  I ran it several times with different OAUth2 scopes to get different tokens with different scopes.  I definitely could not request certain types of scopes - androidScope and godScope and smartLockScope could not be requested via this mechanism.  There is a separate API endpoint servicing those that there’s no public API for.

  

How does Smart Lock get authorized?  Google Play Services obtains a specific OAUth token for those requests (that’s how I obtained the scope ID for Smart Lock for Passwords I used above) with the scope ID oauth2:https://www.googleapis.com/auth/login\_manager.  I tried other auth-related OAUth2 scopes that I saw being requested too.  Didn’t work.

  

private void getOauthToken(String email) {

// Retrieve the oAuth 2.0 access token.

final Context context = this.getApplicationContext();

// CANNOT run this on the main thread as it is synchronous and will block

String regularScope = "oauth2:" \+ Scopes.PROFILE \+ " " \+ Scopes.EMAIL \+ " openid";

// This doesn't work using the normal API.  This is a special scope sent for android auth to an android endpoint

   //String smartLockScope = "oauth2:https://www.googleapis.com/auth/login\_manager";

String godScope = "oauth2:mail reader cl talk groups2 notebook analytics alerts ig toolbar youtube lh2 wise writely pages u2u local sprose news grandcentral ah android wave lso goanna\_mobile sierra jotspot hist chromiumsync multilogin androidmarket oz webupdates doritos code omaha friendview";

String androidScope = "oauth2:android";

GetOAuthTokenTask task = new GetOAuthTokenTask(context, email, regularScope, this);

   task.execute();

}

  

Which results in requests like this:

  

POST /auth HTTP/1.1

device: 32e7a0507b8a3051

app: net.axley.smartlocktest

Accept-Encoding: gzip

User-Agent: GoogleAuth/1.4 (generic\_x86 LMY48X); gzip

Content-Length: 499

content-type: application/x-www-form-urlencoded

Host: android.clients.google.com

Connection: close

androidId=32e7a0507b8a3051&device\_country=us&lang=en\_US&google\_play\_services\_version=8489000&sdk\_version=22&request\_visible\_actions=&client\_sig=d477e865545527548650c180bfa0835df9cdbd87&callerSig=58e1c4133f7441ec3d2c270270a14802da47ba0e&Email=redacted%40gmail.com&service=oauth2%3Aprofile+email+openid&app=net.axley.smartlocktest&check\_email=1&token\_request\_options=CAA%3D&callerPkg=com.google.android.gms&Token=oauth2rt\_1%2F...Ja\_sgfheVM0XT

  

So that hypothesis didn’t pan out.  I couldn’t request a magic OAUth refresh token for Smart Lock for Passwords directly.  You get an INSUFFICIENT permission error.  I even intercepted the requests and replayed them as if I was Google Play Services by replacing client\_sig to match the com.google.android.gms callerSig and changed the app to com.google.android.gms.  Nada.

  

Hypothesis #2:  Could you use a regular OAUth token obtained by an application via the Google Play API to access the credentials API?   

  

I tried many different types of tokens, both tokens that were captured from various network interceptions that were used for mail, “doritos” and other interesting OAUth scopes.  These all started with ya29 which appears to be an access token prefix.  None of them were authorized to access the credentials API.  More INSUFFICIENT permission errors.

  

Hypothesis #3:  Could you use a regular OAUth token obtained by an application via the Google Play API as before and exchange it for a refresh token that would be accepted to access Smart Lock for Passwords credentials API?

  

I used Postman and Burp Suite to replay a number of the requests that obtained the Smart Lock OAUth scope using the master token and replaced the master token with various other scoped OAUth scoped access tokens (ya29 prefix).  None were authorized to access the API.  More INSUFFICIENT permission errors.

  

Hypothesis #4:  Could you spoof Google Play Services calls to make a request to obtain a new Smart Lock for passwords access token?

  

It turns out within a particular short timeframe of several minutes, I was able to send the request again:

  

POST /auth HTTP/1.1

device: 32e7a0507b8a3051

app: com.google.android.gms

Accept-Encoding: gzip

User-Agent: GoogleAuth/1.4 (generic\_x86 LMY48X); gzip

Content-Length: 526

content-type: application/x-www-form-urlencoded

Host: android.clients.google.com

Connection: close

device\_country=us&operatorCountry=us&lang=en\_US&sdk\_version=22&google\_play\_services\_version=8115270&system\_partition=1&has\_permission=1&service=oauth2%3Ahttps%3A%2F%2Fwww.googleapis.com%2Fauth%2Flogin\_manager&androidId=32e7a0507b8a3051&check\_email=1&Email=redacted%40gmail.com&app=com.google.android.gms&client\_sig=58e1c4133f7441ec3d2c270270a14802da47ba0e&callerPkg=com.google.android.gms&callerSig=58e1c4133f7441ec3d2c270270a14802da47ba0e&Token=oauth2rt\_1%2FFB8Iu0R9VsKw...\_sgfheVM0XT

  

And get a new access token that let me invoke the credentials API calls.  This makes perfect sense knowing that the oauth2rt token is a god-like master token that doesn’t expire.  

  

But as I already found in the other tests, this service requires a master token with the right scope or it won’t.  So, the attack scenario here would require compromise of your master token.  Once someone does that, they can do considerable damage as they “own” your Google account at that point.

  

Hypothesis #5: I wonder if any of the logcat log statements leak information that could be used to make credentials requests.

  
I searched and trolled through the logcat info and did not see any of the tokens or identifiers leak.  
  

Hypothesis #6: Could an application use the Android AccountManager to just _ask nicely_ for an auth token that would allow calling the credentials API?

  
I implemented some simple code to just ask for auth tokens of a particular scope, that being the oauth2:[https://www.googleapis.com/auth/login\_manager](https://www.blogger.com/#) scope that Smart Lock uses:  
  

private void getOauthTokenFromAccountManager() {

   AccountManager accountManager = AccountManager.get(getApplicationContext());

   Account\[\] accts = accountManager.getAccountsByType("com.google");

// Cheating for this example and using the first Google account found

Account acct = accts\[0\];

accountManager.getAuthToken(acct, "oauth2:https://www.googleapis.com/auth/login\_manager", false, new GetAuthTokenCallback(), null);

}

  

private class GetAuthTokenCallback implements AccountManagerCallback<Bundle> {

  

@Override

public void run(AccountManagerFuture<Bundle> accountManagerFuture) {

try {

           Bundle authTokenBundle = accountManagerFuture.getResult();

           String authToken = authTokenBundle.get(AccountManager.KEY\_AUTHTOKEN).toString();

           Log.d(LOGTAG, "Got token: " \+ authToken);

} catch (OperationCanceledException e) {

           e.printStackTrace();

} catch (IOException e) {

           e.printStackTrace();

} catch (AuthenticatorException e) {

           e.printStackTrace();

       }

   }

}

  

Which requires two additional permissions (not a problem):

  

<uses-permission android:name="android.permission.USE\_CREDENTIALS"/>

<uses-permission android:name="android.permission.GET\_ACCOUNTS"/>

  

And this is what was requested by the application (with **_no user intervention_**), along with the error response:  
  

POST /auth HTTP/1.1

device: 32e7a0507b8a3051

app: net.axley.smartlocktest

Accept-Encoding: gzip

User-Agent: GoogleAuth/1.4 (generic\_x86 LMY48X); gzip

Content-Length: 509

content-type: application/x-www-form-urlencoded

Host: android.clients.google.com

Connection: close

  

androidId=32e7a0507b8a3051&device\_country=us&lang=en\_US&google\_play\_services\_version=8489000&sdk\_version=22&client\_sig=d477e865545527548650c180bfa0835df9cdbd87&callerSig=58e1c4133f7441ec3d2c270270a14802da47ba0e&Email=jason.axley.testing%40gmail.com&service=oauth2%3Ahttps%3A%2F%2Fwww.googleapis.com%2Fauth%2Flogin\_manager&app=net.axley.smartlocktest&check\_email=1&token\_request\_options=CAA%3D&callerPkg=com.google.android.gms&Token=oauth2rt\_1%2FFB8Iu0...sgfheVM0XT

  

HTTP/1.1 400 Bad Request

Content-Type: text/plain; charset=utf-8

Cache-Control: no-cache, no-store, max-age=0, must-revalidate

Pragma: no-cache

Expires: Fri, 01 Jan 1990 00:00:00 GMT

Date: Wed, 10 Feb 2016 08:07:40 GMT

X-Content-Type-Options: nosniff

X-Frame-Options: SAMEORIGIN

X-XSS-Protection: 1; mode=block

Server: GSE

Connection: close

Content-Length: 19

  

Error=INVALID\_SCOPE

This causes an exception in the calling code. Hmm. The scope is identical to other requests. So, I replay the request in Burp Suite and try changing the client\_sig and app name to match Google Play - nothing. I notice another difference: has\_permission=1 in the URL. I try that with the request above, and it works!  

POST /auth HTTP/1.1

device: 32e7a0507b8a3051

app: net.axley.smartlocktest

Accept-Encoding: gzip

User-Agent: GoogleAuth/1.4 (generic\_x86 LMY48X); gzip

Content-Length: 509

content-type: application/x-www-form-urlencoded

Host: android.clients.google.com

Connection: close

  

androidId=32e7a0507b8a3051&device\_country=us&lang=en\_US&google\_play\_services\_version=8489000&sdk\_version=22&client\_sig=d477e865545527548650c180bfa0835df9cdbd87&callerSig=58e1c4133f7441ec3d2c270270a14802da47ba0e&Email=jason.axley.testing%40gmail.com&service=oauth2%3Ahttps%3A%2F%2Fwww.googleapis.com%2Fauth%2Flogin\_manager&app=net.axley.smartlocktest&check\_email=1&token\_request\_options=CAA%3D&callerPkg=com.google.android.gms&Token=oauth2rt\_1%2FFB8Iu0R9VsKw...fheVM0XT

  

HTTP/1.1 200 OK

Content-Type: text/plain; charset=utf-8

Cache-Control: no-cache, no-store, max-age=0, must-revalidate

Pragma: no-cache

Expires: Fri, 01 Jan 1990 00:00:00 GMT

Date: Wed, 10 Feb 2016 08:10:23 GMT

X-Content-Type-Options: nosniff

X-Frame-Options: SAMEORIGIN

X-XSS-Protection: 1; mode=block

Server: GSE

Connection: close

Content-Length: 411

  

Auth=ya29.hAKX4pC8...poz9Kzo1Pq8AqG8EHrtZmp

issueAdvice=auto

Expiry=1455095423

storeConsentRemotely=1

isTokenSnowballed=1

grantedScopes=https://www.googleapis.com/auth/login\_manager https://www.googleapis.com/auth/cclog https://www.googleapis.com/auth/userinfo.profile profile https://www.googleapis.com/auth/userinfo.email email https://www.googleapis.com/auth/plus.me openid

  

After doing that \*one time\* all future calls to request a token for this scope on this account \*succeed\* without exception.

  

Can I use this to dump creds?  Almost!

  

GET /credentials/v1/credentialGroups?alt=proto&header.playServicesVersion=8115000&mask.bestMatchCredential=true&mask.affiliationInfo=true&mask.isSyncRequest=true&mask.returnOriginSettings=true HTTP/1.1

Accept-Encoding: gzip

Authorization: OAuth ya29.hAKX4pC8...9Kzo1Pq8AqG8EHrtZmp

User-Agent: Mozilla 5.0 (Linux; U; Android 5.1.1; en\_US; Android SDK built for x86; Build/LMY48X); com.google.android.gms/8489270; FastParser/1.1; ApiaryHttpClient/1.0; (gzip) (generic\_x86 LMY48X); gzip

Host: www.googleapis.com

Connection: close

  

HTTP/1.1 403 Forbidden

Vary: Origin

Vary: X-Origin

Content-Type: application/json; charset=UTF-8

Date: Wed, 10 Feb 2016 08:24:23 GMT

Expires: Wed, 10 Feb 2016 08:24:23 GMT

Cache-Control: private, max-age=0

X-Content-Type-Options: nosniff

X-Frame-Options: SAMEORIGIN

X-XSS-Protection: 1; mode=block

Server: GSE

Alternate-Protocol: 443:quic,p=1

Alt-Svc: quic=":443"; ma=604800; v="30,29,28,27,26,25"

Connection: close

Content-Length: 498

  

{

 "error": {

  "errors": \[

   {

    "domain": "usageLimits",

    "reason": "accessNotConfigured",

    "message": "Access Not Configured. The API () is not enabled for your project. Please use the Google Developers Console to update your configuration.",

    "extendedHelp": "https://console.developers.google.com"

   }

  \],

  "code": 403,

  "message": "Access Not Configured. The API () is not enabled for your project. Please use the Google Developers Console to update your configuration."

 }

}

  

So close!  Of course the credentials API is not one listed on the developers console since it’s an internal Google API.  But if I could find a way to enable it for my application, I could actually then make use of the OAUth token that I requested (that didn’t require any user intervention).

  

In short, if a caller can inject has\_permissions=1 into the request that GMS makes just one time and if the caller can trick the Google developer console into enabling the credentials API for their app ID, then an attacker can make credentials API calls to steal all of the user’s passwords!

Observations
------------

1.  Smart Lock is not using OAUth scopes to constrain the data returned in the list credentials API.  This was alarming to me to see that there exists an API call that if you could intercept or invoke could dump the entire password store.  It would be better from a secure design perspective to have the API minimize the damage from an interception to only what is necessary.  Google Play Services could propagate the caller identity into the credentials API calls and use an app-specific OAUth token that would scope the data only to that application’s smart lock credentials.  That would make it much harder to attack Smart Lock because you wouldn’t even know what IDs and applications have stored credentials unless you happen to observe those API calls being made for those applications.
    
2.  I was able to simply ask the Android AccountManager for a Smart Lock login\_manager OAuth access token and get one by injecting has\_permission=1 into the request just one time.  I didn’t find a vulnerability yet to inject it programmatically, but I suspect possibly the app name could be a way to inject into the request.  The token was not accepted to access the credentials API as there is another check that the application with the client\_sig needs to be.  One way to possibly get past this would be to find a SHA-1 collision that lets you create a signing key with a chosen SHA-1 signature matching Google Play Services.  This is not yet feasible but may be in the near future.  Another way could be to inject the client\_sig parameter matching Google Play Services and hope that it will take precedence.  Potentially another way would be to find a vulnerability in the [Google Developers Console](https://console.developers.google.com) to enable the credentials API for a malicious app.  Bottom line:  the protections don’t appear to be strong enough.
    
3.  Just like in Google Chrome, Android and Google Play Services APIs will honor rogue root CA certificates installed (ignoring any certificate pinning) and allow a network MiTM to intercept their API calls.  The emulator does now present a warning notification that someone may be intercepting your traffic in modern versions of Android.   
    ![](/network-monitored-warning.png)  
    But I would expect Google to better protect their sensitive APIs from network interception via unconditional certificate pinning.
    
4.  Google is using bearer tokens all over the place - even in these credential, auth and security APIs.  Bearer tokens are kind of a security nightmare since they are able to be used for many, many requests and are repeated on just about every API call, giving bad guys lots of opportunities for interception.  Amazon at least requires [digital signature verification](https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html) (proof of possession of a credential) for its API requests and Google should really do this to make it way harder to obtain the secrets.
    
5.  The Smart Lock API not being an authenticated API means it has to rely on the platform security entirely (as all of AccountManager and Google Play Services do).  Any compromise of the platform security (rooting the phone, exploiting a vulnerability) could be devastating.
    
6.  The Smart Lock API runs fine on the Emulator.  I wonder if it would run if the [Google Safety Net API](https://developer.android.com/training/safetynet/index.html) would warn the user or prevent the credentials calls from being made on a possibly compromised device?  Would seem to be a reasonable risk mitigation.
    
7.  I can replay the requests many times to retrieve credentials by ID.  There is no nonce or anti-replay protection built in (other than the limited lifetime of the access tokens used - on the order of minutes at least - I didn’t test what the timeout was).  The lack of digital signature verification also means that a network MiTM has all of the information to make new requests with impunity.  A MiTM who can monitor requests and responses could of course just steal the data from the response.
    
8.  As noted, OAuth access tokens used for Smart Lock fortunately have a limited lifetime so you won’t be able to replay requests forever unless you obtain a new OAuth access token.
    
9.  The minimal information you need to make a successful credentials API call is:
    

1.  An OAuth access token for the credentials API (not so difficult to obtain)
    
2.  The credential ID to request (which you can get by listing all of the credentials IDs via the credentialGroups API)
    
3.  The application android:// url, also referred to as the signonRealm (which you can get by listing all of the credentials IDs via the credentialGroups API)
    
4.  An obfuscation key (which the caller supplies so you can reuse one or make up a new one)
    

11.  The OAUth scope Google Play uses for the credentials API allows modifying and adding credentials as well as retrieving them.  I was able to invoke the API with the Bearer token and store arbitrary data in Smart Lock outside of Google Play Services.  Fun way to hide data!
    

Summary
-------

The Smart Lock For Passwords design relies entirely on the secrecy of your Google account master token (and on the secrecy of the credential IDs and application url/signonRealm).  Any compromise of that master token can lead to complete compromise of any stored passwords in Smart Lock.  I found the implementation itself to be implemented well and Google’s OAuth2 enforcement in their APIs to be annoyingly good.  Another troubling discovery is how easy it could be for any application to just simply ask for a Smart Lock OAuth scope access token and get it with \*no user intervention\* if they simply can inject query parameters into the request.  This gets you almost able to query the API.  If you can also inject the caller\_sig into the request, you could possibly spoof Google Play Services and get the request accepted.

  

However, I have a big concern that the Smart Lock credentials API could be changed to minimize the damage that could be done.  For me, this is concerning enough that I would not recommend using it for storing sensitive information.  Google should not have an API that will divulge all of the secret identifiers that can be used to enumerate every password for every application stored in Smart Lock.  The API should constrain the returned data to only the application requesting it to minimize opportunity for disclosure of that information (aperture minimization, as well as Least Privilege principle).  The APIs could be strengthened to make use of digital signature proof-of-possession authentication rather than repeating Bearer tokens that are more susceptible to be stolen by many different threat vectors.

  

Furthermore, there are some mobile security practices that Google could implement to further mitigate risk.  They could detect and/or prevent MiTM interception of their security sensitive APIs through certificate pinning and MiTM detection.  And for risks to the data on the device itself, they could probably use the SafetyNet API to inform the system whether to trust the platform integrity enough to invoke the sensitive API calls to obtain credentials API tokens and extract Smart Lock credentials.  

ObfuscationKey
--------------

  

I didn’t forget about the obfuscationKey.  That is aptly named because the caller supplies a key that the Google credentials API uses to encrypt the user’s passwords stored in Smart Lock.  Obviously, any network MiTM has both the key and encrypted data so could just decrypt the data.  It’s to keep it away from prying eyes, whether in server-side logs or client-side logcat.  They even use AES in ECB mode to make sure nobody takes it seriously as a security mechanism.  I wrote a simple [python script](https://gist.github.com/jaxley/1b7f0304d008c88463dc) that can decrypt the passwords easily enough.