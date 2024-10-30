---
title: Css Sprites Are Cool
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:56:42-07:00
tags:
  - post
date: 2009-01-25T04:05:00.000-08:00
published: true
url: /2009/01/css-sprites-are-cool.html
aliases:
  - Css-sprites-are-cool
linter-yaml-title-alias: Css-sprites-are-cool
---


I just learned about CSS sprites for reducing the amount of HTTP requests it takes to render a page.  Very cool stuff.  
  
Basically, you create a single image that contains all of the small images to use on your site and that is all you need to download.  Then you use CSS and offsets within that image to select that part of the image to display in the page.  There is padding around each image so that you don't get weird renderings with different browser quirks.  
  
[http://css-tricks.com/css-sprites-what-they-are-why-theyre-cool-and-how-to-use-them/](http://css-tricks.com/css-sprites-what-they-are-why-theyre-cool-and-how-to-use-them/)