---
title: Strange blog spam?
date: 2004-11-03T23:23:00.000-08:00
published: true
url: /2004/11/strange-blog-spam.html
tags:
  - admin
  - post
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 10:49:43-07:00

---07:00
---

I have gotten two spam blog posts (aside: so, should blog spam be called spog or splog?) recently that I can't figure out what the person's motivation is. They were very similar in style:  
  

  
*   They were both posts consisting of one line of text
  
*   They both had a first name as the user name
  
*   They both included a URL that was not registered or accessible that was related to their name
  
*   They both used name-based hotmail IDs (not sure if they are even valid) for email addresses
  
*   They were both posted within just over 2 hours of each other
  
*   They both were posted to old posts
  
*   Neither had anything to do with the post itself
  

  
  
All of these factors lead me to conclude that they were bogus and so both were rejected.  
  
([MT-Blacklist](https://www.jayallen.org/projects/mt-blacklist/) ROCKS, BTW!!!)  
  
One of the comments said simply:  
  

> "Does this form work like a guestbook?"

  
  
The other said:  
  

> "First time reading this blog, just wanted to say hi."

  
  
I could perhaps understand if the URLs they provided were valid, but otherwise, I can't understand what these posts were trying to do. Perhaps they were just trying to see how they could slip in under the radar for future spam attacks?  
  
Other evidence culled from the logs confirms my suspicions that these are not legit:  
  
The first one has a user-agent of PERL's LWP module:  
  
69.193.88.30 - - \[03/Nov/2004:13:08:11 -0800\] "POST /blog-bin/mt-comments.cgi HTTP/1.1" 200 1794 "-" "libwww-perl/5.65"  
  
Hmmm. Same thing with the next one, but from a slightly different IP and using an older LPW module:  
  
69.193.101.102 - - \[03/Nov/2004:15:23:23 -0800\] "POST /blog-bin/mt-comments.cgi HTTP/1.1" 200 1794 "-" "libwww-perl/5.64"