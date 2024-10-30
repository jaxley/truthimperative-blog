---
title: weblogs.com RPC error fix
date: 2003-05-23T09:34:00.000-07:00
published: true
url: /2003/05/weblogscom-rpc-error-fix.html
tags:
  - admin
  - post
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 10:49:43-07:00

---07:00
---

You may have seen this error crop up in your movabletype blog:  
  
Ping 'http://rpc.weblogs.com/RPC2' failed: HTTP error: 500 read timeout  
  
I found plenty of sites through google where people were asking about this but nobody offered a solution that I saw. Well, I found a solution that was posted on the MT support forum just an hour or so ago:  
  
[movabletype.org : Support Forum](http://www.movabletype.org/support/index.php?act=ST&f=18&t=20614&s=5272d33e72190775e4f1979b6449a5dd "movabletype.org : Support Forum")  
  
below is a unified diff so that you can patch your site. The patch seems to work _most of the time_, although I have had at least one of the same errors crop up. That could have been due to something else though.  
  
```
  
\--- XMLRPC.pm   Tue Feb 11 16:15:03 2003  
+++ lib/MT/XMLRPC.pm  Fri May 23 16:29:04 2003  
@@ -68,8 +68,12 @@  
"HTTP error: \[\_1\]", $res->status\_line ));  
}  
my $content = $res->content;  
\-    my($error, $msg) = $content =~  
\-        m!flerror.\*?(\\d+).\*message.\*?(.+?)!s;  
+# quick fix to weblogs.com RPC error in activity log.  See blog entry for details.  
+#    my($error, $msg) = $content =~  
+#        m!flerror.\*?(\\d+).\*message.\*?(.+?)!s;  
\+   my($error) = $content =~  m!flerror.\*?(d+)!s;  
\+   my($msg) = $content =~  m!message.\*?(.+?)!s;  
+  
if ($error) {  
return $class->error(MT->translate(  
"Ping error: \[\_1\]", $msg ));  

```