---
title: Reversing Android Aidl
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:21-07:00
tags:
  - post
date: 2021-05-19T15:32:00.000-07:00
published: false
url: 
aliases:
  - Reversing-android-aidl
linter-yaml-title-alias: Reversing-android-aidl

----aidl
---


Recently it came up at work what would be required if you had a known Android application that communicates with another application via an AIDL Binder service (aka Bound Service) and you wanted to build another application that talked to the same AIDL service.  Most Android tutorials on friendly Android Bound Services using AIDL seem to neglect that for cases where you want authorized applications to talk to your AIDL service, you should share your AIDL file with that client application so that the IDE can work its magic and create the interfaces and types for casting the service instances that the client can invoke.  But what if you didn't have the source code or the AIDL files?  Can you still connect to the service from another application?  
  
Maybe.  
  
If the Binder service is not properly protected by appropriate permissions and permission checks, then yes you can.  [Google recommends](https://developer.android.com/training/articles/security-tips.html#Services) that you perform the appropriate security checks on the caller as fine grained as necessary to validate the identity and access rights of the caller.  
  
One misconception about AIDL seems to be that secrecy of the AIDL interface is somehow part of the security so unless you can reverse the AIDL, you can't build an interoperable client.  But, that isn't true.  
  
Reading Google's own documentation on AIDL,  

> "When you build each application that contains the `.aidl` file, the Android SDK tools generate an `[IBinder](https://developer.android.com/reference/android/os/IBinder.html) `interface based on the `.aidl` file and save it in the project's `gen/` directory" \[1\]

What this says to me is that the SDK generates some code that gets compiled into the application that does all of the binder magic of marshalling and unmarshalling IPC communications.  I wanted to investigate just how difficult it would be to reverse a published application to steal the bits needed to communicate with the service instance.  
  
I built an example client and server application that does just this on GitHub [https://github.com/jaxley/AidlExamples/](https://github.com/jaxley/AidlExamples/)  The AidlServer application implements a service using AIDL. The AidlClient application does what an authorized client app would do - it includes the AIDL file from the service and the SDK generates the appropriate code to work the AIDL magic.  I then created an AidlClient\_Mallory that actually uses a fixed version of decompiled Java code from AidlServer to communicate with the AidlServer IGreetingService service.  
  
In-line with [Kerckhoffs' principle](https://en.wikipedia.org/wiki/Kerckhoffs's_principle) (don't rely on security through obscurity), the security of Android Binder services rests on the same permissions model as the rest of Android.  If the binder is exposed via a Service instance, then your first line of defense available is to define a permission on the service in the manifest.  This provides a very coarse level of access control.  If you require more fine-grained permission checks for specific service calls, you need to build those checks into your service.  
  
TODO: implement permission version of the service with fine-grained checks  
  
\[1\] "Android Interface Definition Language (AIDL) | Android Developers." Last modified 07/02/2014 05:33:55. [https://developer.android.com/guide/components/aidl.html](https://developer.android.com/guide/components/aidl.html) (accessed 7/1/2014).