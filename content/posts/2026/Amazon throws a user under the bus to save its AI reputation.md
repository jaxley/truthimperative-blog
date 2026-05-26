---
title: Amazon throws a user under the bus to save its AI reputation
description:
created: 2026-02-28 07:51:22-08:00
updated: 2026-02-28 07:51:22-08:00
tags:
  - post
date: 2026-02-28 07:51:22-08:00
draft: true
url:
hasAsides: false
---
Reporting revealed that Amazon has experienced at least two outages correlated with its AI tooling.[^1] The most recent was a 13-hour interruption, which affected the AWS cost explorer. Apparently, the AI agent, Kiro, decided the best course of action was to “delete and then recreate” a part of its environment.

Amazon wrote a blog post disputing the reporting. [^2] Since I no longer work at Amazon or AWS security, I can review this event and the response from the perspective of an outsider.

My view on this is that the blog post is not describing a typical blameless issue investigation that I am familiar with. Instead, it throws the human under the bus rather than admit that AI tooling may have been at fault. They also attempt to dispute facts that seem to have been corroborated by several internal employees and contradict what appear to be previous Amazon statements to the FT. I'd take their denial with a heavy dose of skepticism. Because they talk about excessive access as a factor, that does not
## Blame-Game

Amazon claimed that the outage, "was the result of user error". In AWS appsec, we worked very hard to investigate "issues" like this in a blameless way. The way this is phrased is explicitly user-hostile. I'm shocked that this explicit language throwing a user under the bus passed muster of the MAPS team that manages public communications. I hope for everyone working at Amazon and its customers that it was an isolated incident and not a 180 degree pivot away from a blameless postmortem culture. If not, there's no way that issues like this will be investigated properly to identify and FIX the *real* contributing causes. We had a mantra - we identify missing *mechanisms*, not *people*, that led to an issue occurring. Blaming a person is a non-answer because it tells you nothing about what happened that would inform how you could achieve a different outcome in the future. All you would be left with to improve would be: "humans will not make any mistakes in the future", which is laughable.

Every week we write up narratives for Amazon senior executives that explain what happened, who owns what action-items from the "issue" (engineers, appsec, secops, etc.), and when those action items will be completed. Those all get tracked and followed-up on. When I was there, would not accept an action item specific to an individual person involved in an issue!

## The Spin

> "affect\[ed] a single service...in one of our 39 Geographic Regions around the world" [^2]

> The company said the incident in December...affect\[ed] only a single service in parts of mainland China. [^6]

This is just intellectually dishonest. You can see that Cost Explorer is only in *exactly ONE* China region (The consumer region (us-east-1) and EU cloud are airgapped, isolated regions).[^3] So the cost explorer outage affected 100% of the AWS China region. That sounds a lot worse than 1 / 39, because it is.

> "It did not impact compute, storage, database, AI technologies, or any other of the hundreds of services that we run." [^2]

This is a complete red herring that serves no purpose in the document except to spin how severe the outage was. Translation: "Why are you picking on us for a single service outage? Only 0.5% of all 200 AWS services were affected. Most customers didn't notice anything! Our services in China overall were 99.5% available and even more available outside of China!"

> "We did not receive any customer inquiries regarding the interruption" [^2]

Translation: "We managed to have a 100% outage of this service for 100% of AWS customers but nobody noticed" This may be a self-own that says more about what AWS customers in China think of the AWS Cost Explorer service.

> "We implemented numerous safeguards to prevent this from happening again—not because the event had a big impact (it didn't)" [^2]

Amazon writing is *very precise* The adjective "big" above that modifies "impact" would be flagged as a "weasel word"[^4] in a document review because it is vague. Vague writing does not communicate valuable information to the reader. Time is valuable, so writing that communicates zero information is a waste of the reader's time. What is the definition of "big"? From whose perspective? Perhaps Amazon didn't lose any customers based on this issue so the writer means that the impact *to Amazon* was negligible or zero? Notice how the context can completely change how a reader should interpret the outage? If the writer is addressing impact to *AWS customers*, then saying there wasn't a big impact is at best, making a value judgment on behalf of its customers and at worst, is gaslighting[^5] their customers.

The Amazon response also attempts to rebut the article that there were two AI-related "events".

> The Financial Times' claim that a second event impacted AWS is entirely false [^2]

However, the existence of two "events"/"instances" was affirmed *by Amazon* in the original FT article, using one quote *from Amazon* itself and another paraphrased quote (emphasis added):

> “In **both** instances, this was user error, not AI error,” Amazon said, adding that it had not seen evidence that mistakes were more common with AI tools.[^6]

> Amazon added that The Amazon response does not dispute the quotes in the article - they just flat-out deny those are true. We're supposed to believe Amazon *now* but not Amazon *in the original article*, nor other confirmations sourced from "multiple Amazon employees" did not have an impact on a “customer facing AWS service”. [^6]

We're supposed to believe Amazon PR *now* but not Amazon *in the original article*, nor the other confirmations sourced from "multiple Amazon employees". It is possible that they are playing semantic games. It could be true that "a second event" didn't impact "AWS" -- a second event could have instead impacted Amazon retail!

## The "Fix"

Later, Amazon's response includes tidbits to reassure customers that although they claim this was a non-issue, they take security very seriously:

> "We implemented numerous safeguards to prevent this from happening again..." [^2]

I can't help but call out the vague language here. What does "this" refer to in the sentence? If we believe the AWS position that the "cause" was "user error", then the above sentence could be rewritten:

> "We implemented numerous safeguards to prevent *user error* from happening again" [^2]

How did they fix "user error"? Did they change the user (fire them)? Or did they change something external to the user? If they changed something external to the user, then that undermines the claim that the cause was "user error". If changing the environment around a user "prevents" the issue, then I'd argue that the issue *was NOT the user to begin with!*

> additional safeguards include mandatory peer review for production access [^2]

==TODO...==
## About CoE

> For more than two decades, Amazon has achieved high operational excellence with our Correction of Error (COE) process... [^2]

I'll bite my tongue on the additional weasel words "high operational excellence".... I want to talk about the reference here to the COE process. Nowhere in the narrative did they say "we conducted a COE" to arrive at the list of safeguards. The reference to it here could be tactic to get the reader to conclude that they conducted a COE.

Not every problem gets investigated via a COE. Issues get reviewed weekly and a narrative may be written that describes the cause and action items for senior leadership. Many don't get a narrative and are just tracked to ensure action items get closed. Sometimes, a COE is recommended as an action item to dig deeper into the problem than you can expect to do at a moment's notice (I've recommended these several times). COEs don't necessarily follow a non-linear, systems-thinking approach. It's completely dependent on who is conducting the deep-dive. The typical procedures recommend using the "5 whys" and talk about "root" cause so they tend to be biased toward linear thinking analyses. Because of this, they don't always go deep enough to identify the right problems to solve past the surface issues.

This recent article [Why I don’t like “Correction of Error” – Surfing Complexity](https://surfingcomplexity.blog/2025/12/20/why-i-dont-like-correction-of-error/) echoes my thoughts on the problems with the name of this process that Amazon uses.

Note: Surprisingly, they use the word "incident" in the blog post. This was typically a verboten word for public statements about security.

[^1]: Down, A. (2026). Amazon’s cloud ‘hit by two outages caused by AI tools last year’. the Guardian. Retrieved from https://www.theguardian.com/technology/2026/feb/20/amazon-cloud-outages-ai-tools-amazon-web-services-aws

[^2]: Staff, A. (2026). Amazon News. Amazon News. Retrieved from https://www.aboutamazon.com/news/aws/aws-service-outage-ai-bot-kiro

[^3]: AWS Services and Regions. (2026, January 19). Retrieved from https://www.aws-services.info/costexplorer.html

[^4]: Lasn, T. I. (2024). Amazon's 'No Weasel Words' Rule. Trevor I. Lasn. Retrieved from https://trevorlasn.substack.com/p/amazons-no-weasel-words-rule

[^5]: Contributors to Wikimedia projects. (2025, December 14). Gaslighting - Wikipedia. Retrieved from https://en.wikipedia.org/w/index.php?title=Gaslighting&oldid=1327455901

[^6]: Rosner-Uddin, R. (2026). Amazon service was taken down by AI coding bot. Financial Times. Retrieved from https://www.ft.com/content/00c282de-ed14-4acd-a948-bc8d6bdb339d
