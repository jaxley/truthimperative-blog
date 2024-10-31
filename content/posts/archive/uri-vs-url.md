---
title: URI vs. URL
date: 2008-01-01T08:36:00.000-08:00
published: true
url: /2008/01/uri-vs-url.html
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 10:49:42-07:00
---

I've wanted a good operational definition for when you should use URI or URL and so here's my attempt:  
  
Summary:  
  
URI refers to a _resource_.  e.g. _urn:isbn:0-395-36341-1_ for a book by ISBN  
  
A URL is a type of a URI that provides additional information that URIs don't _necessarily_ provide (but they can):  
  

*   URLs tell WHERE you can obtain a particular representation of a resource -- hence the "Locator" in the name.

*   e.g., you use HTTP or FTP to access this server at this address and this specific resource (GIF file, PHP page, etc.)

  
A resource with a given URI could have multiple different URLs.  The same ISBN URI above can be found at Amazon or many other online URLs, for example.  
  
[Ajaxian » URI vs. URL: What’s the difference?](https://ajaxian.com/archives/uri-vs-url-whats-the-difference)  
  
[Uniform Resource Identifier - Wikipedia, the free encyclopedia](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier)