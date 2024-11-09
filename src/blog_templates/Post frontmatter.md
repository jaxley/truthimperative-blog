---
<%*
  var theTitle = tp.file.title
  if (theTitle.startsWith("Untitled")) {
    theTitle = await tp.system.prompt("Title");
    await tp.file.rename(`${theTitle}`);
  }
-%>
title: <% theTitle %>
description: 
created: <% tp.file.creation_date("YYYY-MM-DD HH:mm:ssZ") %>
updated: <% tp.file.creation_date("YYYY-MM-DD HH:mm:ssZ") %>
tags:
  - post
date: <% tp.file.creation_date("YYYY-MM-DD HH:mm:ssZ") %>
published: false
url: 
hasAsides: false