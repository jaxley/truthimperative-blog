---
title: Who's fault is ID theft and financial fraud?  Ask your bank.
date: 2005-08-19T14:21:00.000-07:00
published: true
url: /2005/08/who-fault-is-id-theft-and-financial.html
tags:
  - security
  - post
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:58:24-07:00
---

Repeat after me: Identifiers are not Authenticators.  
  

  
*   SSN: Identifies you, does not prove your identity. This is a claimed identity on its own.  
    
*   Credit/debit Card Number: Identifies your credit card account, does not prove your identity. Possession or presentment does not prove that the presenter of this information is authorized to make use of it. But that doesn't stop the financial industry from using it as the payment authenticator...  
    
*   ACH/Bank account and routing numbers: Identifies your bank account (along with the type, checking or savings). Again, possession or presentment does not prove that the presenter of this information is authorized to make use of it. Realize that you give this out to everyone and anyone if you send out checks since all the information to transfer money in or out of your account is right there on the check.  
    
*   ITIN: From the IRS website:  
    
    >   
    > **Are ITINs valid for identification?**  
    > No. ITINs are not valid identification outside the tax system. Since ITINs are strictly for tax processing, IRS does not apply the same standards as agencies that provide genuine identity certification.  
    > ITIN applicants are not required to apply in person, and IRS does not further validate the authenticity of identity documents. ITINs do not prove identity outside the tax system, and should not be offered or accepted as identification for non-tax purposes.  
    
      
    

  
  
So, because of this mess, you need to know how to protect yourself. [Know your rights about bank account fraud](http://www.msnbc.msn.com/id/8915217/).  
  
Perry Metzger's posting to the cryptography mailing list recently about the problems of financial fraud were spot on:  
  

>   
> John Denker writes:  
> \> My point here is that knowing who I am shouldn't be a  
> \> crime, nor should it contribute to enabling any crime.  
> \> Suppose you know who I am. Suppose you know my date of  
> \> birth, social security number, and great-great-grandmother's  
> \> maiden name. As Spike said, so what?  
>   
> I tend to agree. It is equally ridiculous to use a credit card account  
> number as the "secret" to authorize a transaction, since that "secret"  
> has to be given out several times a day.  
>   
> \> It's only a problem if somebody uses that \_identifying\_  
> \> information to spoof the \_authorization\_ for some  
> \> transaction.  
>   
> Yes.  
>   
> \> And that is precisely where the problem lies. Any  
> \> system that lets \_identification\_ serve as \_authorization\_  
> \> is so incredibly broken that it is hard to even discuss  
> \> it. I don't know whether to laugh or cry.  
>   
> Again, yes.  
>   
> However, I would like to make one small subtle point. In fact, what  
> you are complaining about is not the use of identification for  
> authorization -- that is a totally separate and equally sad discussion  
> \-- but the use of widely known pieces of information about  
> someone to identify them. The issue is that the bank pretends only you  
> would know your mother's maiden name, not that the bank would only let  
> you withdraw funds. A piece of information that is not widely known  
> but which can be used to establish your identity -- such as a private  
> key only you should know -- is probably fine.  
>   
> So, rephrasing, the problem is not that secret information isn't a  
> fine way to establish trust -- it is the pretense that SSNs, your  
> mom's birth name or even credit card numbers can be kept secret.  
>   
> \> Identifying information cannot be kept secret.  
>   
> I'd amend that to "things like your name, your SSN or your account  
> numbers cannot be kept secret..."  
>   
> \> There's no point in trying to keep it secret. Getting a new SSN  
> \> because the old one is no longer secret is like bleeding with  
> \> leeches to cure scurvy ... it's completely the wrong approach. The  
> \> only thing that makes any sense is to make sure that all relevant  
> \> systems recognize the difference between identification and  
> \> authorization.  
>   
> I have to agree yet again (with my caveats about the terminology you  
> are using).  
>   
> This is yet more reason why I propose that you authorize transactions  
> with public keys and not with the use of identity information. The  
> identity information is widely available and passes through too many  
> hands to be considered "secret" in any way, but a key on a token never  
> will pass through anyone's hands under ordinary circumstances.  
>   
> Perry