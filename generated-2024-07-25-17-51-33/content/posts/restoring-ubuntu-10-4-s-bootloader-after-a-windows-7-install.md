---
category:
  - grub
  - master-boot-record
  - repair-mbr
  - ubuntu-10.4
date: "2010-07-13T13:02:51+00:00"
guid: http://www.davidcraddock.net/?p=781
tag:
  - grub
  - master-boot-record
  - repair-mbr
  - ubuntu-10.4
  - windows-7
title: Restoring Ubuntu 10.4's Bootloader, after a Windows 7 Install
url: /2010/07/13/restoring-ubuntu-10-4s-bootloader-after-a-windows-7-install/

---
I installed Windows 7 after I had installed Ubuntu 10.4. Windows 7 overwrote the Linux bootloader "grub" on my master boot record. Therefore I had to restore it.

I used the Ubuntu 10.4 LiveCD to start up a live version of Ubuntu. While under the LiveCD, I then restored the Grub bootloader by chrooting into my old install, using the linux command line. This is a fairly complex thing to do, and so I recommend you use this approach only if you're are confident with the linux command line:

```
# (as root under Ubuntu's LiveCD)

# prepare chroot directory

mkdir /chroot
d=/chroot

# mount my linux partition

mount /dev/sda1 $d   # my linux partition was installed on my first SATA hard disk, on the first parition (hence sdA1).

# mount system directories inside the new chroot directory

mount -o bind /dev $d/dev
mount -o bind /sys $d/sys
mount -o bind /dev/shm $d/dev/shm
mount -o bind /proc $d/proc

# accomplish the chroot

chroot $d

# proceed to update the grub config file to include the option to boot into my new windows 7 install

update-grub

# install grub with the new configuration options from the config file, to the master boot record on my first hard disk

grub-install /dev/sda

# close down the liveCD instance of linux, and boot from the newly restored grub bootloader

reboot

```
