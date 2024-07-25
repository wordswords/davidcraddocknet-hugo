---
category:
  - bootcamp
  - dual-boot
  - macbook-white
  - osx
  - windows-7
date: "2010-07-01T22:50:25+00:00"
guid: http://www.davidcraddock.net/?p=769
tag:
  - bootcamp
  - dual-boot
  - macbook-white
  - osx
  - windows-7
title: Windows 7 Gaming on my Macbook
url: /2010/07/01/running-windows-7-on-my-macbook/

---
I have a 2006/2007 Core 2 Duo 2.6ghz white macbook, that I use regularly for internet, music, watching films, itunes and integration with my iPhone.

I wanted to turn my desktop PC into a 'work only' Ubuntu Linux machine, so that I don't get distracted when I'm supposed to be doing something else.

But I still have a lot of PC games that I wanted to play on the Macbook, so I decided to try and setup a windows environment to play games on using Bootcamp 2.0 to create a dual-boot OSX/Windows 7 configuration.

It turns out it works really well. The Macbook runs Windows 7 64-bit edition fine, and although the integrated graphics card isn't designed to run modern games very well, you can get a good gaming experience from small indie games and the older type of PC RPGs that I tend to play. My macbook got a 3.5 rating on the windows experience index for graphics, which is sufficient for many PC games.

First you need to partition your macbook's HD using the Bootcamp assistant, in the OSX utilities section. Make sure you have your first OSX installation DVD to hand, the one that came with your Macbook. I chose to split the hard drive into two equally sized partitions. Then just place your W7 DVD in the drive, and Bootcamp takes care of the rest.

Once W7 is installed, you can access the Bootcamp menu on startup by holding down the option key. This brings up a menu where you can select to boot into OSX or Windows.

When you start W7 for the first time, you can install the windows driver set for your Macbook that Bootcamp provides you. Insert your OSX installation DVD 1, and run the setup.exe that is located in the Bootcamp folder. This will install native windows drivers for your Macbook hardware.

The only change I needed to make for my macbook, was to install the latest 64bit Realtek drivers for Vista/Windows 7, which are located [on the Realtek website](http://www.realtek.com/downloads/downloadsCheck.aspx?Langid=1&PNid=24&PFid=24&Level=4&Conn=3&DownTypeID=3&GetDown=false). This will fix any sound problems you might have while playing games.

Now don't expect to run the latest 3D games, but if you're happy enough with slightly older, classic, indie or retro games, you can get a good gaming experience on Windows 7 from your macbook. It does well with plenty of the indie games available on Value's Steam distribution network.
