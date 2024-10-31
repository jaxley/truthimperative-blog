---
title: Why I hate my 2wire DSL modem
date: 2009-09-21T17:39:00.000-07:00
published: true
url: /2009/09/why-i-hate-my-2wire-dsl-modem.html
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:42-07:00
---

Recently, all Internet connectivity decided to stop working at home.  I tracked the problem down to my 2wire 2700HG-B DSL modem that was the more reliable of the two (my other is an Actiontec gt701-wg) that was just dropping packets into the ether somehow.  So, I put my Actiontec back in service briefly, only to be reminded of how flaky it was, stopping responding to even pings to the LAN interface every once and a while.  I ended up bricking the Actiontec in trying to do a recovery installation to it so I could clear out the flash completely to see if that would make it more reliable.  
  
So, it was spend-5-hours-to-get-the-2wire-working-again.  Toward the end of the 5 hours, I asked myself why the WAN configuration was different, and I think that the 2wire (from AT&T; bought on ebay) did a firmware auto-upgrade on me and that hosed everything up so that it did not operate correctly with the same configuration as before.  
  
So, I had to borrow some neighborhood wi-fi time to research how to get a similar configuration with the new firmware.  I succeeded in getting outbound Internet working at about 2am and left well enough alone.  It seems as if you can change a little setting and all of a sudden everything stops working.  Highly temperamental.   
  
But that left inbound Internet not working, which was okay for a few days.  I just decided to make an attempt (while I'm trying to obtain a motorola 3347 to replace it) to get inbound Internet working again even with a sub-optimal configuration.  I was not able to get the routed subnet to work at all inbound.  The firewall on the 2wire just does not work right inbound.  Even if I set it to disable the firewall inbound for the routed subnet, no packets come into the LAN.  
  
So I abandoned the routed subnet and went with a sub-optimal SNAT configuration, along with editing routing the public IP to an internal IP.  Which still didn't work because the stupid firewall on the 2wire still did not allow packets to come in even in DMZplus mode.  So, next step was to do port "pinhole" configuration in the firewall to allow the services I wanted inbound.  Okay, that works.  This all of course required me to first wait forever for the local LAN device to be magically re-detected by the 2wire so that I could actually configure the IP allocation and firewall settings...  Why, oh why, can you not just manually specify what the stupid IP address is you want for the local device?  Auto detection is not easier if it does not work as expected or is not reliable people!  
  
The most ridiculous thing was then that the 2wire seems to do SNAT not only inbound, but outbound as well!  So when it sees a packet come from a host behind the firewall with a private IP, like 192.168.1.1, that it NATs outbound to a public IP, say 204.16.40.73, it actually SNATs the packets before applying the firewall rules so it turns the outbound packets into requests \_from\_ 204.16.40.73 -- totally munging up the distinction of LAN/WAN IPs and preventing any meaningful ability to configure rules to allow traffic to route out to the public IP but back into the LAN device from the intranet.  You see these fun messages int he event log:  "IP Source and Destination Address are the same, Packet Dropped"  Just dumb.  
  
So back in to configure additional SNAT and routing rules with a virtual interface to prevent packets from leaving the LAN and being dropped by the 2wire.  Ugh.  

*   Destructive auto-update
*   Inflexible firewall
*   Inflexible NAT/routing (and doesn't even work right)
*   Occasionally stops responding to packets on the LAN interface (but still on the WAN interface)
*   Inflexible addressing options for wireless, etc.  
    

  
  

<!-- ![](https://img.zemanta.com/pixy.gif?x-id=498a6d1e-5878-875f-8e0f-0b78f98ef944) -->