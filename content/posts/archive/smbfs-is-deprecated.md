---
title: smbfs is deprecated
date: 2007-11-10T12:39:00.000-08:00
published: true
url: /2007/11/smbfs-is-deprecated.html
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 10:49:42-07:00
---

Wow, I haven't been paying close enough attention.  Fortunately the problems with smbfs were bothersome enough for me to do some research and find that it is no longer maintained and that cifs is much more stable.  Most of the arguments are directly mappable between the two so migrating is a cinch.  
  
If you are getting any of these kinds of errors, especially after hitting the file share really hard -- even with reads -- then consider switching.  
```
  
\[167285.988223\] smb\_lookup: find //.Trash-core failed, error=-5  
\[167296.124968\] smb\_add\_request: request \[ea3c5100, mid=53572\] timed out!  
\[167315.978636\] smb\_add\_request: request \[ea3c5200, mid=53573\] timed out!
```  
[Joey Stanford :: Resolution to Mounting Samba Shares - Don’t use smbfs](https://joey.ubuntu-rocks.org/blog/2007/04/25/resolution-to-mounting-samba-shares-dont-use-smbfs/)