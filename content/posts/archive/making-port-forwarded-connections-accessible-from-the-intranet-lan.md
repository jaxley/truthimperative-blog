---
title: Making Port Forwarded Connections Accessible From The Intranet Lan
source: 
created: 2024-10-06 21:27:13-07:00
updated: 2024-10-10 14:56:55-07:00
tags:
  - technology
  - post
date: 2006-06-25T11:13:00.000-07:00
published: true
url: /2006/06/making-port-forwarded-connections.html
aliases:
  - Making-port-forwarded-connections-accessible-from-the-intranet-lan
linter-yaml-title-alias: Making-port-forwarded-connections-accessible-from-the-intranet-lan
---


\# Enabling many:one IP masquerading from the LAN to the Internet (i.e. out the $WAN interface)  
iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE  
  
\# port forwarding $WAN\_IP:25 to $SMTP\_SVR\_IP:25  
iptables -t nat -A POSTROUTING -d $WAN\_IP -p tcp --dport 25 -j DNAT --to $SMTP\_SVR\_IP  
iptables -A FORWARD -i $WAN -p tcp --dport 25 -d $SMTP\_SVR\_IP -j ACCEPT  
  
\# Making this cruft work from the intranet  
\# i.e. DESK\_IP -> WAN\_IP:25  
  
\# Bad rule:  
iptables -t nat -A POSTROUTING -o $LAN -j SNAT --to-source $WAN\_IP  
  
\# Good rule:  
iptables -t nat -A POSTROUTING -o $LAN -s 192.168.1.0/24 -j SNAT --to-source $WAN\_IP