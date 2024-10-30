---
title: I Bet You Thought Wep Couldn'T Get Any Worse
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:56:38-07:00
tags:
  - post
date: 2007-05-29T14:24:00.000-07:00
published: true
url: /2007/05/i-bet-you-thought-wep-couldn-get-any.html
---


WEP has been cracked \_again\_ and read the description--it is a devastating break.  Crypto by committee, especially when not done by expert cryptographers with a well-defined threat model, is really, really bad.  This page also summarizes some of the previous weaknesses of WEP.  
  
I hope you have switched to WPA or an alternative by now if you care about wireless privacy and keeping people off of your network.  
  
If this isn't enough to run a VPN like [OpenVPN](http://www.openvpn.org) or IPSec (although I don't favor IPSec anymore for many reasons; that's another crypto by committee with its own problems).  
  
[aircrack-ptw](http://www.cdc.informatik.tu-darmstadt.de/aircrack-ptw/)  

> We were able to extend Klein's attack and optimize it for usage against WEP. Using our version, it is possible to recover a 104 bit WEP key with probability 50% using just 40,000 captured packets. For 60,000 available data packets, the success probability is about 80% and for 85,000 data packets about 95%. Using active techniques like deauth and ARP re-injection, 40,000 packets can be captured in less than one minute under good condition. The actual computation takes about 3 seconds and 3 MB main memory on a Pentium-M 1.7 GHz and can additionally be optimized for devices with slower CPUs. The same attack can be used for 40 bit keys too with an even higher success probability.