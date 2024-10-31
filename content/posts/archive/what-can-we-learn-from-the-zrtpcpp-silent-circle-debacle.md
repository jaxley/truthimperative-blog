---
title: What can we learn from the ZRTPCPP / Silent Circle debacle?
date: 2013-07-02T23:37:00.001-07:00
published: true
url: /2013/07/what-can-we-learn-from-zrtpcpp-silent.html
tags:
  - security
  - post
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:43-07:00

---07:00
---

As a way of background, Phil Zimmerman's company [Silent Circle](https://silentcircle.com/) became wildly successful recently after Snowden's disclosures of extensive NSA data collection of telephony "metadata" and "data — including e-mails, videos, pictures, and connection logs — from the main servers of Microsoft, Google, Apple, and other leading U.S. tech companies" (1). "Mike Janke, one of the founders, estimated that the number of new customers for its subscription-based service surged by 400 percent" (2)  
  
[Mark Dowd](https://twitter.com/mdowd) from Azimuth Security "decided to take a brief look at the GNU ZRTPCPP library ([https://github.com/wernerd/ZRTPCPP](https://github.com/wernerd/ZRTPCPP)), which is a core security component of various secure phone solutions (perhaps most notably, the impressive SilentCircle suite of applications)." (3) He found several disturbing vulnerabilities in this library, including heap overflows, stack overflows, etc. that can lead to remote code execution or crashing the application.  Additionally, [Matthew Green](https://twitter.com/matthew_d_green) found an [implementation issue](https://github.com/wernerd/ZRTPCPP/issues/7) after a casual review.  
  
Several applications use the same library, but most are open source free software applications.  Silent Circle, however, is a commercial venture started by PGP's Phil Zimmerman.  And commercial entities, especially offering a service and product set completely geared toward security and privacy should probably be expected to have an application security program and sufficient tooling and resources to validate and vet its wares.  And they claimed to have had done this.  However, due to the glaring bugs that were identified in the ZRTPCPP library that they mainly funded development of through its author, [Werner Dittman](https://github.com/wernerd), it is clear that their controls program to ensure security of their product is wholly inadequate and they admit as much  

> "\[W\]e audit and test our own work and pay others to audit and test it for us. Obviously, in this case, the auditing failed. It was my understanding that all of the libraries that we used were audited, as well as all of our own code. The fact that these problems were missed suggests that there is a problem with the auditing process, that either not all of the third party libraries were audited or that somehow the auditing was not rigorous. Besides developing, testing and deploying these fixes, we will also be looking into the process." (4)

When I learned the details, I wondered what can other entities that either have application security programs in place (or should) learn from this?  

1.  Even security software companies make mistakes and imperil security -- sometimes they make some [doozies](https://funoverip.net/2013/06/mcafee-epolicy-0wner-preview/)

So, don't assume that because a company has a security stalwart like Phil Zimmerman or that it's in the security business that it is immune from the software security problems most everyone in every organization is dealing with.

1.  Open source does allow for "more eyes" to potentially make "all bugs...shallow" but it's not a guarantee.  "open source _can_ be reviewed by more people than proprietary software, but I don’t think it _is_ reviewed by more people than proprietary software." (5)

ZRTPCPP code had these bugs for roughly 6 years before they were found, and there were not just security bugs but double-increment bugs in loops and other issues. Third-party dependencies need to be evaluated as part of your threat model and the same scrutiny needs to be applied as you would to your own code. Probably even more so as you also need to consider other non-technical issues with each such as third-party viability, responsiveness, etc.  

1.  Use static analysis!

Several of these bugs are trivial for static analysis tools to find. For C++ code, there's even the [clang](https://clang-analyzer.llvm.org/) analyzer that is open source.  This should be part of the build process and findings validated and hopefully fixed prior to release.  

1.  Trust, but verify your application security controls

So, you paid a chunk of change to an external party to vet your code for security issues and you got a clean bill of health.  That means you can rest easy, right?  Not necessarily.  Absence of evidence is not evidence of absence.  There are myriad reasons that an external assessment did not yield results.  It could have been that the tester had inadequate experience or perhaps was not thorough enough or was just plain incompetent -- all would yield equally "impressive" results.  Ideally, you should be vetting your external partners to ensure they are able to catch flaws.  You could even purposefully include code with known issues as a test.

1.  Write unit tests -- and ensure they execute as part of every build.

How can you trust code without any unit tests, or if the tests are not continuously executed to guard against new bugs being introduced, especially code that needs to accept arbitrary untrusted inputs that can be malformed in myriad ways?  Looking at the [github repository](https://github.com/wernerd/ZRTPCPP) for the library, I see lots of application C++ code, but I don't see any folder with "test" in it. I see a couple of files in the "demos" directory with "test" in the name, but based on their function and the README, they are examples of how to use the code, not defensive tests ensuring the correct functioning of the implementation (which should include both happy path cases and negative/boundary cases).  
  
Even if you're the best coder in the world and think you don't need tests, what about the next person to make a change to your code or the team that inherits your code for maintenance who lacks your skill and familiarity?  How can you ensure correct, safe operation now and in the future without code to check your code?  What if an implementation (or security) bug is found in your code?  How do you validate your fix works?  How do you ensure that the same issue doesn't get re-introduced later?  Unit tests can do all of this for you while you sleep and your continuous integration (CI) build runs.  
  
Security software needs to be the leader in this.  If those in infosec can't write secure software and follow secure development pracices, what are the chances for the rest of us?  

1.  Fuzz your network code. (and fuzz your other code as well)

This could be a corollary of the unit test recommendation. Code expecting untrusted inputs from outside should be fuzzed with random inputs and boundary conditions to validate your parsing and buffering code is sufficiently robust against active attacks. Fuzzing can help find other test cases that your unit tests may not be covering. If you find anything -- fix it -- and write a unit test for it so you will ensure that your code will remain immune to that issue in the future.  

  

(1) "NSA Reportedly Mines Servers Of U.S. Internet Firms For Data : The Two-Way : NPR." Last modified 07/03/2013 04:04:55. [https://www.npr.org/blogs/thetwo-way/2013/06/06/189321612/nsa-reportedly-mines-servers-of-u-s-internet-firms-for-data](https://www.npr.org/blogs/thetwo-way/2013/06/06/189321612/nsa-reportedly-mines-servers-of-u-s-internet-firms-for-data) (accessed 7/2/2013).

(2) "Startup sees boost in business following news of NSA surveillance - Washington Business Journal." Last modified 07/03/2013 04:06:02. [https://www.bizjournals.com/washington/blog/techflash/2013/06/startup-sees-boost-in-business.html](https://www.bizjournals.com/washington/blog/techflash/2013/06/startup-sees-boost-in-business.html) (accessed 7/2/2013).  
(3) "Azimuth Security: Attacking Crypto Phones: Weaknesses in ZRTPCPP." Last modified 07/02/2013 13:28:12. [https://blog.azimuthsecurity.com/2013/06/attacking-crypto-phones-weaknesses-in.html](https://blog.azimuthsecurity.com/2013/06/attacking-crypto-phones-weaknesses-in.html) (accessed 7/2/2013).  
(4) "Impact of ZRTP library critical security vulnerabilities · Issue #5 · SilentCircle/silent-phone-base · GitHub." Last modified 07/03/2013 04:38:41. [https://github.com/SilentCircle/silent-phone-base/issues/5#issuecomment-20232374](https://github.com/SilentCircle/silent-phone-base/issues/5#issuecomment-20232374) (accessed 7/2/2013).  
(5) " Microsoft’s Many Eyeballs and the Security Development Lifecycle - Thinking About Security - Site Home - MSDN Blogs ." Last modified 07/03/2013 04:52:27. [https://blogs.msdn.com/b/shawnhernan/archive/2010/02/13/microsoft-s-many-eyeballs-and-the-security-development-lifecycle.aspx?Redirected=true](https://blogs.msdn.com/b/shawnhernan/archive/2010/02/13/microsoft-s-many-eyeballs-and-the-security-development-lifecycle.aspx?Redirected=true) (accessed 7/2/2013).  
(6) "What Happened With ZRTP This Week | Silent Circle Blog." Last modified 07/03/2013 05:10:20. [https://silentcircle.wordpress.com/2013/06/29/what-happened-with-zrtp-this-week/](https://silentcircle.wordpress.com/2013/06/29/what-happened-with-zrtp-this-week/) (accessed 7/2/2013).