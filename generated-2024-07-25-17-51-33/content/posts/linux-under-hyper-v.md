---
category:
  - tips
date: "2008-10-09T23:30:10+00:00"
guid: http://www.davidcraddock.net/?p=23
title: Linux under Hyper-V
url: /2008/10/09/linux-under-hyper-v/

---
This is an overview of current Linux support under Hyper-V, the free Windows Server 2008 virtualisation product.

As you probably know, virtual servers allow the emulation of hardware in software. So you have a single physical 'virtual server'. This virtual server emulates the physical hardware for several 'virtual machines' which sit on top of the virtual server. As far as the operating system on the virtual machine is concerned, it doesn't notice anything different at all - it thinks it is running on a full set of dedicated hardware. However in reality, the virtual server is sharing its real physical resouces amongst the collection of virtual machines, assigning for example - 3GB of its memory to virtual machine A, and 1GB to virtual machine B.

Hyper-V requires a package called the 'integration components' to be installed on each virtual machine. This makes it easier for the virtual machine operating system kernel to talk with the virtual server, speeds up and increases the reliability of the emulation of virtual machine hardware by the virtual server.

Hyper-V supports the Xen virtualisation layer. Xen is a Linux-only virtualisation platform that requires a patched kernel on the virtual machine in order for the virtual server to communicate with the virtual machine.

The only officially supported distribution is SuSE Enterprise Linux 10, Service Packs 1 + 2. However because of the way the Hyper-V works, any Xen kernel in theory can be patched to run under Hyper-V.

In fact, this is exactly what you have to do in order to get any Linux distro fully working under the Hyper-V virtual server. So:

1. Download the kernel source for the Xen kernel for your distro
2. Patch it with the Hyper-V integration services patch
3. Compile the kernel

.. and bingo - you should have Linux 'fully supported' by Hyper-V.

Now it remains to be seen whether there are any problems with running Linux under Hyper-V in a live environment. I know that we encountered multiple problems with Linux under VMWare ESX Server - and VMWare is the most mature virtualisation product available.

Those problems included: network interfaces dropping packets and the virtual machine system clock 'drifting' - running too fast or slow. These are NOT problems you want in a live enviroment, and so it remains to be seen whether Hyper-V can support Linux with the same ease as it supports Windows OSs.
