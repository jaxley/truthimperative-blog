---
title: Information Warfare Via Url Shorteners
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:59:02-07:00
tags:
  - security
  - post
date: 2013-09-18T23:21:00.001-07:00
published: true
url: /2013/09/information-warfare-via-url-shorteners.html
aliases:
  - Information-warfare-via-url-shorteners
linter-yaml-title-alias: Information-warfare-via-url-shorteners
---


As I've used Twitter more, I've noticed how many of the shared URLs are shortened. And to think that the Library of Congress is [archiving all US tweets](http://www.businessinsider.com/library-of-congress-is-archiving-all-of-americas-tweets-2013-1), how many will actually be usable at some point in the future? Hopefully their process logs the resolved actual URL instead of the shortened one. When I restored my blog, it was amazing how many broken links I found. I stopped fixing them. That's just the regular web. Adding URL shortening is another level of indirection that is also another failure point.  
  
As an information security guy, there's another downside and that is just how secure are the shortened URLs now and long into the future from malicious redirection, including [information warfare](http://www.fas.org/irp/eprint/snyder/infowarfare.htm)? Shortened URLs give a single entity enormous power into the future to do some pretty bad stuff. And I was wondering about the choice of Top-Level Domains (TLDs) that are used for URL shortening services. Just how stable are those politically? What kind of information warfare opportunities are there? Which URL shorteners have better security properties given all of the possible attack vectors?  How powerful a political statement would it be if all of the shortened URLs were replaced by a political statement or terrorist threat for almost everything referenced on Twitter?  You'd be able to gather a lot of eyeballs and press by doing that to get your message out.  

*   bit.ly and ow.ly - both very popular on Twitter (as well as several others using .ly). The LY top-level domain is controlled by [Libya](http://www.nic.ly/). I can't see a problem with them controlling where my links go now or sometime in the future, do you? Information warfare, anyone? [Libya](http://travel.state.gov/travel/cis_pa_tw/tw/tw_5992.html) is on the US State Department's list of travel warnings, with this summary of the stability of the region, "The security situation in Libya remains unpredictable. Sporadic episodes of civil unrest have occurred throughout the country." 
*   su.pr - Stumbleupon's url shortener service. The PR TLD is [Puerto Rico](https://www.nic.pr/index.asp), an unincorporated US territory. So it probably would be more likely to have reasonable protection from information warfare except of course at the behest of our [own US government](https://www.eff.org/nsa-spying). 
*   cli.gs - this shortener service [got hacked in 2009](http://thenextweb.com/2009/06/16/popular-url-shortener-cligs-hacked/).  The GS TLD is for [South Georgia & South Sandwich Islands](http://nic.gs/), which is a British territory, so presumably it is relatively stable and western-friendly.
*   goo.gl - a newer entrant, run by Google. The GL TLD is [Greenland](http://www.nic.gl/bin/view/Main/), which is part of the Kingdom of Denmark.  Interestingly, Denmark is "frequently ranked as the happiest country in the world in cross-national studies of happiness", [Wikipedia](https://en.wikipedia.org/wiki/Denmark)
*   is.gd - A service that has an interesting terms of service about being an [ethical URL shortener](http://is.gd/ethics.php). The GD TLD is actually [Grenada](http://nic.gd/) The world bank publishes XML data apparently that includes probability of political instability/terrorism for various countries, including [Grenada](http://www.quandl.com/WORLDBANK-World-Bank/GRD_PV_EST-Grenada-Political-Stability-and-Absence-of-Violence-Terrorism-Estimate). The current data shows a measure of the [Political Stability and Absence of Violence (PV)](http://info.worldbank.org/governance/wgi/faq.htm) – "capturing perceptions of the likelihood that the government will be destabilized or overthrown by unconstitutional or violent means, including politically-motivated violence and terrorism." of 0.44. However, the USA's data is continuing up and also has a 0.54. Earlier this year, the .gd domain and two others were also [hijacked](http://domainincite.com/12238-confusion-reigns-over-three-hijacked-cctlds) due to a dispute over control ov"er the TLDs. 
*   tr.im - a shortening service that shut down in 2009 (but appears to possibly be back?) 

Given these factors, I'd first suggest you run your own shortener service if you want full control and assurance of longevity (assuming you can build and operate such a thing securely).  But if you had to pick a service, I'd go with a service running on a stable TLD registrar not likely to be subject to political wills of the host country and hosted by a company not likely to be going anywhere for the next few decades.  Or just consider all communications using URL shorteners to be ephemeral and consider the likely non-functioning in the future a security precaution against future government snooping, perhaps.

  

[On URL Shorteners](http://joshua.schachter.org/2009/04/on-url-shorteners.html) is a discussion of the risks and issues with shorteners from 2009  
  
Some other takes on them from around the web that summed up some of the general thoughts I had about them (if you care about your content being usable down the road and care about whether someone could take your visitors for a ride to malware-town)  
  
[An Unwelcome Reminder of the Nature of URL Shortening Services](https://www.fightaging.org/archives/2010/05/an-unwelcome-reminder-of-the-nature-of-url-shortening-services.php), "if you care about the long-term survival of your external links, steer clear of URL shortening services, no matter how convenient they may at first appear."  
  
[Why I'm creating my own URL shortening service](http://tom.goskar.com/2009/04/16/why-im-creating-my-own-url-shortening-service/) "I suppose that one of the driving forces behind this is my training as an archaeologist (we don’t like throwing things away, generally, and that includes data). I can’t archive the pages I link to, but at least I can give folks in the future a better chance of finding what I’m linking to."