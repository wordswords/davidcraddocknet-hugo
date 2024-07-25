---
category:
  - microkorg
  - music
  - python
  - tips
date: "2009-03-30T00:14:10+00:00"
guid: http://www.davidcraddock.net/?p=81
tag:
  - microkorg
  - music
  - python
title: MicroKORG + Python = MIDI fun!
url: /2009/03/30/microkorg-python-midi-fun/

---
So, about a month ago I got a second-hand [microKORG](http://en.wikipedia.org/wiki/MicroKORG) from Ebay. Fiddling around with the preset patches, and creating new patches is great fun, even though I only know a few chords. Recently I plugged it in to my PC via my [M-Audio Uno USB->MIDI interface](http://www.dolphinmusic.co.uk/product/1773-m-audio-uno-usb.html), and soon was using Ableton Live to program drums in time with the microKORG's arp.

I thought I'd experiment the music libraries available in python, and see if I could send notes to the synth via MIDI. Turns out that the M-Audio Uno is supported under Ubuntu, all you have to do is install the `midisport-firmware` package. With the help of [pyrtmidi](http://trac2.assembla.com/pkaudio/wiki/pyrtmidi), a set of python wrappers around the C++ audio library rtmidi I was able to recieve MIDI signals in realtime from the microKORG, and send them in realtime also. With the help of [this](http://www.davidcraddock.net/images/midilib.py) old midi file reader/writer library that I found posted to a python mailing list, I've made some progress in writing a simple MIDI file player that sends notes to the 'KORG.
