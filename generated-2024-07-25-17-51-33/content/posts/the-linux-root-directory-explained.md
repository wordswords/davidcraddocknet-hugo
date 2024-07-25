---
category:
  - /dev
  - /etc
  - /home
  - /proc
  - /root
  - /sys
  - explained
  - linux-root-directory
  - root-directory-tutorial
  - tutorials
date: "2010-03-20T15:19:46+00:00"
guid: http://www.davidcraddock.net/?p=572
tag:
  - /dev
  - /etc
  - /home
  - /proc
  - /root
  - /sys
  - explained
  - linux-root-directory
  - root-directory-tutorial
title: The Linux Root Directory, Explained
url: /2010/03/20/the-linux-file-structure/

---
[![](/wp-content/uploads/2010/03/got-root.jpg)](/wp-content/uploads/2010/03/got-root.jpg) It's helpful to know the basic filesystem on a Linux machine, to better understand where everything is supposed to go, and where you should start looking if you want to find a certain file.

Everything in Linux is stored in the "root directory". On a windows machine, that would be equivalent to C:. C: is the main folder where everything is stored. On Linux we call this the "root directory", or simply "/". To go up to this root directory, type:

```
cd /
```

To list all the folders and files in the root directory, type this:

```
ls /
```

Alternatively, if you want to see the folders and files exactly the way I see them below for easy comparison, type this:

```
ls -lhaFtr --color /
```

Once you've typed in one of the 'ls' commands above, you'll see some information similar to that on the screenshot below.. (please scroll down)..

**Ubuntu Linux** [![](/wp-content/uploads/2010/03/1348573631.png)](/wp-content/uploads/2010/03/1348573631.png)

Above you can see the files and folders in the root directory of my ubuntu linux server, after I've typed 'ls /'. Ignore everything but the coloured names on the right, those coloured names are the names of the files and folders in this directory. Don't worry about the shades of different colours either. It's not really important to explain how they are coloured right now, just to explain the purpose behind each file or folder shown.

So let me explain the purpose behind each of these, in turn. I'll include the same screenshot multiple times, so you can reference the explanations against it as you scroll down.

```
selinux/
```

 \- Directory for linux security features, rarely visited by normal users like you or me.

```
mnt/
```

 \- Traditional directory for the files from removable media, ie USB keys, external hard drives. Not used anymore, it only exists for historical purposes.

```
lost+found/
```

 \- Directory where files and directories end up when they've been recovered from a hard disc repair.

```
 cdrom -> media/cdrom/
```

 \- Link the files currently in your CDROM or DVDROM drive.

```
media/
```

 \- New style directory for the files from removable media such as USB keys, external hard drives, etc. This is the new convention, and so you should always use media/ instead of mnt/, above.

```
vmlinuz.old -> boot/vmlinuz-2.6.31-17-generic
```

 \- A backup of your most recent old Linux operating system kernel, ie: your operating system. Don't delete this =)

```
initrd.img.old -> boot/initrd.img-2.6.31-17-generic
```

 \- Another part of the backup for your most recent old Linux kernel.

[![](/wp-content/uploads/2010/03/1348573631.png)](/wp-content/uploads/2010/03/1348573631.png)

```
opt/
```

 \- An empty directory reserved for you to put third-party programs and software in.

```
lib/
```

 \- Operating system drivers and kernel modules live here. Also contains all system libraries, so when you compile a new program from the source code, it will use the existing code libraries stored here.

```
bin/
```

 \- Basic commands that everyone uses, like "ls" and "cd", live here.

```
usr/
```

 \- This is where all user-supplied software should go; ie: software that you install that doesn't normally come with the operating system. Put all programs here.

```
sbin/
```

 \- Basic but essential system administration commands that the admin user only uses, ie: reboot, poweroff, etc.

[![](/wp-content/uploads/2010/03/1348573631.png)](/wp-content/uploads/2010/03/1348573631.png)

```
vmlinuz -> boot/vmlinuz-2.6.31-20-generic
```

 \- Your actual operating system kernel, ie: the one that is running right now. Don't delete this.

```
initrd.img -> boot/initrd.img-2.6.31-20-generic
```

 \- Another part of the kernel that is running right now.

```
boot/
```

 \- Reserved for Linux kernel files, and other things that need to be loaded on bootup. Don't touch these.

```
proc/
```

 \- Proc is a handy way of accessing critical operating system information, through a bunch of files. Ie: try typing 'cat /proc/cpuinfo'. That queries the current kernel for the information on your processors (CPUs), and returns the info for you in a text file.

```
sys/
```

 \- Like proc/, this is another bunch of files that aren't files at all, but 'fake' files. When you access them, the operating system goes away and finds out information, and offers that information up as a text file to you.

```
dev/
```

 \- Device files. In here live the device files for your hard drives, your CD/DVD drives, your soundcard, your network card.. in fact anything you have installed that Linux uses, it has a counterpart in here that is automatically added and removed by the OS. Don't ever delete, move or rename any of the files here.

```
home/
```

 \- The directory that you'll use the most. Every user on your Linux machine, except the system administrator, has a folder here. This is where each user is meant to store all their documents. Think of it as the Linux 'My Documents' folder.

[![](/wp-content/uploads/2010/03/1348573631.png)](/wp-content/uploads/2010/03/1348573631.png)

```
var/
```

 \- This is a catch-all directory for 'variables', ie things that the OS has to write to, and vary, as part of its operation. Examples include: email inboxes for all users, cache files, the lock files that are generated and removed as part of normal program execution, and also the /var/www directory. /var/www is a directory you will probably see and use a lot, as it is where all the websites are stored that your linux machine serves when operating as a web server. /var/log is also a very important directory, and contains 'log' files which is a kind of "diary" that the linux OS uses to explain exactly what it's done, as it happens, so you can easily find out what's been going on by viewing the right log file.

```
tmp/
```

 \- The space for any and all temporary files. Store files here that you want to throw away quite quickly. Depending on your configuration, all files and folders in the /tmp directory may be deleted on system reboot, or more frequently, perhaps every day.

```
root/
```

 \- This is the system administrators 'my documents' folder. Anything that the sysadmin stores, for example: programs that he downloads, are put here. Not accessible to anyone else but the system administrator.

```
etc/
```

 \- Configuration files. Any and all program configuration files or information belong here. Think of it like the windows registry, except every registry entry is a text file that you can open up and edit, and also copy, move around, and save. You will typically have to create configuration files yourself sometimes, and put them in this directory. They are almost always simple text files.

[![](/wp-content/uploads/2010/03/1348573631.png)](/wp-content/uploads/2010/03/1348573631.png)

And that's a basic overview of the files and folders in the root directory of your linux machine.
