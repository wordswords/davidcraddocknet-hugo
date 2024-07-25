---
category:
  - tutorials
date: "2008-02-28T23:56:17+00:00"
guid: http://www.davidcraddock.net/?p=12
title: 'A poor man''s VMWare Workstation: VMWare Server under Ubuntu 7.10 + VMWare Player under Windows XP'
url: /2008/02/28/a-poor-mans-vmware-workstation-vmware-server-under-ubuntu-710-vmware-player-under-windows-xp/

---
I finally setup my Dell Lattitude D630 laptop the way I wanted it last night, and thought I'd do a quick writeup about it. Here is the parttition table:

1. A 40GB Windows XP partition, with VMWare Player installed, which I will be using for Windows applications that don't play well in virtualised mode (eg media applications). I will also be using it as the main platform for running VMs.
2. A basic 5GB root + 1.4GB swap 7.10 Ubuntu server partition, with VMWare Server installed (for creating, advanced editing and performing network testing on VMs). I used these [VMWare server on Ubuntu 7.10](http://x86virtualization.com/virtualizationnews/howto-install-vmware-server-on-ubuntu-710-part-1.html) [tutorials](http://x86virtualization.com/virtualizationnews/howto-install-vmware-server-on-ubuntu-710-part-2.html).
3. A 36GB NTFS partition for storing VMs
4. A 26GB NTFS media partition for media I want to share between VMs and the two operating systems on the disc.

We use VMWare servers at work to host our infrastructure, so this setup will be very useful for me. I can now:

1. Take images off the servers at work and bring them up, edit them and test their network interactions under my local VMWare Server running on my Linux install.
2. From within my windows install, I can bring up a Linux VM and use Windows and Linux side by side.
