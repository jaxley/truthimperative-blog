---
title: Openldapopenssl Stupidity
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:59:20-07:00
tags:
  - technology
  - post
date: 2003-08-18T15:51:00.000-07:00
published: true
url: /2003/08/openldapopenssl-stupidity.html
aliases:
  - Openldapopenssl-stupidity
linter-yaml-title-alias: Openldapopenssl-stupidity
---


Sorry for not keeping up. Been enjoying the summer too much!  
  
Anyhow, I thought that my experience in trying to get openLDAP 2.0.x working with TLS would be of interest to someone because the solution was so orthogonal it is unbelievable.  
  
I have working OpenLDAP servers with TLS on two other machines so was baffled when I tried /etc/rc.d/init.d/ldap start and got \[FAILED\] with a very similar configuration to the others. Permissions on the TLS files are very finicky so I tried tweaking those--but nothing was working. I tried strace on the slapd binary but that did not offer any clues. I was able to get it to work by running slapd in debug mode on the command line, but in that mode it was ignoring the -u ldap so was running as root. So that told me there was some sort of permissions problem. But where?  
  
Setting up syslog for openldap (not on by default, unfortunately) indicated these errors in the syslog logfile:  
```
  
Aug 18 22:07:21 funhouse slapd\[29220\]: daemon: socket() failed errno=97 (Address family not supported by protocol)  
Aug 18 22:07:21 funhouse slapd\[29220\]: daemon: socket() failed errno=97 (Address family not supported by protocol)  
Aug 18 22:07:21 funhouse slapd\[29220\]: main: TLS init def ctx failed: 0  
Aug 18 22:07:21 funhouse slapd\[29220\]: slapd stopped.  
Aug 18 22:07:21 funhouse slapd\[29220\]: connections\_destroy: nothing to destroy.  

```  
Hmmm. Not too helpful. I googled on these messages and didn't find a thing that helped. I tried all kinds of permissions tweaking to no avail.  
Adding SLAPD\_OPTIONS="-d 6" to /etc/sysconfig/ldap offered up these gems of wisdom:  
```
  
TLS: could not load verify locations (file:\`/etc/openldap/ssl/cert/cacert.pem',dir:\`').  
TLS: error:0200100D:system library:fopen:Permission denied bss\_file.c:104  
TLS: error:2006D002:BIO routines:BIO\_new\_file:system lib bss\_file.c:106  
TLS: error:0E064002:configuration file routines:CONF\_load:system lib conf\_lib.c:91  
TLS: error:0906D06C:PEM routines:PEM\_read\_bio:no start line pem\_lib.c:662  
TLS: error:0B084009:x509 certificate routines:X509\_load\_cert\_crl\_file:missing asn1 eos by\_file.c:284  
main: TLS init def ctx failed: 0  
slapd shutdown: freeing system resources.  
slapd stopped.  
connections\_destroy: nothing to destroy.  
\[FAILED\]  

```  
WTF? So it **_looks_** like some permissions problem with /etc/openldap/ssl/cert/cacert.pem. But that file is world-readable. Does openLDAP think that it needs write perms to that file? Okay--wish granted. Nothing.  
What finally turned me onto the final solution was the last line "X509\_load\_cert\_crl\_file..." The OpenSSL library is trying to find a CRL file. Why would it be having trouble (I don't have a CRL for my CA)? Poking around /usr/share/ssl I noticed that openssl.cnf is not world-readable. Well, I knew that. But most things that need it start as root and then drop privs and it hasn't been a problem. Let's just for the heck of it chmod 644 the file and try again.  
```
  
\# /etc/rc.d/init.d/ldap start  
Starting slapd:                                            \[  OK  \]  

```  
You have **got** to be kidding me?!?! openssl.cnf must be readable by the ldap user! None of the log messages indicated this. You would think that there would be an fopen() call that would fail in trying to open this file... Well, there is. Looking at the strace output I find:  
```
  
open("/usr/share/ssl/openssl.cnf", O\_RDONLY) = -1 EACCES (Permission denied)  
getpid()                                = 11271  
getpid()                                = 11271  
getpid()                                = 11271  
getpid()                                = 11271  
open("/etc/openldap/ssl/cert/cacert.pem", O\_RDONLY) = 7  
fstat64(7, {st\_mode=S\_IFREG|0644, st\_size=3607, ...}) = 0  
old\_mmap(NULL, 4096, PROT\_READ|PROT\_WRITE, MAP\_PRIVATE|MAP\_ANONYMOUS, -1, 0) = 0  
x40377000  
read(7, "Certificate:\\n    Data:\\n        V"..., 4096) = 3607  

```  
The fact that openLDAP kept trucking along after failing to open what appears for it to be a critical file diverted attention away from the real reason it would not start!