---
title: Biometrics In Atms
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - security
  - post
date: 2005-10-30T01:48:00.000-07:00
published: true
url: /2005/10/biometrics-in-atms.html
aliases:
  - Biometrics-in-atms
linter-yaml-title-alias: Biometrics-in-atms

----atms
---


[InformationWeek > Biometric Security > Privacy Concerns, Expense Keep Biometrics Out Of U.S. ATMs > October 12, 2005](http://www.informationweek.com/story/showArticle.jhtml?articleID=172300391&cid=RSSfeed_IWK_news "InformationWeek > Biometric Security > Privacy Concerns, Expense Keep Biometrics Out Of U.S. ATMs > October 12, 2005")  
  
This article is chock full of fun things to comment on.  
  

>   
> Ricardo Prieto, who was vice president for system operations at BanCafe when the system was installed, said that at first ATMs failed to recognize fingerprints on the well-worn hands of some elderly customers and laborers such as construction workers.  
>   
> He said the ATM imaging was improved, and the number of customers whose fingerprints couldn't be read fell from 30 percent to 8 percent.  

  
  
Wow, that is great progress! Now for a large bank, only 2 million instead of 7.5 million customers will not be able to use my bank's ATMs! Where do I sign?  
  

>   
> "Biometrics is certainly the most secure form of authentication," said Avivah Litan, an analyst with Gartner Inc., a Stamford, Conn.-based technology analysis firm. "It's the hardest to imitate and duplicate."  

  
  
He's right. It is [very](http://www.schneier.com/crypto-gram-0205.html#5) [difficult](http://www.theregister.co.uk/2002/05/23/biometric_sensors_beaten_senseless/) to "imitate and duplicate" biometrics in ways that could fool sensors.  
  
I also would argue that biometrics is not the most secure form of authentication. Smart cards and tokens are hard to imitate and duplicate and this isn't even a threat model to be concerned about in general because in practice, nobody uses this factor as the only factor. These are used as part of a two-factor authentication system, which is really a much more secure form. For some bizarre reason, biometric holy-grail folks (mostly vendors, I imagine) think that biometrics don't need a second factor. Additionally, there is a nonzero False Acceptance Rate and False Reject Rate (as noted beautifully above) that make biometrics fail in many real world scenarios. Smart cards don't have that problem.  
  

>   
> "The real holy grail in biometrics," said Jim Block, Diebold's director of global advanced technology, "is let's get rid of the PIN so no one has anything to steal anymore."  

  
  
Let's think about that for a minute. Let's ignore for a moment that this came from Diebold, a [foremost authority](http://www.bbvforums.org/cgi-bin/forums/board-auth.cgi?file=/1954/6805.html) in [voting security](insecurity). He claims that without a PIN, there would be [nothing to steal anymore](http://news.bbc.co.uk/2/hi/asia-pacific/4396831.stm). Really?  
  
Actually, having a PIN or another [second factor](http://en.wikipedia.org/wiki/Two_Factor_Authentication) can help to thwart these kinds of "steal the biometric" attacks since the biometric by itself is rendered useless. It certainly won't eliminate the threat, but I think it would reduce the likelihood that someone would violently extract the biometric to steal something since they need you alive anyhow to get the PIN or password.