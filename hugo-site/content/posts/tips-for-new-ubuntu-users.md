---
category:
  - grub
  - new
  - poweroff
  - reboot
  - ubuntu
date: "2022-09-29T00:00:36+00:00"
guid: http://davidcraddock.net/?p=3270
tag:
  - grub
  - new
  - poweroff
  - reboot
  - ubuntu
title: Tips for new Ubuntu Users
url: /2022/09/29/tips-for-new-ubuntu-users/

---
Here are some extra tips if you're just getting started out on Ubuntu.

1. You don't have to go through the UI to shut down or reboot your computer. You can do it from the command line. The commands are:


   ```
   sudo reboot # to reboot
   sudo poweroff # to shut down and power off the computer

   ```

2. You can get a lot more information on your computers startup and shutdown sequences by removing the default Ubuntu splash screen that obscures this. You should definitely do this if you want to learn more about what your system is
   actually doing under the hood, especially if you need to troubleshoot what it's doing. To do this:


   ```
   sudo nano /etc/grub/default/grub
   # find the line where it says GRUB_CMDLINE_LINUX_DEFAULT and remove 'quiet splash'
   # from this variable. If that leaves the variable empty make sure it is
   # still set as an empty variable, e.g. GRUB_CMDLINE_LINUX_DEFAULT=""
   sudo update-grub
   sudo reboot

   ```


   Now you will see everything that is happening when your system starts up and
   shuts down, or reboots.
