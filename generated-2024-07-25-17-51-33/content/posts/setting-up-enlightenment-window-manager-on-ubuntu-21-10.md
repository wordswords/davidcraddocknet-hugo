---
category:
  - chmod
  - enlightement
  - enlightement_system
  - suit
date: "2021-11-18T08:54:42+00:00"
guid: https://davidcraddock.net/?p=2829
tag:
  - chmod
  - enlightement
  - enlightement_system
  - suit
  - ubuntu
  - ubutu-21.10
  - window-manager
title: Setting up Enlightenment window manager on Ubuntu 21.10
url: /2021/11/18/setting-up-enlightenment-window-manager-on-ubuntu-21-10/

---
[Enlightenment](https://www.enlightenment.org) is a very underrated window manager choice, in my opinion. It still looks very pretty and is very configurable. There is a packaging bug with the latest version of Enlightement in the 21.10 repo which means it doesn't work correctly. The fix is to set the suid bit on the 'enlightenment\_system' binary. So:

1. `sudo apt install enlightenment`
2. `sudo find /usr/lib -type f -name enlightenment_system -exec sudo chmod 4755 {} \;`
3. Log out of Ubuntu
4. Click the settings cog in the bottom right to change your Window manager to enlightenment
5. Log on and the settings wizard will help you configure Enlightenment
