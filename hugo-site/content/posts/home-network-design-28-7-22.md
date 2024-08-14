---
category:
  - uncategorized
date: "2022-07-28T00:57:42+00:00"
guid: https://davidcraddock.net/?p=3139
title: Home Network Design 28/7/22
url: /2022/07/28/home-network-design-28-7-22/

---
[![](/wp-content/uploads/2022/07/untitled-diagram.drawio.png)](/wp-content/uploads/2022/07/untitled-diagram.drawio.png)

Now that I actually have the internet connectivity being installed to make use of it, I am getting my home network design a bit more finished.

**Components:**

- Virgin Hub providing a 1100/50mbps connection
- BetterInternet Fibre Hub providing a 900/900mbps connection
- Raspberry Pi 3 running Pi-Hole DNS
- MikroTik CRS309-1G-8S+IN Cloud Router Switch
- 4 x SFP+10Gb SFP+ RJ45 Copper Modules
- CAT8 30M Outdoor Cable to connect the studio to the study
- Short run CAT7 Patch Cables
- Windows 11 Studio PC with 10GB/sec SFP+ Port
- ThinkStation Server with twin 10GB/sec SFP+ Ports and separate gigabit NIC
- 3x LinkSys 3200WRT Routers in wireless repeater mode, creating a 2.4hz wireless network with speeds around 500mbps on average to each wireless device.
- TP-Link Gigabit switch

**Load-balancing internet connections:**

- I will be using the Linux kernel balance-rr round robin load balancing between the two internet connections on the Miktrotik router which should result on aggregate connection speeds that utilise the connections more extensively, although I doubt they will ever be fully utilised in this configuration for a while.

**ThinkStation Server:**

- I aim to use this as an always-on server, and also use it as a firewall/bridge/IDS to help further secure the study computers from the rest of the network.

**Connection Speeds:**

- The only two computers which will be initially able to reach >1gbit speeds are my studio PC and ThinkStation server as they are the only ones that will be directly connected from the Miktrotik router at faster than 1gbits speeds. All other wired devices will be 1Gb/sec capped, or in the case of wireless, a more realistic 500mbps throughout my home.
