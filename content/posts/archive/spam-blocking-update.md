---
title: Spam blocking update
date: 2005-05-03T13:52:00.000-07:00
published: true
url: /2005/05/spam-blocking-update.html
tags:
  - technology
  - post
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:56:49-07:00
---

So, like everyone, I get a LOT of spam. Over the past year (May 15 2004 - May 3 2005), I have received and processed a total of 120878 emails.  
  
Here is how the mail I received breaks down:  
  
notspam (ham): 14092 (11.7%)  
probably-spam: 76925 (63.6%)  
suspected-spam: 29154 (24.1%)  
  
The statistics are somewhat misleading. I switched in August of 2004 to calling all mail marked over a particular spam threshold "probably spam" and suspicious mail as "suspected spam", when before everything was "suspected spam". So, until I do further analysis, the suspected spam pot is a bit fuller than it should be.  
  
What this shows is that only about 12% of my email is legitimate, leaving the other 88% as mostly, well, crap. The legitimate mail will actually a bit higher because some of the mail that gets quarantined as suspected spam is actually legitimate, but not all of it. I have to look at mail that falls into the suspected spam bucket and retrain bogofilter if the mail is really spam or legitimate (in which case, I set up a new whitelist entry)  
  
The spam solution that I have today works very well. It is a combination of a whitelist along with [Bogofilter](http://bogofilter.org/) in tri-mode so that Bogofilter tags mail as either notspam, suspicious, or pretty sure it's spam. A solution with just Bogofilter was still fairly accurate, however, false positives were unacceptable to me. Also, it is a chore to weed out the wheat from the chaffe with the volume in spam compared to the very infrequent false positives. So, a whitelist turned out to be a necessary evil to keep known legitimate mail from making it into the spambucket (which, with bogofilter, until you correct the database, can negatively impact every future spam decision)  
  
Bogofilter relies on a 72 megabyte database of spam tokens, generated from hundreds of thousands of spam messages that I have kept since 1997 (about every single spam I have ever received from every mail account I've had).  
  
False negatives used to be a problem until I got my bogofilter database properly tuned and caught many classification errors that were made that I had missed that were throwing off the classifications. My Bogofilter database is now 72 megabytes and works a lot better than the old 17 megabyte list from long ago. All in all, it is a great solution.