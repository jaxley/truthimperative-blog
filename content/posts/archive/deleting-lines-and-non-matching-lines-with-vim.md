---
title: Deleting Lines And Non Matching Lines With Vim
source: 
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-10 14:58:14-07:00
tags:
  - post
date: 2010-05-15T03:53:00.000-07:00
published: true
url: /2010/05/deleting-lines-and-non-matching-lines.html
aliases:
  - Deleting-lines-and-non-matching-lines-with-vim
linter-yaml-title-alias: Deleting-lines-and-non-matching-lines-with-vim
---


I'm always forgetting how to do this but here's how to delete matching lines:  

> :g/.\*foo.\*/d

And the more difficult thing to do that vim makes easy is deleting non-matching lines.  All you do is negate the pattern:  

> :g!/.\*foo.\*/d

[Daily Vim: Text Editor Tips, Tricks, Tutorials, and HOWTOs: Delete Lines Matching Keyword](https://dailyvim.blogspot.com/2008/03/delete-lines-matching-keyword.html)