---
title: "Ubuntu 6.10  &gt; 7.04 upgrade:  Apache 2.2 ldap changes"
date: 2007-07-22T15:34:00.000-07:00
published: true
url: /2007/07/ubuntu-610-704-upgrade-apache-22-ldap.html
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 10:49:42-07:00
---

Just suffered through some lame apache module syntax changes on Ubuntu after upgrading to 7.0.4.  This is why I don't skip major versions...  
  
Here is my functioning template on Ubuntu 7.04 Feisty:  
```
  
AuthBasicProvider ldap  
AuthName "Secret Website"  
AuthType Basic  
AuthzLDAPAuthoritative on     # prevent other mods from authenticating this user on failure  
\# protocol://server:port/base?attribute?scope?filter  
AuthLDAPURL ldap://localhost:389/blah  
AuthLDAPBindDN blah  
AuthLDAPBindPassword "secret"  
\# require membership in LDAP group for access  
require ldap-group cn=mygroup,ou=Groups,dc=example,dc=com  

```There were several major changes that kept my site from working after the upgrade:  
  
Deprecated directives:  
  
AuthLDAPAuthoritative (now AuthzLDAPAuthoritative)  
AuthLDAPEnabled  
  
New directive required:  
  
AuthBasicProvider ldap  
  
This tells the mod\_auth\_basic module to defer to the mod\_authnz\_ldap module for authentication instead of handling it on its own.  If you don't specify it, you get this lovely cryptic error in your server error log:   

> ```
> \[error\] Internal error: pcfg\_openfile() called with NULL filename
> ```

require group now only is used for local UNIX groups.  For LDAP, you have to use require ldap-group.