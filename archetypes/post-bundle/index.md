---
date: '{{ .Date }}'
created: '{{ .Date }}'
updated: '{{ .Date }}'
tags:
draft: true
title: '{{ replace .File.ContentBaseName "-" " " | title }}'
---
