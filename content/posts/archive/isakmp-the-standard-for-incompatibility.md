---
title: Isakmp The Standard For Incompatibility
source: 
created: 2024-10-06 21:27:13-07:00
updated: 2024-10-10 14:56:53-07:00
tags:
  - security
  - post
date: 2005-11-30T13:40:00.000-08:00
published: true
url: /2005/11/isakmp-standard-for-incompatibility.html
aliases:
  - Isakmp-the-standard-for-incompatibility
linter-yaml-title-alias: Isakmp-the-standard-for-incompatibility
---


Peter Gutman wrote a great summary of the lengths that many have to go to in order to get ISAKMP implementations to interoperate.  
  
I had a hell of a time trying to get Windows 2000/XP IPSec to work with FreeS/WAN in the past. It was very difficult to debug what was going on and I resorted to using tools that translated FreeS/WAN configuration into Windows IPSec configuration so that I was sure that the settings were correct.  
  

>   
> \>On Sat, 19 Nov 2005, Peter Gutmann wrote:  
> \>>- The remaining user base replaced it with on-demand access to network  
> \>> engineers who come in and set up their hardware and/or software for  
> them and  
> \>> hand-carry the keys from one endpoint to the other.  
> \>>  
> \>> I guess that's one key management model that the designers never  
> \>> anticipated... I wonder what a good name for this would be,  
> something better  
> \>> than the obvious "sneakernet keying"?  
> \>  
> \>Actually this is a good thing.  
>   
> Unless you're the one paying someone $200/hour for it.  
>   
> \>Separation of the key distribution channel from the flow of traffic  
> encrypted  
> \>under those keys. Making key distribution require human  
> \>attention/intervention.  
>   
> Somehow I suspect that this (making it so unworkable that you have to  
> hand-  
> carry configuration data from A to B) wasn't the intention of the IKE  
> designers :-). It's not just the keying data though, it's all  
> configuration  
> information. One networking guy spent some time over dinner recently  
> describing how, when he has to set up an IPsec tunnel where the  
> endpoints  
> aren't using completely identical hardware, he uses a hacked version of  
> OpenSWAN with extra diagnostics enabled to see what side A is sending in  
> the  
> IKE handshake, then configures side B to match what A wants. Once  
> that's  
> done, he calls A and has a password/key read out over the phone to set  
> up for  
> B.  
>   
> Peter.