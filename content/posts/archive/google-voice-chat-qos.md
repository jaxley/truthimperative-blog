---
title: Google Voice Chat Qos
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:58:17-07:00
tags:
  - post
date: 2010-10-01T15:59:00.000-07:00
published: true
url: /2010/10/google-voice-chat-qos.html
aliases:
  - Google-voice-chat-qos
linter-yaml-title-alias: Google-voice-chat-qos
---


I've been looking for QoS pointers for Google Voice Chat. I've found that it works great on my DSL until I also am attending a web conference over Webex at the same time. Then I can still hear fine, but upstream I'm told my voice cuts in and out.  
  
So, I figured it's time for some QoS Settings on my router.  
  
It appears that Google Voice Chat uses HTTPS for signaling but an XMPP extension called Jingle that uses RTP over UDP for the actual call data.  
  
I cracked open Wireshark to analyze the traffic and see communication with servers on the 74.125 network, which is owned by google (a /16).  
  

> Destination: stun.l.google.com (74.125.155.126)

  
  
So, for now, I have enabled Expedited packet status for any UDP packets going to and from that network. Will have to run another test later to see if it helped dramatically.  
  
One troubling thing that I noticed in the packet capture is that not all of the data is protected by confidentiality protection. I suspect there \_may\_ be some encryption for the RTP data because Wireshark did not detect any RTP sessions. However, one packet every once in a while revealed the phone number that I was calling. So anyone on your wireless LAN or along the wire can see who you are calling. They may even be able to intercept that packet and play MITM by routing your calls through them. Who knows.  
  
Here's a redacted version of the ascii portion of the data packet contents:  
  

> 0 0+12065551212@voice.google.com