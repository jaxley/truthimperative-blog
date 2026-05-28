---
title: Authorization Model Fundamentals
source:
created: 2019-10-23 13:59:35-07:00
updated: 2025-10-09 15:45:53-07:00
tags:
  - authorization
  - jaxley/my_writings
  - identity
  - jaxley
  - favorite
  - blog_idea
aliases:
  - Authorization Model Fundamentals
linter-yaml-title-alias: Authorization Model Fundamentals
draft: true
---
# Scratchpad

- Why this article?
	- Auth issues are 40% of the OWASP top 10, etc.
	- Key terminology
	- Design issues
		- human vs. machine identities
		- delegated authority
		- Granularity
- What is an authorization model?
	- Layperson's understanding of common models - mostly Discretionary Access Control
		- OAuth / OIDC
		- Access Control List
		- RBAC
		- ABAC
		- TBAC
	- Mandatory Access Control
		-
- AuthN vs. AuthZ and why this matters
	- Why identity matters - OIDC vs. OAuth?
- Common Problems
	- Confused Deputies
	- Attribute and tag-based threats
- Theoretical underpinnings of authorization
	- Opportunity for provable security

# Authorization Model Fundamentals


----
## Previous
==EG is currently involved in building a new core platform for authentication and authorization. During various discussions, the topic of whether human users are special/distinct from machine users== comes up occasionally, and inspired me to set out some of the fundamentals of authorization models to provide a level-set on common terminology and relations in this space.

Some may think that these concepts originated in Java [JAAS](https://en.wikipedia.org/wiki/Java_Authentication_and_Authorization_Service) and are therefore Java-specific, but the foundations were laid long before that was released in 2002 in [J2SE 1.4](https://en.wikipedia.org/wiki/Java_version_history#J2SE_1.4). You can see similar concepts in the [Windows security model](https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/security-principals).

> [!TODO]
> this needs a good introduction for this document.

Authentication and Authorization are often confused for one another or discussed ambiguously as “auth”.  It doesn’t help when standards like [OAuth 2.0](https://tools.ietf.org/html/rfc6749) do not make this fundamental difference explicit (it should really be named OAuthz).

> [!TODO] fix definition links

*[Authentication](https://dictionary.exp-tools.net/v/authentication) (AuthN):*

- Concerned with ***who*** a user is

*[Authorization](https://dictionary.exp-tools.net/v/authorization) (AuthZ):*

- Concerned with what a user is entitled to ***do***

These systems are critical security controls for most any system at many layers of systems architecture (Network, operating-system, application, etc.).

It may be helpful to have a theoretical appreciation of the conceptual aspects of these systems as a baseline to ground understanding and appreciate the role that properly-designed authorization **models** can have in simplifying identity and policy management, providing expressiveness for policy statements (is one model able to sufficiently *express* the desired policy vs another?), and security assurance (e.g. does one design vs. another provide better security properties by design?).

You may not be aware that there’s a lot of computer science behind these models.  “Rolling your own” authorization model is somewhat analogous to thinking you can simply build a relational data store without understanding relational calculus.

## Authorization Fundamentals

In a canonical authorization model, there is a subject -> object relationship.

![](/attachment/e59837c3fa3e8d8237a115959f4d69b2.png)

Let’s say that a subject wishes to interact with the object.  In order to interact with that object, the subject needs to be authorized.

But, in order to be authorized, the subject needs to present proof of authorization.  There are many different authorization models out there and each handle this differently.

Subjects obtain this proof of authorization by first ***proving their identity*** to an authority (authenticating).

Nothing about a subject -> object relationship in any way constrains this model to People or Applications.  Treating different subjects differently in an authorization system adds complexity to the **design** that can have negative security consequences.  All subjects can thus be modeled the same way and be granted authorizations consistently after proving their identity.

Access rights can be abstractly modeled by an access matrix.  The subject access is defined in rows and objects in each column. The intersections of the rows and columns are the entitlements granted for that subject -> object relation.  (The model also defines **operations** for manipulating access rights)

|     |     |
| --- | --- |
|     | Objects |
|     |     | /tmp | /home/alice | /home/bob | /root |
| Subjects | Alice | rw  | rw  | –   | –   |
| Bob | rw  | –   | rw  | –   |
| Other | –   | –   | –   | –   |

You’ve probably heard of an Access Control List (ACL).  You derive an ACL from each **column** of an access matrix.

Managing access at this granular a level (individual users) is not generally feasible in large, complex systems. So various *authorization models* exist to help provide different ways of simplifying access management, and reasoning about the security of the system (knowing who can access what — and ensuring that users can’t access things they shouldn’t)  Some systems group *users* into groups to reduce the number of rows in the matrix.  So, instead of subject -> object, you have group -> object relations to manage.

![](/attachment/8f1cd0b62b73420e35700138e78ce82c.png)

Other models, such as Role-Based Access Control (RBAC) take a different approach and group *permissions* together into *roles*.  Instead of an ACL containing individual permissions, it would assign subject -> role(s) and then the permissions -> role(s).

![](/attachment/dfaf012bae8e27e8f84e186006dff8a3.png)

Yet another model manages access by *row*. This is the object->capability model.  Users are issued unforgeable references (capabilities) that are themselves tokens that designate that access is allowed. The subject -> capabilities association includes all of the resources and permissions that the subject has been granted at that time.

![](/attachment/138f9b6a260cc29e2100edd8491e924b.png)

[Attribute-Based Access Control](https://en.wikipedia.org/wiki/Attribute-based_access_control) (ABAC) is yet another model. This model is based on access policies that evaluate various user and contextual attributes. Imagine a policy that allows access based on the time of day, the user’s management level and whether their email address has a domain ending in company.example.com.

 ![](/attachment/16fbeb1bbd08e07798eed0dfab8028ca.png)

These are all examples of what is known as Discretionary Access Control (DAC) systems.  These allow access to be granted at the discretion of the Subjects involved in the system.  There’s a whole other different kind of model known as Mandatory Access Control (MAC) systems where access is controlled by system-level policies managed by a policy administrator.  Some are used in military applications to prevent leakage of classified material. More familiar systems provide baseline “guardrails” that cannot be changed at will, such as AWS [Service Control Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html)  You may see these MACs referred to as “permission boundaries” in systems like [AWS IAM.](https://aws.amazon.com/blogs/security/delegate-permission-management-to-developers-using-iam-permissions-boundaries/)

!["Permissions boundary: | Effective permissions 1AM permissions policy: Defined by the for IAM principals that Defined by the employee administrator | are created by the employee"](/attachment/df8cc78f7f0baa2bc85360d75d7a1799.png)

### Delegated Authority

A subject can also be granted a **delegated authority** to operate on behalf of another subject. This can also be modeled as just another authorization.

==For example, Expedia today is granted limited delegated authority to access Facebook profile data for users logging in with Facebook Connect.  Expedia is the subject; the Facebook user’s profile is the object.==  The Facebook user may or may not be present when we access this information. We have a delegated authority to access it, authorized by the access token.

> [!TODO] generify the example and provide a lead-in to explain

subject -> object
Expedia -> Facebook User A's Profile

Expedia as a subject also may possess **other** authorizations specific to its principal (in the form of a client_id)

*Principal:*  “any active entity in system with access privileges that are in **any way** distinct from some other component it talks to. Corollary: a principal is defined by its [domain of access](https://en.wikipedia.org/wiki/Security_domain) (the set of things it has access to).” [calculus-of-threat-modeling][^1]

A subject may be associated to one or more principals and may use different credentials to prove they are associated with each principal.

![](/attachment/3b05e79406acc22ff5343a3bbaf54a58.png)

![](/attachment/ea87c9df71ea582f98db9985fbb7ee3c.jpg)


It does not matter that the subject in this case is a human or not; the authorization system is opaque to the actual entity on the other end (Nobody knows you’re a dog on the Internet).  That offers a great deal of simplification since the system interprets authorization information consistently no matter who might be on the other end.

### Confused Deputies

Authorization systems get into real trouble when they get confused about which authority (access granted to a principal) an operation should be invoked under. This needs to be very clear in any contract and explicit, wherever possible.  This is known as the Confused Deputy problem: An authorization system can make an error and can apply the wrong authorizations if either the client is ambiguous as to which authority it presents when making a request for an object, or there is a mistake by design where authorization system has to coalesce multiple competing identities into a composite in order to make a security decision.

This happens in UNIX with setuid programs, for example.  When invoked, the system is presented with two very different identities. The “real” one, and the “effective” one.  Unfortunately in this design, it’s up to the **application** developer to remember to contain operations requiring higher privileges to a critical section and remember to drop those privileges when done. In some cases, errors can prevent the privileges from being dropped. Or a vulnerability in the critical section allows code to be invoked under the wrong authority.

A better system is one that makes the authority to use for a request explicit by design.

### Provable Security

Just like cryptography, the uninitiated developer can “roll their own” access control model that appears secure on its face, but may not be in practice. Determining the ***safety*** of an access control model is a hard problem in Computer Science.  The scientific question for an access control model is:  Given a specific starting state of an access control matrix, and rules for managing privileges, can any properties of all reachable states be proven (mathematically)?  Or the inverse — can we prove that an undesirable state is *not reachable*? These are the “safety properties” of an access control system.  It’s desirable to understand the theoretical limitations of an access control system

Another way to think about this is “Given a general security model of a real system and a particular requirement of condition of security–for example, an employee must not be allowed to access file x directly or indirectly–can you decide whether a system is secure?” [inside-java-2] [^4]  Turns out that in computer science, for most general models, this problem is *undecidable* (NP-complete).

### References

[^1]: [calculus-of-threat-modeling] “The Calculus of Threat Modeling”, Dr. Crispan Cowan, [https://www.leviathansecurity.com/blog/the-calculus-of-threat-modeling
[^2]: [analysis-dac-mac-rbac] “Analysis of DAC MAC RBAC Access Control based Models for Security”, Jayant, Bokefode et al., International Journal of Computer Applications (0975 –8887) Volume 104 –No.5, October 2014, https://pdfs.semanticscholar.org/45a2/775770d870b8675fb1301919224c9bcb7361.pdf
[^3]: [handouts-secappdev-access-control] “Access Control”, Dr. George Danezis, https://handouts.secappdev.org/handouts/2014/George%20Danezis/Access-Control.pdf
[^4]: [inside-java-2-security] “Inside Java 2 Platform Security: Architecture, API Design, and Implementation”, Li Gong, Gary Ellison, Mary Dageforde, https://books.google.com/books?id=XfWlYWVzo20C&lpg=PA11&dq=java%20security%20model%20np-complete%20decidable&pg=PA11#v=onepage&q=java%20security%20model%20np-complete%20decidable&f=false