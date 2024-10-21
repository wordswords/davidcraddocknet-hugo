---
date: "2024-08-24T03:42:48+00:00"
guid: https://davidcraddock.net/security-research/
title: Security Research
url: /security-research/

---

I am currently familiarising myself with tools to implement cyber security solutions.

This is in preparation for my research project as part of the MSc Cyber Security masters I'm taking from the University of London via distance learning.

This research is strictly for informational purposes and I don't do anything criminal with it.


## Red Team

### Wardriving and Wifi cracking

I have two Raspberry Pi Zeros configured headless with pwnagotchi

### Password cracking

I have a hashmat password cracker setup that utilises my PC with an Nvidea gaming graphics card.

### M5StickC2 running Nemo

I have a M5StickC2 running [Nemo firmware](https://github.com/n0xa/m5stick-nemo) which replicates most of the interesting functionality of the Flipper Zero at a tiny fraction of the price.

I can use it to deauth wifi APs and run captive wifi APs, as well as wifi spam and some pranks around bluetooth and infrared hacking.

### RFID and Smart Card Security

I have a Proxmark3 setup which I'm using to learn about smart card security and smart card cloning. I am still getting used to using this, there is a lot to learn!

### Kali Nethunter

I am planning on installing Kali Nethunter on my old Sony Xperia 1 III. This will allow me to do more security research on the go.

## Blue Team

### Self-hosting Security

I am moving to self-host as much of my digital content as possible, to force myself how to learn to secure things properly.

* As a web server I'm currently using 'SWAG' - [Secure Web Application Gateway](https://hub.docker.com/r/linuxserver/swag), which includes fail2ban, ngnix, certbot and letsencrypt in a secure configuration.
* I use [Firefox Relay](https://relay.firefox.com/accounts/profile/) to provide an anonymous email alias for countering spam.
* I use [CloudFlare](https://www.cloudflare.com) heavily for DDOS protection and a lot of other security features for my self-hosted domains.
* I use [Thor AV](https://www.nextron-systems.com/thor/) on the Linux sever to scan weekly the entire server.
* I use [Geoblocker](https://github.com/friendly-bits/geoblocker-bash) to block all Russian and Chinese IP addresses from accessing my server, this seriously cuts down on botnets.
* I use a number of automated rootkit detectors and scanners to keep an eye on everything.
* I use Debian Automated Upgrades to automatically security patch the server, and all my Linux machines, to defend against 0-day exploits.
* I use [endlessSSH](https://github.com/skeeto/endlessh) to waste computer time of malicious bots that automatically attempt to connect to port 22 of my server.

### Pi-Hole K8s Cluster

I am building a Kubernetes high-availablity cluster using Pi-Hole as a DNS server, so that there will always be Pi-Hole blocking all advertising, hazardous and tracking traffic on the network.

### Wireless Network Security

I use a seperate GUEST wifi network which doesn't have access to any other parts of the network, ditto a IOT wifi network to isolate the IOT devices from any mischeif.




