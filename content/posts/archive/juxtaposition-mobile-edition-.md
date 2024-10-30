---
title: Juxtaposition Mobile Edition-
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:56:44-07:00
tags:
  - admin
  - post
date: 2003-03-22T01:36:00.000-08:00
published: true
url: /2003/03/juxtaposition-mobile-edition.html
aliases:
  - Juxtaposition-mobile-edition-
linter-yaml-title-alias: Juxtaposition-mobile-edition-
---


I just found out some very simple instructions and a sample template to make a parallel WML version of this site for viewing on my mobile phone (I do work for a wireless phone company, after all). Check out the result: [Juxtaposition mobile edition](/index.wml)  
  
  
I started by finding this [WAP & WML](http://www.movabletype.org/cgi-bin/ikonboard/ikonboard.cgi?s=3e7c925b76bcffff;act=ST;f=9;t=11237;hl=wml) thread at movabletype.org  
  
This discussion pointed me to two solutions for two different problems:  
  

  
2.  [Nicely Toasted Mobile](http://nicelytoasted.net/wapinstruct.shtml), which generates wml versions on-the-fly for WAP-based mobile devices  
    
3.  [Mark Pilgrim's solution](http://diveintomark.org/archives/2003/03/15/about_the_mobile_edition.html) which was designed for more intelligent mobile form factors, like the palm. This is how you can create Avant-Go compatible content for offline browsing with tools like Plucker.  
    

  
  
I chose the first option as this is the one that I really find lacking right now--the ability to view my own site from my [Ericsson t68i](http://www.attws.com/mmode/devices/t68i.jhtml). I can view the regular site just fine (with the exception of the style sheet, because Pocket IE does not support CSS...) in my [Siemens SX56](http://www.attws.com/business/data/individual/siemens/). But cannot even coax the Ericsson to view the RDF version.  
  
I made just a couple of tweaks to the Nicely Toasted template to customize the content and make it generic enough to be used for any other blog, including: making the Home URL relative, changing the blog name using the tag <MTBlogName>  
  
I think that the next step will be to further customize the template to include hyperlinks to the rest of the story content.