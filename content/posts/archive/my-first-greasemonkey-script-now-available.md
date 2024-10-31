---
title: My First Greasemonkey Script Now Available
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - post
date: 2009-10-20T16:00:00.000-07:00
published: true
url: /2009/10/my-first-greasemonkey-script-now.html
aliases:
  - My-first-greasemonkey-script-now-available
linter-yaml-title-alias: My-first-greasemonkey-script-now-available

---lable
---


I just posted a greasemonkey script I wrote months back that I use all the time to make managing my Chase accounts just a bit easier.  I cleaned it up a bit and added some missing comments.  I decided later to switch to jQuery by referring to a remotely-hosted copy on chase.com so eventually I'll simplify things and rewrite what I can in jQuery instead but it works great!  
  
[Chase OFX downloader for Greasemonkey](https://userscripts.org/scripts/show/60257)  

> Script Summary:  
> Automates chase.com OFX file downloads for every eligible account. One click to download all available OFX files one after the other instead of manually. Also adds useful features not present in the site, such as remembering the date you last downloaded  
>   
> If like me you think that the chase online transaction download form could use a little help, you might enjoy this script.  
>   
> 1\. It provides a button on every page that allows you to quickly go right to the download transactions page. Otherwise, you have to hunt around for this page.  
> 2\. On the download transactions page, it:  
> a) Automatically persists the last transaction download date and then reloads it next time you come back so that you don't have to remember the date you need to start downloading from.  
> b) Automatically sets the end date for transaction downloads to the current date.  
> c) Remembers the OFX file type you selected and reloads it automatically next time.  
> d) Most importantly, provides a "Download All OFX" button that you can use to download available OFX transactions from every account in the drop-down list. Multiple download windows will appear that you can click on one at a time and the transactions will then be opened in the application associated.

  
  

<!-- ![](https://img.zemanta.com/pixy.gif?x-id=9e05d9e6-1a4f-84fe-a3e4-94e569c91d37) -->