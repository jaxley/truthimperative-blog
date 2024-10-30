---
title: More On Santa Clara E Voting
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:56:45-07:00
tags:
  - security
  - post
date: 2003-02-26T09:53:00.000-08:00
published: true
url: /2003/02/more-on-santa-clara-e-voting.html
aliases:
  - More-on-santa-clara-e-voting
linter-yaml-title-alias: More-on-santa-clara-e-voting
---


Just heard an NPR story on the Santa Clara e-voting saga. A vote today did not decide on whether they would only go with a system with a paper ballot. Only to test such a system.  
  
The Sequoia company representative (the chosen product) admitted that they only agreed to add the paper ballot because they listen to customer demands. He didn't think it was necessary though.  
  
"Officials in California's Santa Clara County learn that those who know computers best have the biggest concerns about them. That county, home to Silicon Valley, is deciding on an electronic voting system. But a computer scientist fights to keep old-fashioned paper in the voting process. NPR's Andy Bowers reports."  
  
Listen here:  
[Real Audio link](http://www.npr.org/dmg/dmg.php?prgCode=ATC&showDate=26-Feb-2003&segNum=17&NPRMediaPref=RM)  
  
Check out the 128 pages of [documentation](http://verify.stanford.edu/EVOTE/208405KeyboardAttachment-200440211.pdf). page 13 is interesting and the discussion on page 23 that the "prevailing view is that proprietary source code should not be readily available for obvious security \[ed: obscurity\] reasons"  
  
Page 27 has a discussion of the "security" for modem data transmissions of vote totals in the ES & S iVotronic product. It's good for a laugh. Here's their modem "security":  
  
1\. "Transmission...uses an ES&S proprietary protocol that includes proprietary data format and checking....If a standard PC with a modem attempts to link up with a Data Acquisition Manager (DAM) Host, the modems will initially link up but no intelligible information will be received by either unit."  
  
Don't know about you but that gives me warm fuzzies. Of course this is not unlike things that I see in RFPs for other kinds of technology all the time. You would (and should) expect more from such a critical system though.  
  
2\. "To add additional security..." \[as if 1 is not enough\] "...there is an eight-position password built into the protocol"  
  
They go on to say that there is a time period--not a number of failed attempts--that governs disconnect if the correct password is not entered. So, it sounds like someone could brute-force. Is 8-position just numeric, or does it include alpha too?  
  
I could go on but don't want to ruin it for you.