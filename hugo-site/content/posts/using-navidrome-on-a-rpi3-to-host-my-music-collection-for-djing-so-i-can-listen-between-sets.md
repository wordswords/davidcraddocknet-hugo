---
category:
  - music
date: "2021-06-09T14:29:14+00:00"
guid: http://davidcraddock.net/?p=2584
title: Using Navidrome on a RPI3 to host my music collection for DJing so I can listen between sets
url: /2021/06/09/using-navidrome-on-a-rpi3-to-host-my-music-collection-for-djing-so-i-can-listen-between-sets/

---
As a DJ it is important to listen to the music in your collection so you get an idea of what would work in particular sets, and you have a memory of how the tracks progress. So I decided to host a Spotify like service in my house so I could listen to my 500GB+ DJ music library. Navidrome (free open source software from https://navidrome.org) is running on the Raspberry Pi 3 which is under my desk via a wired connection with it's own http://navidrome.local custom domain name. This is what it looks like:

![](/wp-content/uploads/2021/06/navidrome.jpg)

It remotely mounts the music share on my main Windows PC which is almost always on, and quickly indexes and serves up the content in a Spotify type way.

I have setup an iptables port redirect so that any web traffic to port 80 or port 443 will be redirected to the correct navidrome app port so I don't have to remember the obscure port number just the domain name above. I have also setup AutoFS to automatically detect when my main PC is running and mount the windows share automatically, so everything just works whenever my main PC is switched on and off, and docker-compose automatically loads the container whenever it goes down and the setup persists between reboots of the RPI and the windows PC. I have also installed Plex on the same RPI, using AutoFS so that it mounts and unmounts the video share on my other PC when it is switched on. I have ripped a bunch of comedy videos from my DVDs and BluRays using Handbrake.

Navidrome implements the Subsonic API, so it is compatible with a lot of different applications, including the excellent [DSub](https://play.google.com/store/apps/details?id=github.daneren2005.dsub&hl=en_GB&gl=US) application for Android which offers a more mobile-friendly streamlined player that connects to my Navidrome server and allows caching and pre-downloading, and a bunch of other cool features.

It provides an easy way for me to browse and play any music from my music collection from anywhere on my network, and it has full metadata added as part of my DJ music metadata workflow (see: /2021/05/05/organising-huge-music-libraries-with-serato/ for more info). I have also setup my RPI3 as a ZeroTier bridge to my local network, meaning I can create a P2P VPN from my phone to stream music via DSub when I am outside the house too, or to access Plex on the RPI from my phone while I'm on the move.

Another useful feature is that I can save playlists using Navidrome and download all the files that make up the playlist via the web interface. This is useful for preparing a set and moving all teh files onto my DJing laptop so that I can analyse them in Serato and play them in a Serato crate.
