---
category:
  - tips
date: "2024-12-22T17:30:59+00:00"
guid: https://davidcraddock.net/?p=4985
title: Remember to use UUIDs
url: /2024/12/14/remember-to-use-uuids
author: David Craddock
---

I had a problem recently with the server where the server was constantly having to boot into 'rescue mode' due to a problem with the fstab.

I didn't understand at first why this kept happening. Then I realised that somehow, the sata disk order was occasionally being rearranged.

This meant that the correct sata disk order was not being maintained, which meant that Kali Linux was kicking the server into rescue mode, as it was not finding the files it expected to at the correct mount points. /sda1 was becoming /sdc1, for example.

So.. I realised, this is why everyone says you should make sure to use disk UUIDs. Disk UUIDs associate the hardware ID for the disk drive to the mount point, so there can be no confusion. It's a much more robust solution.

So to fix:

* In Kali rescue mode, I mounted all the right partitions and edited the /etc/fstab file on the root partition so that they matched the current configuration.
* Then when it booted normally, I used the commands:
``` sudo lsblk -f > uuids.txt ```
* I copied correct UUIDs into fstab
``` sudo vim -O /etc/fstab ./uuids.txt ```

Rebooted, and it all worked, and should stay working.

