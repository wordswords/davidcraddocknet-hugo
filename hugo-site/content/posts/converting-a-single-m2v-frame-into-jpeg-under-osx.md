---
category:
  - converting-frame-to-jpeg
  - ffmpeg
  - m2v
  - macports
  - osx
  - solutions-to-a-specific-problem
date: "2012-04-12T15:20:23+00:00"
guid: http://www.davidcraddock.net/?p=976
tag:
  - converting-frame-to-jpeg
  - ffmpeg
  - m2v
  - macports
  - osx
title: Converting a single M2V frame into JPEG under OSX
url: /2012/04/12/converting-a-single-m2v-frame-into-jpeg/

---
[![](/wp-content/uploads/2012/04/stainless_steel_number_plate_frame_square.jpg)](/wp-content/uploads/2012/04/stainless_steel_number_plate_frame_square.jpg)

I needed to view a single frame of a m2v file that had been encoded by our designers for playing out on TV. The file name was .mpg but in actuality it was a single .m2v frame renamed to be a .mpg. Windows Media Player classic used to display the frame fine when I opened the file normally, under Windows XP. However now I have switched to a Mac, I have found that Quicktime and VLC refused to display the single frame. I couldn't find a video player that would open the single frame. So I resorted to the command line version of ffmpeg, which I installed via macports, to convert this single frame to a jpg file to view as normal. This line worked a treat:

```
ffmpeg -i north.mpg -ss 00:00:00 -t 00:00:1 -s 1024x768 -r 1 -f mjpeg north.jpg

```

Where 'north.mpg' was the m2v file, and 'north.jpg' was the output jpeg.

And this:

```
find -name *.mpg -exec ffmpeg -i {} -ss 00:00:00 -t 00:00:1 -s 1024x768 -r 1 -f mjpeg {}.jpg ;

```

Will go through all the mpg files in the current directory and below, and create their jpeg single frame equivalents, ie: for north.mpg it will create north.mpg.jpg.
