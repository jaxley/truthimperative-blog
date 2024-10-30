---
title: Flawed Reasoning Underlying Many Reverse Proxy Internet Architectures
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:21-07:00
tags:
  - post
date: 2014-01-14T21:18:00.001-08:00
published: false
url: 
aliases:
  - Flawed-reasoning-underlying-many-reverse-proxy-internet-architectures
linter-yaml-title-alias: Flawed-reasoning-underlying-many-reverse-proxy-internet-architectures

---tures
---


  
Sticking reverse proxies in front of internally-hosted web applications (on an internal enterprise network) instead of re-hosting those applications in a proper DMZ was something I have encountered often in my IT security career.  These architectures look something like:  
  
Browser --Firewall--> HTTP Reverse Proxy --Firewall--> Web Server (on internal network)  
  
The risks of reverse proxying is a subject covered in a previous blog post.  However, I wanted to dedicate an entire post to rehashing the _actual arguments_ I've had people present to me over the years why they think reverse-proxying for Internet application hosting is a good idea.  

Assumption 1:  Attacker could only compromise the proxy server since that's the only system they have "direct" connectivity with
--------------------------------------------------------------------------------------------------------------------------------

_Why this is flawed:_  
  

1.  Attackers are in no way limited to compromising only the outermost host they are talking to via TCP/IP. Think of blind SQL injection -- that exploits the DB server and allows attackers to make arbitrary queries to the database yet it relies on the external host application to relay those queries. No direct SQL DB connection is required.
2.  Another way to view this situation would be to replace "reverse proxy" with the term "firewall" or "router" and restate the claim as, "Attacker could only compromise the firewall/router since that's the only system they have direct connectivity with"  Hollywood might lead you to believe that the primary means of infiltrating a network is by hacking "through the firewall", but this is rarely the case. Firewalls, just like reverse proxies, happily relay any bits to systems they allow connectivity to without regard to whether those bits contain malicious attack code or innocent GET requests.

  

Assumption 2:  Attacker would have to compromise the systems in the order they encounter them (serially)  
----------------------------------------------------------------------------------------------------------

The thought behind this was that the proxy server is actually helping security of the internal application because it forces an attacker to first work to compromise the proxy itself, as opposed to directly exposing the application on the Internet.

  

_Why this is flawed:_

1.  Of course there is no requirement that attackers would be limited to attacking the layer 7 applications in the order they are encountered.  The discussion of Assumption 1 above debunks this.  Another example that demonstrates that this is untrue would be reverse-proxying access to an internal struts application running on Apache containing an unpatched [Remote Code Execution vulnerability.](https://struts.apache.org/release/2.3.x/docs/s2-014.html)  An attacker could directly exploit that vulnerability in the internal server as the reverse proxy will happily relay all of the exploit bits (just like the firewalls inbetween, right?) to the target server.
2.  One way this argument was attempted to be salvaged was to claim that the fact that reverse proxies often require user authentication before proxying access means that an attacker would have to get past the proxy to attack the internal system.  There are a couple of ways this would not hold:

1.  Authentication might just limit the user community that can exploit the internal server.  Imagine a sign
2.  A misconfiguration of the proxy could allow for unauthenticated access to the proxied server.

Assumption 3:  Any exploit applicable to the internal systems would equally apply to the reverse proxy itself 
--------------------------------------------------------------------------------------------------------------

_Why this is flawed:_

1.  This is an argument _for_ reverse-proxying?  This individual, as I recall, was trying to argue against my concern for compromise of the internal server by throwing out a variation of the "Oh, yeah!" red herring.

1.  Assuming this were true, then the attacker simply has to invoke the same exploit twice (\*gasp\*).  I'm sure they'll just pack up and go home before doing that.

3.  Most environments are not that heterogeneous so this wouldn't hold as a general rule.  In fact, these days, WAFs and other systems are used as reverse-proxies instead of a plain old Apache reverse proxy so this definitely does not hold in a lot of places.

1.  Further, internal systems that are proxied to are very likely to be _significantly less secure_ than the Internet-facing system.  I'm sure that there would be plenty more exploits that an attacker could use against the internal server than only the ones applicable to the reverse proxy server itself!