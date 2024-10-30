---
title: Aacs Crack Overview
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:59:53-07:00
tags:
  - post
date: 2007-05-29T14:14:00.000-07:00
published: true
url: /2007/05/aacs-crack-overview.html
aliases:
  - Aacs-crack-overview
linter-yaml-title-alias: Aacs-crack-overview
---


```
Excellent high-level description of what went into the AACS crack.  This arms race is even funnier now that the replacement key has been [cracked \_before\_ it has been released](http://arstechnica.com/news.ars/post/20070517-latest-aacs-revision-defeated-a-week-before-release.html).  Media industry:  you lost the battle against your customers before it was started.  
  
\-Jason  

```

> \-----Original Message-----  
> From: [owner-cryptography@metzdowd.com](mailto:owner-cryptography@metzdowd.com)  
> \[[mailto:owner-cryptography@metzdowd.com](mailto:owner-cryptography@metzdowd.com)\] On Behalf Of "Hal Finney"  
> Sent: Saturday, May 05, 2007 11:25 AM  
> To: [cryptography@metzdowd.com](mailto:cryptography@metzdowd.com); [sidney@sidney.com](mailto:sidney@sidney.com)  
> Subject: Re: Yet a deeper crack in the AACS  
>   

> > ```
> > \> Article "AACS cracks cannot be revoked, says hacker"  
> > \>  
> > \> [http://arstechnica.com/news.ars/post/20070415-aacs-cracks-cannot-be-revoked-says-hacker.html](http://arstechnica.com/news.ars/post/20070415-aacs-cracks-cannot-be-revoked-says-hacker.html)  
> > \>  
> > \> Excerpt: "The latest attack vector bypasses the encryption performed   
> > \> by the Device Keys -- the same keys that were revoked by the WinDVD   
> > \> update -- and the so-called 'Host Private Key,' which as yet has not   
> > \> been found. This was accomplished by de-soldering the HD DVD drive's   
> > \> firmware chip, reading its contents, and then patching it. Once that   
> > \> was done, the firmware was soldered back onto the drive."  
> > 
> > ```

>   
> This article was not too accurate, and further progress has been made.  
> At this point it is possible to remotely patch the firmware of a  
> particular kind of HD-DVD drive so that it will provide certain  
> information without the usually required authentication. This makes it  
> easy to retrieve the per-disk "Volume ID", which must be combined with  
> the widely-published Processing Key to generate the media keys that can  
> decrypt content. If this Processing Key is invalidated on future  
> releases, this hack will not be useful until new keys are discovered.  
> It provides only part of the picture.  
>   
> The hack was a real accomplishment because firmware updates had to be  
> authenticated with what was apparently something like an AES-based  
> CBC-MAC. The hackers had to figure this out without much background in  
> cryptography and working only with dumps of the firmware that used a  
> somewhat obscure embedded CPU. They had to figure out what CPU was  
> being used, find a disassembler for it, and examine assembly language  
> dumps to deduce that crypto was involved, recognize AES, and see how to  
> create their own checksums that would make their firmware updates  
> succeed.  
> Just goes to show the motivation and hard work that hackers bring to  
> these efforts, largely for the love of the challenge.  
>   
> It's possible that the ability to modify firmware will lead to more  
> successes for the hackers in the future, perhaps helping them to break  
> into future versions of software players to extract their embedded keys.  
> I peruse the doom9.org forums from time to time, where this work took  
> place right out in the open, before the public eye. Definitely some  
> smart people involved there.  
>   
> Hal Finney  
>   
> \---------------------------------------------------------------------  
> The Cryptography Mailing List  
> Unsubscribe by sending "unsubscribe cryptography" to  
> [majordomo@metzdowd.com](mailto:majordomo@metzdowd.com)  

```
  

```