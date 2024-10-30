---
title: Ios Clients Not Vulnerable To Heartbleed What Does The Source Say
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:58:00-07:00
tags:
  - security
  - apple
  - ios
  - mobile
  - post
date: 2014-04-17T15:05:00.001-07:00
published: true
url: /2014/04/ios-clients-not-vulnerable-to.html
aliases:
  - Ios-clients-not-vulnerable-to-heartbleed-what-does-the-source-say
linter-yaml-title-alias: Ios-clients-not-vulnerable-to-heartbleed-what-does-the-source-say
---


![](/heartbleed.png)
  
Apple's language in their assertion that they are not vulnerable to heartbleed on iOS are troubling as they specifically say (via [ReCode](http://recode.net/2014/04/10/apple-says-ios-osx-and-key-web-services-not-affected-by-heartbleed-security-flaw/)), "IOS and OS X never incorporated the vulnerable software..."  However, not incorporating the vulnerable OpenSSL software is merely one way that their customers could have been made vulnerable.  What about the Apple SSL/TLS implementation?  Has anyone checked it?  Did they incorporate [RFC 6520](https://tools.ietf.org/html/rfc6520) for heartbeat support?  I couldn't find anything Google so figured I would share what I found.  
  
Since the Apple SSL library code is open sourced, we can actually look at the code.  And based on my read of the code, Apple doesn’t even implement the heartbeat extension. [http://opensource.apple.com/source/Security/Security-55471/libsecurity\_ssl/lib/sslHandshake.h](http://opensource.apple.com/source/Security/Security-55471/libsecurity_ssl/lib/sslHandshake.h) doesn’t even define the [heartbeat helloextension code 15](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#tls-extensiontype-values-1) in the data structure:  
  
```
/\* Hello Extensions per RFC 3546 \*/
typedef enum
{
 SSL\_HE\_ServerName = 0,
 SSL\_HE\_MaxFragmentLength = 1,
 SSL\_HE\_ClientCertificateURL = 2,
 SSL\_HE\_TrustedCAKeys = 3,
 SSL\_HE\_TruncatedHMAC = 4,
 SSL\_HE\_StatusReguest = 5,

 /\* ECDSA, RFC 4492 \*/
 SSL\_HE\_EllipticCurves  = 10,
 SSL\_HE\_EC\_PointFormats = 11,

    /\* TLS 1.2 \*/
    SSL\_HE\_SignatureAlgorithms = 13,

    /\* RFC 5746 \*/
    SSL\_HE\_SecureRenegotation = 0xff01,

 /\*
  \* This one is suggested but not formally defined in
  \* I.D.salowey-tls-ticket-07
  \*/
 SSL\_HE\_SessionTicket = 35
} SSLHelloExtensionType;
```  
Then in the implementation [http://opensource.apple.com/source/Security/Security-55471/libsecurity\_ssl/lib/sslHandshakeHello.c](http://opensource.apple.com/source/Security/Security-55471/libsecurity_ssl/lib/sslHandshakeHello.c), they actually only support one extension, SSL\_HE\_SecureRenegotation. All others return an error code.  
  
```
     switch (extType) {
            case SSL\_HE\_SecureRenegotation:
                if(got\_secure\_renegotiation)
                    return errSSLProtocol;            /\* Fail if we already processed one \*/
                got\_secure\_renegotiation = true;
                SSLProcessServerHelloExtension\_SecureRenegotiation(ctx, extLen, p);
                break;
            default:
                /\*
                 Do nothing for other extensions. Per RFC 5246, we should (MUST) error
                 if we received extensions we didnt specify in the Client Hello.
                 Client should also abort handshake if multiple extensions of the same
                 type are found
                 \*/
                break;
        }
```So, it appears from the library code that they would not be vulnerable to this bug at all.