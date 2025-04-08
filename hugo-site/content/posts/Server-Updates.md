+++
title = 'hq.local Server Updates'
date = 2025-04-08T10:31:10+01:00
draft = true
+++

I have made numerous fixes to the hq.local server after realising that some of the services were not running as well as they should have been, following the server rebuild a few months ago, and also to improve things generally.

* I have made some security permission upgrades, making sure each major running docker service has its own username, and is restricted to dealing with files chowned to its own user name, and runs as its own user, and everything is running on a separate hq.local virtual docker network which communicates with other networks only via pre-defined ports to make things more secure.

* I am running [Kometa](https://kometa.wiki) and [Tautulli](https://tautulli.com/) finally properly, which allows better metadata updating for the [Plex](https://plex.tv) film and TV libraries, and also allows tracking on all plays on the Plex server. I have linked it to my [Trakt.tv](https://trakt.tv) account and am slowly going to build a 'watch list' for TV and film that I will go through.

* I have retested the [Thor AV weekly scan service](https://www.nextron-systems.com/thor/), and made sure that suspicious files are being identified and then deleted automatically. This is working well.

* The [borg backup](https://www.borgbackup.org/) service is running through successfully again, although it has to be run manually at the moment, which is annoying. I have implemented small fixes to make this as smooth as possible.

* I am bringing back the music library integrity and restructuring weekly scan, using [Beets.io](https://beets.io/) and FLAC and MP3 integrity checkers. This will take time to develop further and get exactly right, but hopefully should result in a much better structured Plex Music library at the end, without any corrupted files.


