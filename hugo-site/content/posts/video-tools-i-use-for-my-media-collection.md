---
category:
  - ripping
  - ripping-blurays
  - tutorial
  - video-tools
date: "2022-03-16T17:58:33+00:00"
guid: https://davidcraddock.net/?p=2968
tag:
  - ripping
  - ripping-blurays
  - tutorial
  - video-tools
title: Video Tools I use for my Media Collection
url: /2022/03/16/video-tools-i-use-for-my-media-collection/

---
I use and recommend the following software for Windows. They're all quite easy to use. The paid software all have lifetime subscriptions, which are worth it because you need the latest updates in this area.

Aiseesoft Blu-ray Player: (for playing Blu-Rays) (paid)
[https://www.aiseesoft.com/blu-ray-player/](https://www.aiseesoft.com/blu-ray-player/)

Easyfab Lossless Copy: (for ripping Blu-Rays, also works for DVDs) (paid)
[https://www.easefab.com/losslesscopy/](https://www.easefab.com/losslesscopy/)

VLC: (for playing ripped copies) (free)
[https://www.videolan.org/](https://www.videolan.org/)

Handbrake: (for converting between different video formats and compressing video) (free)
[https://handbrake.fr/](https://handbrake.fr/)

Plex Media Server: (for hosting video files on your network and playing them) (free)
[https://www.plex.tv/media-server-downloads/](https://www.plex.tv/media-server-downloads/)

Movavi Video Editor Plus: (for editing video files, similar interface to iMovie) (paid)
[https://www.movavi.com/videoeditor/](https://www.movavi.com/videoeditor/)

FFMPEG: (for splitting ripped video files, for TV series episodes) (free)
[https://www.gyan.dev/ffmpeg/builds/](https://www.gyan.dev/ffmpeg/builds/)

For using FFMPEG to split a ripped bluray track into episode segments, I look up the series on [https://thetvdb.com](https://thetvdb.com) which has fairly accurate epsiode runtimes, and then for example:

```
 ffmpeg.exe -i '.\Samurai Jack Season 1_001.mp4' -acodec copy -vcodec copy -ss 01:11:43 -t 00:23:00 samurai_jack_s01e04.mp4

```

- .\\Samurai Jack Season 1\_001.mp4 is the source file
- 01:11:43 is the start time
- 00:23:00 is the duration
- samurai\_jack\_s01e04.mp4 - is the destination file. I use Plex Media Server prefered titling for TV series, e.g. this is Series 1 Episode 4. This makes it easy to import with Plex.

I then test the episode in VLC by looking at the start and end of the file to make sure the split is correct, and adjusting the start/end times and re-running as appropriate.
