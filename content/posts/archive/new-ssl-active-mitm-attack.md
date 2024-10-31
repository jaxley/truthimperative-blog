---
title: New Ssl Active Mitm Attack
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - security
  - post
date: 2003-02-21T15:11:00.000-08:00
published: true
url: /2003/02/new-ssl-active-mitm-attack.html
aliases:
  - New-ssl-active-mitm-attack
linter-yaml-title-alias: New-ssl-active-mitm-attack

---ttack
---


"  
In a paper researchers at the Security and Cryptography Laboratory of  
Swiss University (Lasec) EPFL demonstrate a timing-based attack on CBC  
cipher suites in SSL and TLS.  
  
The attack assumes that multiple SSL or TLS connections involve a  
common fixed plaintext block, such as a password. Since credit cards  
numbers are normally sent to a secure server only once this particular  
attack has little or no chance of success.  
  
When checking emails, using for example an Outlook Express 6.x client,  
using a secure connection passwords are sent periodically as email is  
checked. This leaves the door open for an attack. "  
  
The attack relies on the protocol being a bit too chatty in providing information . There are many limitations that make this not especially critical, although IMAP/POP clients like Outlook exacerbate the risk because they will happily keep resending your encrypted password to the server if it does not succeed.  
  
[The Register article](https://www.theregister.co.uk/content/55/29423.html)  
  
Peter Gutman, of cryptlib fame, posted some client-side coding suggestions to ensure that you are not at risk, regardless of whether your server is vulnerable or not:'  
  

>   
> \- Don't retry a connection repeatedly if it fails the first time (I  
> guess you don't do that anyway, but some programs like Outlook try automated  
> repeated connects).  
>   
> \- Add random whitespace to the initial messages so the password isn't  
> always at a fixed location (that is, sprinkle extra spaces and tabs and  
> whatnot around in the lines you send up to and including the password).  
>   
> \-- Snip --  
>   
> This changes the padding on each message containing the password, making  
> the attack rather more difficult, and has the advantage that you don't need  
> to convince the party running the server to update their software.  
> Depending on how much stuff you can send per message, you can vary it by quite a bit.  
> In the POP case the "PASS xxx" would be a single message so you don't have  
> quite that much leeway, but it looks like you can add enough whitespace to  
> make the padding random. Someone else on the list posted a followup to say he'd  
> tried it on two servers and they had no trouble with the whitespace.  

  
  
There is an excellent technical summary that I'll have to dig up and post later. It listed out all of the limitations that could mitigate your risk.