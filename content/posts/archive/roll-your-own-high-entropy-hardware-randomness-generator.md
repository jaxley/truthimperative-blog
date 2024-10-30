---
title: Roll Your Own High Entropy Hardware Randomness Generator
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:59:57-07:00
tags:
  - security
  - post
date: 2005-10-30T13:44:00.000-08:00
published: true
url: /2005/10/roll-your-own-high-entropy-hardware.html
aliases:
  - Roll-your-own-high-entropy-hardware-randomness-generator
linter-yaml-title-alias: Roll-your-own-high-entropy-hardware-randomness-generator
---


[High-Entropy Randomness Generator](http://www.av8n.com/turbid/paper/turbid.htm "High-Entropy Randomness Generator")  
  

>   
> In this paper, we explain how to construct a High-Entropy Randomness Generator, suitable for a wide range of applications, including extremely demanding ones. We will explain and then use some key theoretical ideas:  
>   
> \* We start with a raw input, typically from a good-quality sound card.  
> \* We obtain a reliable lower bound on the raw input’s entropy density (as defined in appendix A). This is calculated based on physics principles plus a few easily-measured macroscopic properties of the sound card. (This stands in stark contrast to other approaches, which obtain a loose upper bound based on statistical tests on the data.)  
> \* We make use of the hash saturation principle, as discussed in section 3.2. The resulting output has essentially 100% entropy density. This is provably correct under mild assumptions.  
> \* We use no secret internal state and therefore require no seed.  
> \* We do not depend on assumptions about “one-way functions”.  
>   
> We have implemented a generator using these principles. The result is what most people would call a True Random Number Generator. Salient engineering features include:  
>   
> \* It costs next to nothing. It uses the thermal fluctuations intrinsic to the computer’s audio I/O system.  
> \* It emphatically does not depend on imperfections in the audio I/O system. Indeed, high-quality sound cards are much more suitable than low-quality ones. It relies on fundamental physics, plus the most basic, well-characterized properties of the audio system: gain and bandwidth.  
> \* It can produce thousands of bytes per second of output.  
> \* Remarkably little CPU time is required.  
> \* It includes optional integrity-monitoring and tamper-resistance capabilities.