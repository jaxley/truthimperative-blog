---
title: Excessive Sql Logging In Zogby Website
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 10:49:43-07:00
tags:
  - post
date: 2008-09-09T15:44:00.000-07:00
published: true
url: /2008/09/excessive-sql-logging-in-zogby-website.html
aliases:
  - Excessive-sql-logging-in-zogby-website
linter-yaml-title-alias: Excessive-sql-logging-in-zogby-website

---bsite
---


Zogby website backed by...MS Access...yuk.  
  
Got this gem of an error message this evening trying to bring up a link from google. It's not a good idea to expose this kind of information to the Internet as it makes it easier for someone to attack your application, perhaps with SQL injection.  
  

> Error Diagnostic Information  
>   
> ODBC Error Code = S1001 (Memory allocation error)  
>   
> \[Microsoft\]\[ODBC Microsoft Access Driver\] Not enough space on temporary disk.  
>   
> The error occurred while processing an element with a general identifier of (CFQUERY), occupying document position (7:1) to (7:43).  
>   
> Date/Time: 09/10/08 01:42:35  
> Browser: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.1) Gecko/2008070208 Firefox/3.0.1  
> Remote Address: 216.39.144.193  
> HTTP Referer: https://www.google.com/search?hl=en&q=survey+troops+iraq&btnG=Search  
> Template: c:\\inetpub\\wwwroot\\news\\readnews.dbm  
> Query String: id=1075