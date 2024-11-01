---
title: Rant On Oracle Just Not Quot Getting It Quot-
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:56:49-07:00
tags:
  - security
  - post
date: 2005-10-11T17:03:00.000-07:00
published: true
url: /2005/10/rant-on-oracle-just-not-it.html
aliases:
  - Rant-on-oracle-just-not-quot-getting-it-quot-
linter-yaml-title-alias: Rant-on-oracle-just-not-quot-getting-it-quot-
---


Funny and entertaining and sad rant about Oracle's inability to do security in stark contrast to public claims by their CSO, marketing, etc.  
  
This has inspired others to note how there are some Oracle vulnerabilities that have been open for 768 days!! among other comments. Oracle even tried to put the cat back in the bag on some other disclosed vulnerabilities recently. They just don't get it. I'm wondering if Larry Ellison were in Bill Gate's place just how much worse off the Internet and world would be from a security perspective.  
  

>   
> \---------- Forwarded message ----------  
> From: David Litchfield  
> To: bugtraq@private, ntbugtraq@private  
> Date: Thu, 6 Jan 2005 16:01:26 -0000  
> Subject: Opinion: Complete failure of Oracle security response and utter neglect  
> of their responsibility to their customers  
>   
> Dear security community and Oracle users,  
>   
> Many of my customers run Oracle. Much of the U.K. Critical National  
> Infrastructure relies on Oracle; indeed this is true for many other  
> countries as well. I know that there's a lot of private information  
> about me stored in Oracle databases out there. I have good reason,  
> like most of us, to be concerned about Oracle security; I want Oracle  
> to be secure because, in a very real way, it helps maintain my own  
> personal security. As such, I am writing this open letter  
>   
> Extract from interview between Mary Ann Davidson and IDG  
> [https://www.infoworld.com/article/05/05/24/HNoraclesecurityhed\_1.html](https://www.infoworld.com/article/05/05/24/HNoraclesecurityhed_1.html)  
>   
> IDGNS: "What other advice do you have for customers on security?"  
>   
> Davidson: "Push your vendor to tell you how they build their software  
> and ask them if they train people on secure coding practices. "  
>   
> Now some context has been put in place I can continue.  
>   
> On the 31st of August 2004, Oracle released a security update (Alert  
> 68 \[ [https://www.oracle.com/technology/deploy/security/pdf/2004alert68.pdf](https://www.oracle.com/technology/deploy/security/pdf/2004alert68.pdf) \])  
> to address a large number of major security flaws in their database  
> server product. The patches had been a long time in coming  
> \[ [https://www.eweek.com/article2/0,1759,1637213,00.asp](https://www.eweek.com/article2/0,1759,1637213,00.asp) \] and we fully  
> expected that these patches would actually fix the problems but,  
> unfortunately this is not the case. To date, these flaws are still not  
> fixed and are still fully exploitable. I reported this to Oracle a  
> long time ago.  
>   
> The real problem with this is not that the flaws Alert 68 supposedly  
> fixed are still exploitable, but rather the approach Oracle took in  
> attempting to fix these issues. One would expect that, given the  
> length of time they took to deliver, these security "fixes" would be  
> well considered and robust; fixes that actually resolve the security  
> holes. The truth of the matter though is that this is not the case.  
>   
> Some of Oracle's "fixes" simply attempt to stop the example exploits I  
> sent them for reprodcution purposes. In other words the actual flaw  
> was not addressed and with a slight modification to the exploit it  
> works again. This shows a slapdash approach with no real consideration  
> for fixing the actual problem itself.  
>   
> As an example of this, Alert 68 attempts to fix some security holes in  
> some triggers; the flaws could allow a low privileged user to gain SYS  
> privileges - in other words gain full control of the database server.  
> The example exploit I sent to Oracle contained a space in it. Oracle's  
> fix was to ignore the user's request if the input had a space. What  
> Oracle somehow failed to see or grasp was that no space is needed in  
> the exploit. This fix suggests no more than a few minutes of thought  
> was given to the matter. Why did it take 8 months for this? Further,  
> how on earth did this get through QA? More, why are we still waiting  
> for a proper fix for this?  
>   
> Here is another class of thoughtless "fix" implemented by Oracle in  
> Alert 68. Some Oracle PL/SQL procedures take an arbitrary SQL  
> statement as a parameter which is then executed. This can present a  
> security risk. Rather than securing these procedures properly Oracle  
> chose a security through obscurity mechanism. To be able to send the  
> SQL query and have it executed one needs to know a passphrase. This  
> passphrase is hardcoded in the procedure and can be extracted with  
> ease. So all an attacker needs to do now is send the passphrase and  
> their arbitrary SQL will still be executed.  
>   
> In other cases Oracle have simply dropped the old procedures and added  
> new ones - with the same vulnerable code!  
>   
> I ask again, why does it take two years to write fixes like this?  
> Perhaps the fixes take this long because Oracle pore through their  
> code looking for similar flaws? Does the evidence bear this out. No -  
> it doesn't. In those cases where a flaw was fixed properly, we find  
> the same flaw a few lines further down in the code. The DRILOAD  
> package "fixed" in Alert 68 is an example of this; and this is not an  
> isolated case. This is systemic. Code for objects in the SYS, MDSYS,  
> CTXSYS and WKSYS schemas all have flaws within close range of "fixed"  
> problems. These should have been spotted and fixed at the time.  
>   
> I reported these broken fixes to Oracle in February 2005. It is now  
> October 2005 and there is still no word of when the "real" fixes are  
> going to be delivered. In all of this time Oracle database servers  
> have been easy to crack - a fact Oracle are surely aware of.  
>   
> What about the patches since Alert 68 - the quarterly Critical Patch  
> Updates? Unfortunately it is the same story. Bugs that should have  
> been spotted left in the code, brand new bugs being introduced and old  
> ones reappearing.  
>   
> This is simply NOT GOOD ENOUGH. As I stated at the beginning of this  
> letter, I'm concerned about Oracle security because it impinges upon  
> me and my own personal security.  
>   
> What is apparent is that Oracle has no decent bug  
> discovery/fix/response process; no QA, no understanding of the  
> threats; no proactive program of finding and fixing flaws. Is anyone  
> in control over at Oracle HQ?  
>   
> A good CSO needs to more than just a mouthpiece. They need to be able  
> to deliver and execute an effective security strategy that actually  
> deals with problems rather than sweeping them under the carpet or  
> waste time by blaming others for their own failings. Oracle's CSO has  
> had five years to make improvements to the security of their products  
> and their security response but in this time I have seen none. It is  
> my belief that the CSO has categorically failed. Oracle security has  
> stagnated under her leadership and it's time for change.  
>   
> I urge Oracle customers to get on the phone, send a email, demand a  
> better security response; demand to see an improvement in quality.  
> It's important that Oracle get it right. Our national security depends  
> on it; our companies depend on it; and we all, as individuals depend  
> on it.  
>   
> Cheers,  
> David Litchfield