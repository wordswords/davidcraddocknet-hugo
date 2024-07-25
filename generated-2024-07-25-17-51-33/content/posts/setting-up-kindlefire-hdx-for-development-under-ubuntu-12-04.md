---
category:
  - adb
  - adb-devices
  - android
  - android-development
  - kindlefire-hdx
  - linux
  - ubuntu
date: "2014-02-10T15:28:45+00:00"
guid: http://www.davidcraddock.net/?p=1193
tag:
  - adb
  - adb-devices
  - android
  - android-development
  - kindlefire-hdx
  - linux
  - ubuntu
  - ubuntu-12.04
  - udev
title: Setting up Kindlefire HDX for Development under Ubuntu 12.04
url: /2014/02/10/kindlefire-hdx-under-ubuntu-12-04/

---
I wanted to get a Kindlefire HDX running under Ubuntu 12.04 with adb.

First I needed to setup the udev rules:

1\. Edit /etc/udev/rules.d/51-android.rules as root, and add the following line (create this file if it does not exist):

```
SUBSYSTEM=="usb", ATTRS{idVendor}=="1949", MODE="0666"
```

2\. Change the permission of this file by executing the following command as root:

```
chmod a+r /etc/udev/rules.d/51-android.rules
```

3\. Reload the rules by executing the following command as root:

```
udevadm control --reload-rules
```

4\. Run these commands to restart adb:

```
adb kill-server
adb start-server

```

5\. Now when I run

```
lsusb
```

 I can see the device listed.

6\. Next I needed to enable adb access on the Kindlefire HDX device itself by going to **Settings -> Device -> Enable ADB**.

7\. Finally I could run:

```
adb devices
```

 within Ubuntu and have it recognise the Kindlefire HDX.
