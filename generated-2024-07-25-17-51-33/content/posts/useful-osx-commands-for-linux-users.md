---
category:
  - osx-commands
  - osx-differences
  - osx-differences-from-linux
  - osx-terminal-commands
  - tips
date: "2010-03-19T23:03:33+00:00"
guid: http://www.davidcraddock.net/?p=555
tag:
  - osx-commands
  - osx-differences
  - osx-differences-from-linux
  - osx-terminal-commands
title: Useful OSX commands for Linux users
url: /2010/03/19/useful-osx-command-line-commands/

---
I wrote this list to remind me, as a newcomer to OSX, how the command line differed from the Linux commandline. I thought I'd expand on it, and share it:

**To mount any iso:**

```
hdiutil mount sample.iso
```

 **To download a file as you would using wget:**

```
curl http://ftp.heanet.ie/pub/linuxmint.com/stable/8/LinuxMint-8.iso -o linuxmint.iso -C -
```

the -o specifies the output file (required)
the -C - specifies automatically resuming if possible.

**To burn a bootable iso to CD, DVD or USB key:**
use the "diskutil" program as described in: [http://forums.macrumors.com/showthread.php?t=598291](http://forums.macrumors.com/showthread.php?t=598291) **Monitor disk io utilisation.. poll once per second**

```
iostat -c 99999
```

will run until 99999 seconds have passed.

**Monitor CPU and memory utilisation.. polling per second**

```
top
```

Just like Linux.

**Mount Windows Shares**

```
mount -t smbfs //@/
```

ie:

```
mount -t smbfs //davec@SERVER/Dev samba-to-netdev
```

then it will appear mounted in /Volumes with the mount point name you supplied, ie: /Volumes/samba-to-netdev/.
