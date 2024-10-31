---
title: Reducing Your Exposure Running Dvarchive On Linux
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 15:00:13-07:00
tags:
  - security
  - post
date: 2003-11-18T10:19:00.000-08:00
published: true
url: /2003/11/reducing-your-exposure-running.html
aliases:
  - Reducing-your-exposure-running-dvarchive-on-linux
linter-yaml-title-alias: Reducing-your-exposure-running-dvarchive-on-linux
---


I recently got a ReplayTV 5040 for a steal on closeout at buy.com and just **love** it. One of the most attractive features is how it is network-aware by default and that the community has created some great free software for integrating with it. I have been using [DVArchive](https://dvarchive.sourceforge.net) to expand the capacity for recording without having to violate my ReplayTV warranty by hacking the hardware. DVArchive enables your PC to act as a software-based ReplayTV unit for replay, archival, vending photos, as well as playing recorded mpegs remotely on your PC.  
  
However, I was horrified at the suggestion in the [DVArchive FAQ](https://dvarchive.sourceforge.net/dvarchive_faqs/installFAQs_1.shtml) that on UNIX "you must launch DVArchive as root" if you want to enable the functionality that allows serving shows back to your ReplayTV, or to other DVArchive programs running on your network. The real reason for this is that DVArchive (due to inflexible ReplayTV design) must bind to port 80 for ReplayTV units to access the HTTP server there that vends out the mpeg files. And to do this, you normally have to be root.  
  
Well, you could just use sudo or worse, log in as root and run DVArchive as root. But, being a security person, this was not a pleasing thought.  
  
So, I came up with a better way that runs DVArchive as an unprivileged user on the system. I do this by using port forwarding to forward connections to port 80 up to an alternate, unprivileged high port.  
  
Fortunately, DVArchive allows you to specify a _different_ TCP port to listen to instead of port 80. Now, it will bark at you that what you are doing is probably going to prevent ReplayTV units from accessing files on your DVArchive server but you can safely ignore these because you've got port forwarding up your sleeve.  
  
1) Set that port to some open high TCP port under File -> DVArchive Properties... -> Server by changing the "Server Port" setting. I used 13198 in this example and in the attached startup script.  
  
2) Install the attached startup script (see the Extended Entry text for the full script) as root to /etc/rc.d/init.d/dvarchiveforward  
  
3) Edit dvarchiveforward and change MYIP to point to your IP address of your DVArchive server and change the IPTABLES binary location, if necessary.  
  
4) On a RedHat 7.x - 9 system (or any other that has chkconfig) you can active this script at boot time by running (still as root):  
/sbin/chkconfig --add dvarchiveforward  
  
5) You can then check to make sure that this script was activated by running:  
/sbin/chkconfig --list dvarchiveforward  
You should see output like:  
  
dvarchiveforward 0:off 1:off 2:on 3:on 4:on 5:on 6:off  
  
6) Now, start this script so you don't have to wait for a reboot for it to work:  
  
/sbin/service dvarchiveforward start  
  
7) Check to see that the port forwarding entries were inserted correctly  
  
/sbin/iptables -t nat -L  
  
Chain PREROUTING (policy ACCEPT)  
target prot opt source destination  
DNAT tcp -- anywhere yourhostname tcp dpt:http to:192.168.1.1:13198  
  
Chain POSTROUTING (policy ACCEPT)  
target prot opt source destination  
  
Chain OUTPUT (policy ACCEPT)  
target prot opt source destination  
DNAT tcp -- anywhere yourhostname tcp dpt:http to:192.168.1.1:13198  
  
8) Now, you can try accessing archived shows on your DVArchive server from your ReplayTV. All should work just fine.  
  
Here is the /etc/rc.d/init.d/dvarchiveforward script:  
```
  
#!/bin/sh  
\# dvarchiveforward -- script to enable port forwarding so that I can run DVArchive as  
\# a non-privileged user.  Why doesn't firestarter let you do this kind of portfw  
?  
\# chkconfig: 2345 06 95  
\# description: DVArchive port forward script by Jason Axley  

export IPTABLES=/sbin/iptables  
export MYIP=192.168.1.1  
export MYPORT=13198  
case "$1" in  
start)  
\# This forwards local port 13198 to port 80 so that we don't have to run  
\# DVArchive as root to bind to port 80!  
\# doing this below doesn't work for connecting to localhost.  Use the other entries instead  
#$IPTABLES -t nat -A OUTPUT -d $MYIP -p tcp --dport 80 -j REDIRECT --to-ports $MYPORT  
#$IPTABLES -t nat -A PREROUTING -d $MYIP -p tcp --dport 80 -j REDIRECT --to-port  
s $MYPORT  
$IPTABLES -A PREROUTING -t nat -p tcp -d $MYIP --dport 80 -j DNAT --to $MYIP:$MYPORT  
$IPTABLES -A OUTPUT -t nat -p tcp -d $MYIP --dport 80 -j DNAT --to $MYIP:$MYPORT  
break;  
;;  
stop)  
$IPTABLES -t nat -F  
$IPTABLES -t nat -X  
break;  
;;  
reload)  
$0 stop;  
$0 start;  
break;  
;;  
\*)  
echo "Usage:  $0 {start | stop | reload}"  
exit 1  
;;  
esac  

```