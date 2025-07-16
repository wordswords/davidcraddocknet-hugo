+++
title = 'More Server Updates'
date = 2025-07-16T18:27:58+01:00
draft = true
+++

I've made a bunch of new updates to the server.

The first was replacing the Readarr metadata and book downloader service, as it has stopped being supported. I have switched to LazyLibrarian, which I confess I don't exactly understand very well yet, but has done an awesome job so far in updating the metadata of my 20,000 epub library.

I hope to implement something similar for my PDF books/comics library, possibly with another instance of LazyLibrarian for it, working in tandem with a comic book metadata 'fixer'.

Access to both libraries is still via CalibreWebAutomated, which is an improved version of the lightweight CalibreWeb interface.

I also want to host an OPF server so that ereaders such as my Kobo can read books directly off the server when connected to wifi.

In other news, I have switched from Dixie cron, which just WAS NOT working reliably, to fcron. Fcron promises to be a much more reliable way to schedule Linux automated tasks, with compatibility with anacron scheduling.

I have also started developing a 'software update scheduled task' which does things like `apt-get update && apt-get upgrade` on the server, but also, remotely connects to my Mikrotik infrastructure and checks if a new RouterOS update is available, and if so, updates the routers, plus also SSH's into my Windows 11 studio PC that I keep switched on most of the time, and starts maintainence tasks running there.

I have also implemented robust logging and error trapping for ALL scheduled tasks, so I have a complete log, and everything is ran via 'screen', and error checked every step of the way.

So this all is good news, and things are working better than before - I really hope that fcrond nails my previous scheduling problems, as everything is working well at the moment apart from the scheduled script runs.



