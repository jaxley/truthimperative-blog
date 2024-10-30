---
title: Debugging Nunit Tests In Visual Studio Express
source: 
created: 2024-10-06 21:06:26-07:00
updated: 2024-10-10 14:59:15-07:00
tags:
  - post
date: 2008-05-19T15:09:00.000-07:00
published: true
url: /2008/05/debugging-nunit-tests-in-visual-studio.html
aliases:
  - Debugging-nunit-tests-in-visual-studio-express
linter-yaml-title-alias: Debugging-nunit-tests-in-visual-studio-express
---


One of the annoying things about VS Express (other than it for some reason not saving my user preferences) is that there is not an easy way to debug nunit tests from within the UI. There is also no way to attach to a process to debug, which is going to limit asp.net development utility. Maybe VS 2008 Express is improved in this regard? I'll download and see.  
  
Here are two great ways to debug nunit tests. I opted for the simpler option of creating a .csproj.user file and adding the section to each of the <PropertyGroup&gt; sets like so:  
```
    ...<br />    <StartAction>Program</StartAction><br />    <StartProgram>C:\\Program Files\\TestDriven.NET 2.0\\NUnit\\2.4\\nunit.exe</StartProgram><br />  </PropertyGroup><br />
```  
[Stu's Blog: Debugging NUnit in Visual Studio Express](http://stewartr.blogspot.com/2006/09/debugging-nunit-in-visual-studio.html)