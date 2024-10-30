---
title: Movable Type 32 Upgrade Woe New Templates
source: 
created: 2024-10-06 21:27:14-07:00
updated: 2024-10-10 14:59:32-07:00
tags:
  - admin
  - post
date: 2005-09-26T13:19:00.000-07:00
published: true
url: /2005/09/movable-type-32-upgrade-woe-new.html
---


I was having the same problem as in this [posting to the MT forum](http://www.movabletype.org/support/index.php?act=ST&f=9&t=53983&hl=mt_trans&s=4750d003ccb0f195b5954ca24c17ea68) after upgrading to the new 3.2 templates by copying them in from the default\_templates directory or from the movable type templates website:  
  

>   
> The footer on my main index seems to be incorrectly displayed:  
> %%time"> | | (0)  
>   
> 1- %% shouldn't be displaying  
> 2- It should say Posted by xyz on August 19, 2005 02:00 PM | Permalink | (0)  
> 3- '>' shouldn't be displaying  
> 4- the permalink should be displaying  

  
  
It turns out that the problem is due to the fact that the new templates in MT 3.2 are really templates for templates in that they contain special tags for internationalization that need to be parsed and replaced with the real template content before you use the templates. So, the default\_templates cannot be just pasted in directly.  
  
The simple solution: Create a new blog. This will have the default templates by default (funny how that works). You now have available any of the default templates that have been fully localized to your blog's language and can now be copy and pasted right into your existing blog.