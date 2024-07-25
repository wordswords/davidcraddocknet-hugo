---
category:
  - adb
  - adb-devices
  - adt
  - android-developer-tools
  - detect
  - emulator
  - osx
  - stability
date: "2013-11-17T02:21:34+00:00"
guid: http://www.davidcraddock.net/?p=1150
tag:
  - adb
  - adb-devices
  - adt
  - android-developer-tools
  - detect
  - emulator
  - osx
  - stability
  - ubuntu
title: Android Debug Bridge failing to detect emulators under OSX
url: /2013/11/17/android-debug-bridge-failing-to-detect-emulators-under-osx/

---
[![Android](/wp-content/uploads/2013/11/android.png)](/wp-content/uploads/2013/11/android.png)

I've been working on a project at the BBC where we are using the Android command-line tools from the [Android Developer Tools](http://developer.android.com/tools/index.html), to spin up and terminate series of emulators. I noticed a big problem under OSX where 'adb devices' was failing to register emulators occasionally when we started them up, without any error message, even though they were loaded and quite clearly running in a window on OSX. This was a real problem for our project because we needed absolute parity between emulator process being launched and subsequently being detected by adb.

We switched to using adb with emulators in an Ubuntu 12.04 VM running under OSX, and we had no further problems with our setup. Emulators will now be programatically launched and torn down by our monitoring application. We now have an array of emulators which we can deploy to at will, which is very useful.

I don't know what has caused this problem, my only hunch is that the Android toolkit was probably developed in a very Linux-heavy environment, and so adb on Linux was probably their first testing platform. All I can say is that Linux is much more stable than OSX, even as a VM, for Android emulation.
