---
category:
  - uncategorized
date: "2024-01-11T23:41:50+00:00"
guid: https://davidcraddock.net/?p=4348
title: Music Acquisition Process for DJ Music
url: /2024/01/11/music-acquisition-process-for-dj-music/

---
My music acquisition process for DJ music:

1. ARM (Automatic Ripping Machine) rips CDs I buy into FLAC form without any interactivity. You just insert a CD into the Linux server, and then it ejects it when it's done.
2. Lidarr downloads FLACs of any tracks of artists I have in my collection, but I don't have their full discography. It does this automatically and silently in the background.
3. Once a day, a cron job imports ARM and Lidarr downloads into my Beets.io music library, and deals with file integrity checks, tagging, metadata, library file structure and embedded images of the artist.
4. Whenever I'm ready to have a fresh library copy, I run my batch script on my W11 DJ laptop and it robocopy mirrors the entire library from my Linux samba share onto my computer.
5. I then send it through MixedInKey 10 to analyse the BPM and the music key of each track, and to check again the integrity of each file.
6. Once that is done, and any corrupt files removed, I import the file library into Serato DJ Pro, and analyse the entire collection. This again removes any dud files from the collection.
7. Now I have a complete music library, I run a batch file to reverse mirror the music from the DJ library back onto the server, so my collection doesn't accumalate corrupt files.
8. Now I have a full DJ music library of FLACs on my DJ laptop, over 22,000 files, great for requests!
