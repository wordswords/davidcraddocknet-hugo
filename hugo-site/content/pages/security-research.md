---
date: "2024-08-24T03:42:48+00:00"
guid: https://davidcraddock.net/security-research/
title: Security Research
url: /security-research/

---

I am currently familiarising myself with tools to implement cyber security solutions.

This is in preparation for my research project as part of the MSc Cyber Security masters I'm taking from the University of London via distance learning.

This research is strictly for informational purposes and I don't do anything criminal with it.

I realise some of this information may be seen as 'over-sharing' and is a security risk in itself, but I believe that the benefits of sharing this information outweigh the risks, and that there is no 'security via obscurity'.

## Red Team

### Wardriving and Wifi cracking

I have two Raspberry Pi Zeros configured headless with [pwnagotchi](https://pwnagotchi.ai/) to automatically capture wifi handshakes hashes to crack later.

### Password cracking

I have a [hashmat](https://hashcat.net/hashcat/) password cracker setup that utilises my PC with an Nvidea gaming graphics card. I can use this to attempt to crack wifi handshake hashes with a dictionary attack.

### M5StickC2 running Nemo

I have a [M5StickC2](https://shop.m5stack.com/products/m5stickc-plus2-esp32-mini-iot-development-kit) running [Nemo firmware](https://github.com/n0xa/m5stick-nemo) which replicates most of the interesting functionality of the Flipper Zero at a tiny fraction of the price.

I can use it to deauth wifi APs and run captive wifi APs, as well as wifi spam and some pranks around bluetooth and infrared hacking.

It has also taught me a bit about aurdino programming and deploying firmware to a device.

### RFID and Smart Card Security

I have a [Proxmark3](https://en.wikipedia.org/wiki/Proxmark3) setup which I'm using to learn about RFIDs, smart card security and smart card cloning. I am still getting used to using this, there is a lot to learn!

### Kali Nethunter

I am planning on installing [Kali Nethunter](https://www.kali.org/docs/nethunter/) on my old Sony Xperia 1 III. This will allow me to do more security research on the go.

## Blue Team

### Self-hosting Security

I am moving to self-host as much of my digital content as possible, to force myself how to learn to secure things properly.

* As a web server I'm currently using 'SWAG' - [Secure Web Application Gateway](https://hub.docker.com/r/linuxserver/swag), which includes fail2ban, ngnix, certbot and letsencrypt in a secure configuration. In combination with building all my externally facing websites using a static site generator such as [Hugo](https://gohugo.io/), I keep the attack surface to a minimum.
* I use [Firefox Relay](https://relay.firefox.com/accounts/profile/) to provide an anonymous email alias for countering spam.
* I use [CloudFlare](https://www.cloudflare.com) heavily for DDOS protection and a lot of other security features for my self-hosted domains.
* I use [Thor AV](https://www.nextron-systems.com/thor/) on the Linux sever to scan weekly the entire server.
* I use [Geoblocker](https://github.com/friendly-bits/geoblocker-bash) to block all Russian and Chinese IP addresses from accessing my server, this seriously cuts down on botnets.
* I use a number of automated rootkit detectors and scanners to keep an eye on everything.
* I use [Debian Unattended Upgrades](https://wiki.debian.org/UnattendedUpgrades) to automatically security patch the server, and all my Linux machines, to defend against 0-day exploits.
* All my Windows machines run Windows 11, are set to automatically download and update in the background, have all the in-built security features turned on, and have Windows Defender enabled.
* I use [endlessSSH](https://github.com/skeeto/endlessh) to waste computer time of malicious bots that automatically attempt to connect to port 22 of my server.
* I use [Mikrotik's 'The Dude'](https://mikrotik.com/thedude) with many custom checks, to monitor my network and alert me of any changes that I need to address.
* I use [ZeroTier](https://www.zerotier.com/) to implement a secure and simple software-defined VPN without exposing any open ports to the world.
* I have my own [Google Workspace](https://workspace.google.com) account and use Google Workspace's advanced security features to secure my email and authentication.

### Personal Security

* I own a pair of FIDO compliant physical security keys, use phone 2FA and [LastPass](https://www.lastpass.com/) with random unique passwords on all sites to ensure authentication security, in combination with my Google Workspace.
* I keep my mobile phone locked and constantly up to date with the latest security patches at all times.
* I use [Mozilla VPN](https://www.mozilla.org/en-GB/products/vpn/) and Mozilla Firefox with security and ad-blocking plugins to ensure my browsing is private and secure.

### Pi-Hole K8s Cluster

I am building a Kubernetes high-availability cluster using Pi-Hole as a DNS server, so that there will always be Pi-Hole blocking all advertising, hazardous and tracking traffic on the network.

### Wireless Network Security

I use a separate GUEST wifi network which doesn't have access to any other parts of the network, ditto a IOT wifi network to isolate the IOT devices from any mischief. I regularly pentest my own wireless network as a part of my security research.

### CCTV and Security Cameras

I am building an open-source CCTV system using cheap old Axis cameras that are out of their supported life. Currently I have tried using Shinobi CCTV but I'm not happy with it, and am looking to move to a different system such as ZoneMinder.


