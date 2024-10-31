---
title: Even More Evidence Of Php Becoming The New C
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:59:40-07:00
tags:
  - security
  - post
date: 2005-10-30T13:46:00.000-08:00
published: true
url: /2005/10/even-more-evidence-of-php-becoming-new-c.html
aliases:
  - Even-more-evidence-of-php-becoming-the-new-c
linter-yaml-title-alias: Even-more-evidence-of-php-becoming-the-new-c
---


Another example of how PHP can be dangerous. Having to know the internal workings of variable acceptance to implement secure data checking seems to negate the value of having a higher-order programming language.  
  
And, it is common in other languages to work with variables in a REQUEST structure of some sort.  
  
PHP should provide a built-in set of semantics for data input filtering that work across all of the possible input types so that each application doesn't have to build their own. I even remember when you used to have to build your own PHP session management or use additional PHP modules (PHPlib was a great implementation) before it got rolled into PHP 4.  
  
Also check out the [Hardened-PHP Project](https://www.hardened-php.net/) for this advisory and many others for PHP applications, and some PHP security basics talks.  
  
\-J  
  

>   
> \-----Original Message-----  
> From: Stefan Esser \[mailto:sesser@hardened-php.net\]  
> Sent: Saturday, July 02, 2005 12:09 AM  
> To: full-disclosure@lists.grok.org.uk; bugtraq@securityfocus.com  
> Subject: Advisory 03/2005: Cacti Multiple SQL Injection Vulnerabilities \[FIXED\]  
>   
> \-----BEGIN PGP SIGNED MESSAGE-----  
> Hash: SHA1  
>   
>   
> Hardened - PHP Project  
> www.hardened-php.net  
>   
> \-= Security Advisory =-  
>   
>   
>   
> Advisory: Cacti Multiple SQL Injection Vulnerabilities Release Date: 2005/07/01 Last Modified: 2005/07/01  
> Author: Stefan Esser \[sesser@hardened-php.net\]  
>   
> Application: Cacti <= 0.8.6e  
> Severity: Wrongly implemented user input filters lead to  
> multiple SQL Injection vulnerabilities which can  
> lead f.e. to disclosure of the admin password hash  
> Risk: Critical  
> Vendor Status: Vendor has released an updated version  
> References: https://www.hardened-php.net/advisory-032005.php  
>   
>   
> Overview:  
>   
> Quote from https://www.cacti.net  
> "Cacti is a complete network graphing solution designed to harness  
> the power of RRDTool's data storage and graphing functionality.  
> Cacti provides a fast poller, advanced graph templating, multiple  
> data acquisition methods, and user management features out of the  
> box. All of this is wrapped in an intuitive, easy to use interface  
> that makes sense for LAN-sized installations up to complex  
> networks with hundreds of devices."  
>   
> Because it is usually fun to audit software which was previously  
> audited by experts from iDEFENSE we scanned through their reported  
> vulnerabilities and found that most are not properly fixed.  
>   
>   
> Details:  
>   
> With the recent release of iDEFENSE's Cacti advisories version  
> 0.8.6e of Cacti was released which according to iDEFENSE fixes  
> all reported flaws. But this is not true.  
>   
> However the user input filters that were added to the Cacti  
> codebase to address the possible SQL Injections are wrongly  
> implemented and therefore can be tricked to let attackers  
> through.  
>   
> To demonstrate the problem here a snipset of "graph.php"  
>   
> /\* ================= input validation ================= \*/  
> input\_validate\_input\_regex(get\_request\_var("rra\_id"), "^(\[0-9\]+|all)$");  
> input\_validate\_input\_number(get\_request\_var("local\_graph\_id"));  
> /\* ==================================================== \*/  
>   
> if ($\_GET\["rra\_id"\] == "all") {  
> $sql\_where = " where id is not null";  
> }else{  
> $sql\_where = " where id=" . $\_GET\["rra\_id"\];  
> }  
>   
> On the first look this code looks safe, because it checks that  
> the 'rra\_id' request parameter is either a number or the string  
> "all" before inserting it into a part of the SQL Query.  
>   
> To realize that this check is however worth nothing one has to  
> dig deeper and look into the implementation of get\_request\_var()  
>   
> function get\_request\_var($name, $default = "")  
> {  
> if (isset($\_REQUEST\[$name\]))  
> {  
> return $\_REQUEST\[$name\];  
> } else  
> {  
> return $default;  
> }  
> }  
>   
> This actually means that the filter in this example is applied to  
> the content of $\_REQUEST\["rra\_id"\] and not to $\_GET\["rra\_id"\].  
> The problem with this is, that $\_REQUEST is a merged version of  
> the $\_GET, $\_POST and $\_COOKIE arrays and therefore array keys of  
> the same name will overwrite each other in $\_REQUEST.  
>   
> In the default configuration of PHP which is usually not changed  
> by anyone the merge order is GPC. This means when the request  
> contains both $\_GET\["rra\_id"\] and $\_POST\["rra\_id"\], only the  
> posted value will end up in the $\_REQUEST array.  
>   
> This however means, that nearly all of the implemented filters can  
> be bypassed by supplying the attack string through the URL and  
> supplying a good string through POST or through the COOKIE.  
>   
>   
> Proof of Concept:  
>   
> The Hardened-PHP Project is not going to release exploits  
> for this vulnerabilities to the public.  
>   
>   
> Disclosure Timeline:  
>   
> 25\. June 2005 - Contacted Cacti developers via email  
> 29\. June 2005 - Review of patch from our side  
> 1\. July 2005 - Release of updated Cacti and Public Disclosure  
>   
>   
> Recommendation:  
>   
> We strongly recommend upgrading to Cacti 0.8.6f which you can get at  
>   
> https://www.cacti.net/download\_cacti.php  
>   
>   
> Summary for Secunia:  
>   
> Because Secunia proofed several times in the past, that they have  
> enormous problems with reading advisories and crediting the right  
> parties in their advísory rip-offs, here a short summary.  
>   
> This bug was not found by iDEFENSE. On the contrary it is a bug  
> in the input filters that were implemented because of iDEFENSE  
> and where nodded through by them.  
>   
>   
> GPG-Key:  
>   
> https://www.hardened-php.net/hardened-php-signature-key.asc  
>   
> pub 1024D/0A864AA1 2004-04-17 Hardened-PHP Signature Key  
> Key fingerprint = 066F A6D0 E57E 9936 9082 7E52 4439 14CC 0A86 4AA1  
>   
>   
> Copyright 2005 Stefan Esser. All rights reserved.  
>