---
category:
  - cd-ripping
  - dbpoweramp
  - flac
  - large-library
  - metadata
  - mixed-in-key
  - musicbrainz
  - picard
  - serato-dj-pro
  - tagging
date: "2021-05-05T21:06:13+00:00"
guid: https://davidcraddock.net/?p=2490
tag:
  - cd-ripping
  - dbpoweramp
  - flac
  - large-library
  - metadata
  - mixed-in-key
  - musicbrainz
  - picard
  - serato-dj-pro
  - tagging
title: Organising Huge Music Libraries for use with Serato DJ Pro
url: /2021/05/05/organising-huge-music-libraries-with-serato/

---
**Updated: 25-11-22**

My music library is around 24k files, mostly FLAC and some 320kbps MP3s. I use the following tools to organise my music library:

**Acquisition:**
dbPoweramp CD Ripper - [https://www.dbpoweramp.com/cd-ripper.htm](https://www.dbpoweramp.com/cd-ripper.htm)
Bandcamp Collection Downloader - [https://github.com/Ezwen/bandcamp-collection-downloader](https://github.com/Ezwen/bandcamp-collection-downloader)
Soulseek - [http://www.slsknet.org](http://www.slsknet.org) **Tagging and Metadata:**
Beets - [https://beets.io](https://beets.io)
Mixed In Key - [https://mixedinkey.com](https://mixedinkey.com)
Lexicon [https://www.lexicondj.com/](https://www.lexicondj.com/) **Backup and sync:**
Robocopy - comes free with Windows 10. Documentation: [https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy)
Google Drive
Rsync

**Searching:**
Everything Search - [https://voidtools.com/](https://voidtools.com/) **Playing:**
Winamp
Serato DJ Pro - [https://serato.com/dj/pro](https://serato.com/dj/pro)
Plex Media Server - [https://www.plex.tv/](https://www.plex.tv/) **dbPoweramp CD Ripper**

I have found this to be the fastest and most reliable CD ripper. It is commercial but is a very small cost and contains access to a lot of metadata services. I rip all my CDs to FLAC.

**Bandcamp Collection Downloader**

This is so useful. It required a few tweaks to get to work reliably under Windows, and if you haven't got any scripting skills then it will be a pain, but it has been hugely useful in syncing my Bandcamp purchases, of which I have over 200. It checks whether it has downloaded a purchase before as well, so you don't need to re-download everything, just what has been added recently to your collection. I use the following settings in a batch file which works reliably. If you want to use it you will have to replace 'socialistsynthesis' to be your bandcamp username. Remember to download the latest JDK NOT just the latest JRE otherwise it won't work.

`java -jar bandcamp-collection-downloader.jar -f=flac -j=1 -r=3 socialistsynthesis` **Soulseek**

I make a genuinely huge attempt to purchase all the music I play for my stream. I have spent SO much money on digital and physical copies of music over the years. When something is not available for purchase, or I have an old MP3 rip from a CD and I want a FLAC, then I use Soulseek. Whether you do is up to you, just know that it is there.

**Beets.IO**

I use Beets.io to manage all tagging. It is extremely powerful if you are comfortable with the commandline. This is my current config:

`
plugins: duplicates replaygain the ftintitle discogs bandcamp badfiles embedart fetchart
directory: /mnt2/music/` ``

import:
copy: no
replaygain:
command: /usr/bin/mp3gain
targetlevel: 92
overwrite: no
auto: yes
backend: command
threads: 20
parallel\_on\_import: no
per\_disc: no
peak: 'true'
r128: \[Opus\]
r128\_targetlevel: 84
noclip: yes

``

paths:
default: '%the{$albumartist}/$album/$artist - $title $bpm'
singleton: '%the{$albumartist}/$artist - $title $bpm'
comp: '%the{$albumartist}/artist - $title $bpm'
the:
the: yes
a: yes
format: '{0}, {1}'
strip: no
patterns: \[\]
discogs:
apikey: REDACTED
apisecret: REDACTED
tokenfile: discogs\_token.json
source\_weight: 0.5
user\_token: REDACTED
separator: ', '
index\_tracks: no
ftintitle:
auto: yes
drop: no
format: feat. {0}
duplicates:
album: no
checksum: ''
copy: ''
count: no
delete: no
format: ''
full: no
keys: \[\]
merge: no
move: ''
path: no
tiebreak: {}
strict: no
tag: ''
badfiles:
check\_on\_import: yes
commands:
flac: flac --test --warnings-as-errors --silent
va\_name: Various Artists
fetchart:
cautious: yes
cover\_names: front back
auto: yes
minwidth: 0
maxwidth: 0
quality: 0
max\_filesize: 0
enforce\_ratio: no
sources:
\- filesystem
\- coverart
\- itunes
\- amazon
\- albumart
google\_key: REDACTED
google\_engine: 001442825323518660753:hrh5ch1gjzm
fanarttv\_key: REDACTED
lastfm\_key: REDACTED
store\_source: no
high\_resolution: no
deinterlace: no
cover\_format:
embedart:
maxwidth: 0
auto: yes
compare\_threshold: 0
ifempty: no
remove\_art\_file: no
quality: 0

`
```

I use the following plugins:

_duplicates_ \- for removing duplicates
_replaygain_ \- for setting the gain level for the track intelligently in the file as analysed by mp3gain.exe
_the_ \- For organising artists which contain the word 'The'. For example 'The Chemical Brothers' becomes 'Chemical Brothers, The' on the top level directory.
_discogs_ \- Provide metadata from Discogs.
_bandcamp_ \- Provide metadata from Bandcamp.
_ftintitle_ \- This moves all the 'featured artists' in song names and albums into the title of the song.
_badfiles_ \- Run file integrity checkers on imported files to get rid of corrupt files
_fetchart_ \- Fetch artwork for each track
_embedart_ \- And embed it into the file

I structure the music in my library like so:

`S:\audio\music\Chemical Brothers, The\Surrender\The Chemical Brothers - Under The Influence 135.mp3`

- `S:\audio\music` \- my music collection top level folder.
- `Chemical Brothers, The` \- the artist with 'The' moved to the end for easy scanning through the artists list.
- `Surrender` \- the album.
- `The Chemical Brothers` \- the full name of the artist.
- `Under The Influence` \- the full name of the track.
- `135` \- the BPM of the track.
- `.mp3` \- the file extension - usually either flac or mp3.

My Beets.io workflow:

1. I put all new music file to be processed in a samba share on my Linux server called 'musicincoming'
2. I run `beet import -AmPsq .`
3. This processes the unorganised files and moves them over to my samba share on my Linux server called 'music'
4. I then run `beet dup -d` to delete any duplicates that have arisen.
5. I mirror my entire collection over to my DJing laptop external DJing hard drive over the network with rsync or robocopy.
6. I then drag my macbook external hardrive icon within Serato DJ Pro's 'Files' tab onto the 'All audio' section in Serato DJ Pro and it will import my files for me.
7. I disconnect my Serato interface, access the 'Preperation' tab and click Analyse all files to enable the beatgrid, BPM detect and song key detection for Serato DJ Pro.

**Mixed in Key**

This has the best key detection and mood detection algorithms at the moment. I use it to analyse small sets of files for more planned sets

**Lexicon**

This has so much potential but I haven't dug into it yet properly. My subscription expired so now I have to wait until I have enough money to get another one. You can perform a lot of useful tricks using your libraries metadata.

**Everything Search**

This is a free Windows-only program that searches for files extremely quickly. It is so fast that I can get results from all my media files in a couple of seconds when I am searching for something while I am DJing on Twitch.

**Backup Software**

I use rclone on my Linux server to backup my music to Google Drive, where I have 8TB of storage.

**Winamp**

Now that Winamp is updated for Windows 11 and is being actively maintained, I use it as a primary music player whenever I'm not use Plex Music Player.

**Serato DJ Pro**

This is what I use for my DJing when playing live. I analyze all my files to set the beatgrid, BPM and key. I have a 2TB external USB 2.0 hard disk so analyzing my entire library takes a couple of days of leaving my Macbook Pro on. But for new smaller additions it is much faster.

I use Serato autocrates a lot to mine the large amount of metadata I've added as part of my process. I have seperate autocrates for each 10 BPM division, e.g. 71-80 BPM, 81-90 BPM etc. I also have autocrates set by release date - I have music released in the 80s, music released in the 90s, music released in the 00s...etc. There is so much you can do with autocrates if you have properly set metadata.

**Plex Media Server**

I subscribe to Plex Media Server which is where I put all my music and video files for non-DJing playback. Because I subscribe (you can get the basic server and almost all functionality for free) I get access to the wonderful PlexAmp player which is a really great service. I have it on all my mobile devices and computers. Plex Media Server's handling of 'Various Artists' compilations is problematic and I have written about it [on this blog](/2021/09/21/how-to-fix-plex-media-servers-various-artists-problem-using-beets-io-and-other-tools/). I use a script I put together to fix problems when I encounter them. With the latest version of Beets.io you can get very specific with the 'beets ls' query language so this script works very accuratedly.
