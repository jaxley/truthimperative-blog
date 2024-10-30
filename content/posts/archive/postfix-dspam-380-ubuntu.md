---
title: Postfix Dspam 380 Ubuntu
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:59:54-07:00
tags:
  - dspam
  - technology
  - ubuntu
  - spam
  - admin
  - postfix
  - post
date: 2007-11-25T13:13:00.000-08:00
published: true
url: /2007/11/postfix-dspam-380-ubuntu.html
---


I have been wrestling with my dspam configuration on Ubuntu for quite some time and think I finally got it set up the optimal way. It took building a custom modern dspam package myself, with the help of a kind soul who built a custom package for Debian etch.

I get tens of thousands of spam messages to my personal accounts each month. And there are many more going to other users at my domain. It has been getting worse recently. This primarily caused me to take more drastic action and implement realtime blackhole lists to block spam from even entering my mail system. It is absolutely stunning to see how much spam gets blocked vs. how much gets in now. I haven't calculated the stats but on a cursory look at my logs, it is well over 70% that is being dropped on the floor now.

I was having a really bad issue with dspam 3.6.8 that comes with Ubuntu. Turns out this is a very old version of dspam. 3.8.0 has been out for well before the current 7.10 release yet it is only now being looked at for inclusion in 8.04 in April 2008. Ugh. Part of the problem is that upstream Debian hasn't upgraded yet in any of their repositories -- even unstable. Reference: [https://bugs.launchpad.net/ubuntu/ source/dspam/ bug/160139](https://bugs.launchpad.net/ubuntu/%20source/dspam/%20bug/160139)

Alas, I set about building my own. I found a great resource at [http://packages.kirya.net/debian/pool/main/d/dspam/](http://packages.kirya.net/debian/pool/main/d/dspam/) that had binary builds for debian etch and the source packages. Rather than wrestle with redoing the work of applying 3.6.8 patches to 3.8.0, I started with this and it actually builds everything cleanly on Ubuntu 7.04 just fine.

First thing is to make sure you have all of the prerequisites for building packages and building dspam. dspam requires at least mysql, postgres, ldap, zlib and other libraries to build, as well as automake and other build tools.

```
sudo apt-get install build-essential  
sudo apt-get build-dep dspam  

```Obtain the source code and debian patch:```
wget http://packages.kirya.net/debian/pool/main/d/dspam/dspam\_3.8.0-1.1etch1.diff.gz  
wget http://packages.kirya.net/debian/pool/main/d/dspam/dspam\_3.8.0.orig.tar.gz  

```Unpack everything and apply the patch```
tar xvzf dspam\_3.8.0.orig.tar.gz  
gunzip dspam\_3.8.0-1.1etch1.diff.gz  
cd dspam-3.8.0  
patch -p1 < ../dspam\_3.8.0-1.1etch1.diff  

```Now, build everything, including the .deb packages to install. You can skip this and do debian/rules install (as root) if you want to install without packages after compiling.```
chmod 755 debian/rules  
fakeroot debian/rules binary  

```Now, install the new packages. Note there is a new dependency on a base libdspam7 package for any of the driver packages. I use mysql by the way.```
cd ..  
sudo dpkg -i libdspam7-drv-mysql\_3.8.0-1.1etch1\_i386.deb \\  
libdspam7\_3.8.0-1.1etch1\_i386.deb \\  
dspam\_3.8.0-1.1etch1\_i386.deb \\  
dspam-webfrontend\_3.8.0-1.1etch1\_all.deb \\  
dspam-doc\_3.8.0-1.1etch1\_all.deb  

```There were some changes in the config file from 3.6.8 to 3.8.0 so I would suggest starting with the new config file and integrating your customizations. This worked the best for me, although I did forget a few settings here and there so diff is your friend. That's all it took to get upgraded. My final working DSPAM postfix configuration went through some modifications as well. I originally had DSPAM integrated as a content\_filter, but that runs dspam for all incoming \_and outgoing\_ messages. I didn't think this would be a problem at first, but after seeing it in action it became confusing for end users. What can happen in this configuration is dspam can tag the message subject with your SPAM tag when \_the recipient\_ (which is often a mailing list) has dspam run on it, but then dspam is run again for each individual recipient upon delivery so can end up deciding that the message is not spam, but the subject is left alone. Thus, users receive a message tagged as spam that isn't, according to their dspam decision. I instead set up using this general guideline, which is excellent: [http://gentoo-wiki.com/HOWTO\_Spam\_Filtering\_with\_DSPAM\_and\_Postfix](http://gentoo-wiki.com/HOWTO_Spam_Filtering_with_DSPAM_and_Postfix) I don't use ClamAV though so that's the major difference. I've seen so many security notices sent to Bugtraq that I'm not sure the cure is better than the disease... I wanted system-wide spam and notspam retraining aliases though, so I included another transport filter in my configuration to handle those special users first before dspam got to them:```
smtpd\_recipient\_restrictions =  
      check\_recipient\_access hash:/etc/postfix/dspam\_retrain\_aliases,          
      permit\_mynetworks,  
      reject\_unauth\_destination,  
      check\_recipient\_access pcre:/etc/postfix/dspam\_incoming\_filter,  
      ....  
      permit  

```Then, in the dspam\_retrain\_aliases file I have:```
dspam-fp@dspam-fp.example.com                  FILTER dspam-fp:innocent  
dspam-add@dspam-add.example.com             FILTER dspam-add:spam  

```These trigger the following filters in /etc/postfix/master.cf. Note: you need to set up these subdomains in DNS first! You could probably do something like this without subdomains but that's how I and others have gotten it to work.```
\# only allow local network to post to these entries  
dspam-add unix   -   n   n   -   -   pipe  
    flags=Rhq user=dspam argv=/usr/bin/dspam --mode=toe --user dspam-add@dspam-add.example.com --class=spam --source=error  
    -o smtpd\_recipient\_restrictions=permit\_mynetworks,reject  
    -o mynetworks=192.168.1.0/24  
  
\# only allow local network to post to these entries  
dspam-fp unix - n n - - pipe  
    flags=Rhq user=dspam argv=/usr/bin/dspam --mode=toe --user dspam-fp@dspam-fp.example.com --class=innocent --source=error  
    -o smtpd\_recipient\_restrictions=permit\_mynetworks,reject  
    -o mynetworks=192.168.1.0/24  

```I also added in some header\_checks to reject emails with foreign character sets in them to block additional spams. I've been getting a ton of greek spam and other mid-east charsets it seems.```
\# Using this to block lots of non-US character set emails  
header\_checks = regexp:/etc/postfix/header\_checks  

```And I combined several regexes from various Internet sources in there:```
/^Subject:.\*=\\?big5\\?/ REJECT No foreign character sets, please.  
/^Content-Type:.\*charset=.\*big5/ REJECT No foreign character sets, please.  
/^Subject:.\*=\\?euc-kr\\?/ REJECT No foreign character sets, please.  
/^Content-Type:.\*charset=.\*euc-kr/ REJECT No foreign character sets, please.  
/^Subject:.\*=\\?gb2312\\?/ REJECT No foreign character sets, please.  
/^Content-Type:.\*charset=.\*gb2312/ REJECT No foreign character sets, please.  
/^Subject:.\*=\\?iso-.\*-jp\\?/ REJECT No foreign character sets, please.  
/^Content-Type:.\*charset=.\*iso-.\*-jp/ REJECT No foreign character sets, please.  
/^Subject:.\*=\\?koi8\\?/ REJECT No foreign character sets, please.  
/^Content-Type:.\*charset=.\*koi8-r/ REJECT No foreign character sets, please.  
/^Subject:.\*=\\?ks\_c\_5601-1987\\?/ REJECT No foreign character sets, please.  
/^Content-Type:.\*charset=.\*ks\_c\_5601-1987/ REJECT No foreign character sets, please.  
\# headers with 8 special characters... spam  
/\[^\[:print:\]\]{8}/ REJECT Special chars in header a no-no.  

```Hope this summary helps someone...  
  
Update: Fixed the build-dep installation command above. Copy/paste error...