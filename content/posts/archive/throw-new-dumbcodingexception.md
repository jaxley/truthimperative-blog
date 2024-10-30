---
title: throw new DumbCodingException
date: 2010-04-28T16:11:00.000-07:00
published: true
url: /2010/04/throw-new-dumbcodingexception.html
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 10:49:42-07:00
---

I came across the dumbest code I've seen in a while at work today.  
  
try  
{  
    return \_Collection.Length;  
}  
catch (NullReferenceException)  
{  
    return 0;  
}  
  
I found it because when debugging an asp.net page, I had enabled thrown exception breaks and this code was causing about 5 debug breaks for every page load...  Needless to say it has now been rewritten.