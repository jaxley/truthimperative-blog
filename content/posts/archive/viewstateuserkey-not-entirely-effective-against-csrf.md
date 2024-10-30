---
title: ViewStateUserKey not entirely effective against CSRF
date: 2008-06-07T13:45:00.000-07:00
published: true
url: /2008/06/viewstateuserkey-not-entirely-effective.html
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 10:49:43-07:00
---

Oh, how timely! Just a few days ago, a blog post about the limitations of ViewStateUserKey as a means to prevent CSRF in ASP.Net applications. The bottom line:  

1.  developers can disable ViewState entirely, so it lacks central control (kind of like ripping out your firewalls and hoping everyone has an up-to-date and securely configured desktop firewall instead)
2.  There are some issues with the mechanism working over load-balanced connections or across IIS app pools where session IDs are likely not shared.
3.  Most importantly, the ViewState MAC is only checked on POSTback, so if you have apps that don't use POSTbacks, you are still vulnerable.

The article also suggests that a CSRF Guard for .Net is needed. Well, they are in luck because it is: [https://www.owasp.org/index.php/.Net\_CSRF\_Guard](https://www.owasp.org/index.php/.Net_CSRF_Guard)  
  
[ViewStateUserKey Doesn’t Prevent Cross-Site Request Forgery - KeepItLocked.net](http://keepitlocked.net/archive/2008/05/29/viewstateuserkey-doesn-t-prevent-cross-site-request-forgery.aspx)