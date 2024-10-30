---
title: Using VNC to securely connect to OSX without exposing an unlocked console
date: 2014-04-13T22:27:00.003-07:00
published: true
url: /2014/04/using-vnc-to-securely-connect-to-osx.html
tags:
  - security
  - apple
  - post
created: 2024-10-06 21:06:25-07:00
updated: 2024-10-11 08:00:53-07:00
---

I couldn't believe how supremely difficult it is to _**securely**_ use VNC to access an OSX mac remotely.  Turns out that by default, using a standard VNC client (as opposed to an Apple Remote Desktop client) does not afford you an option to have the physical console lock when someone connects to the VNC server.  Some third-party clients make this an option, but all that I could find were paid VNC clients that support it.  It is somewhat ridiculous that this setting is left to the _client_ rather than enforced on the _server_, but I digress...  
  
I tried a few things suggested, such as enabling the screen saver or screen blanker, but those did not solve the problem as they did not differentiate between the VNC session and the physical desktop session so applied equally (the only states that were valid were either both unlocked or both locked).  Other options people suggested were to just turn the screen brightness all the way down.  This is security through obscurity though (the display is still unlocked and anyone who can get to your mouse/keyboard could mess with your computer, they just would be blind to what's on the screen).  It also seems problematic for usability (imagine you turn the brightness down and then come into the office the next day; how are you supposed to see the screen when you login if the brightness is still forced to the minimum?)  
  
The solution I found that had the right security and usability properties was to use fast user switching + the Vine VNC Server.  This enables you to have a different set of content on the physical display from what you see remotely on VNC.  Unfortunately, fast user switching with the Apple VNC "Screen sharing" server doesn't work.  It mirrors your display exactly to the VNC display so does not allow you to have separate physical and remote displays.  I presume that's why it has a name like "Screen sharing".  It's also not surprising that this doesn't quite work as well outside of the Apple monoculture.  

1.  [Download](http://www.testplant.com/dlds/vine/) and install [Vine VNC Server](http://www.testplant.com/eggplant/testing-tools/vine-vnc-for-mac/)
2.  Enable Fast User Switching on the mac

![](/FastUserSwitching.png)

Enable fast user switching on OSX Mavericks

4.  Connect to Vine VNC Server on OSX with any VNC client (e.g. on port 5901).  I configure Vine to require SSH so it doesn't listen to any remote port and requires SSH port tunneling to use it.  Less attack surface.
5.  Go to the fast user switching menu and select "Login Window..."  When you do this, the physical display will change to the login screen but the VNC window will remain unlocked and functional, as desired.

![](SwitchToLoginWindow.png)<details>@ = Fri 11:54 AM
© @ Iason axiey ~
Login Window...
Users & Groups Preferences...
</details>


Switch to login screen