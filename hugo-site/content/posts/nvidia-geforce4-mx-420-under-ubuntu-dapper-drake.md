---
category:
  - solutions-to-a-specific-problem
date: "2007-04-09T18:26:36+00:00"
guid: http://www.davidcraddock.net/?p=3
title: NVIDIA GeForce4 MX 420 under Ubuntu Dapper Drake
url: /2007/04/09/nvidia-geforce4-mx-420-under-ubuntu-dapper-drake/

---
My GeForce4 MX 420 didn't work properly with OpenGL under a fresh install of Dapper Drake. Fixing it, however, proved to be really easy:

1) Install the nvidia package:

> $ apt-get install nvidia

2) Edit /etc/X11/xorg.conf and replace the 'driver' where it says 'nv' with "nvidia":

> Section "Device"
>  Identifier "NVIDIA Corporation NV17 \[GeForce4 MX 420\]"
>  #Driver "nv"
>  Driver "nvidia"
>  BusID "PCI:1:0:0"
> EndSection

3) Kill X with control-alt-backspace

4) Login again and test if it works by running glxgears and glxinfo on the console
