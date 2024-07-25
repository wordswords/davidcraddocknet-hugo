---
category:
  - solutions-to-a-specific-problem
date: "2021-09-21T22:22:47+00:00"
guid: https://davidcraddock.net/?p=2720
title: How to fix Plex Media Servers 'Various Artists' problem using Beets.io and other tools
url: /2021/09/21/how-to-fix-plex-media-servers-various-artists-problem-using-beets-io-and-other-tools/

---
## The Problem

As of the day of posting, Plex Media Server has a suboptimal handling of Various Artists compilations. Unless you follow BOTH of these rules, [described clearly on the Plex support here under 'Various Artists',](https://support.plex.tv/articles/200265296-adding-music-media-from-folders/) then they won't appear collected under a particular album, they will be spread out filed under the different artists that created them. I think it should only require one of these rules, but it is not up to me. The problem is that release metadata available from the online metadata databases, often doesn't follow these rules - lots of DJ mix compilations for example, do not set albumartist tag to Various Artists from the online metadata databases.

Also you may want to adopt a different file structure for your music than what is recommended and essential for Plex. I would agree that ONE of these measures should be required, and I would argue that setting album artist would be enough for Plex to figure out this problem, but you also need to structure your music also under the way they suggest, you won't get the desired result of compilations being collected as a single album and in order.

## My Solution

Firstly, you're going to have to manually add the 'Various Artists' content to the 'albumartist' tag for all tracks in a compilation that doesn't have them. Currently I've only found a way to do this by hand, would be very interested in any automated approaches, or if someone wants to write a beets.io plugin that would be amazing. You can do this with any tag editor, but I wrote my own solution which is faster for what I want to do and easy to use on my existing Beets.io setup and database which has a lot of these problem compilations already. Because I am using Windows I wrote a batch file which uses several third party tools to fix the metadata fast. You will have to download and setup the tools seperately, [details are in the batch file comments](https://github.com/wordswords/music-organisation-windows-scripts/blob/main/tag-various-artists.bat).

Secondly, you're going to have to make sure that Beets.io moves your files into the way that Plex Media Server recommends. [This is my current Beets.io config file](https://github.com/wordswords/music-organisation-windows-scripts/blob/main/config.yaml), the important bits here are the file rename and move structure, [as per the support page](https://support.plex.tv/articles/200265296-adding-music-media-from-folders/), it has to be something along the lines of:

`
$albumartist/$album/$artist - $title
`

## My Process

1. 'beet ls <query string> to identify tracks that need fixing. 'beet ls fabric' for example, got almost all of my dozens of Fabric mix CD tracks, which sped up the renaming significantly than using a GUI editor to go in and manually change each album. You have to make sure that the query string selects only the tracks you want to modify, unless you want to go back and edit those few tracks that got caught in the process later.
2. I send that query string to my batch file which goes through the 'beets ls -p ' full path results iteratively and runs a couple of command line tag editors on them, the first works for all MP3s and the second for all FLACs, e.g. '.\\tag-various-artists.bat fabric'
3. 'beet update' to update my Beets.io database with the new metadata I've changed with the batch script.
4. 'beet dup -d' to delete any duplicates that have arisen.
5. 'beet move -p' to preview the file moves into the new directory structure that is required by Plex.
6. When I've scanned through and am happy with the file moves - 'beet move' to do the moving.
7. I then backup my files through robocopying to an external drive, but this is not essential.
8. Make sure you have checked 'prefer existing metadata' in the Plex options for your music library.
9. Set Plex to rescan your libraries metadata.

## Tools

 [The batch file I use, my beets.io config and other tools I use to organise my music collection on Windows 10.](https://github.com/wordswords/music-organisation-windows-scripts/)

## The Results

All my Fabric mix CDs are now properly collected under one ordered album each on Plex: ![](/wp-content/uploads/2021/09/fabric.png)
