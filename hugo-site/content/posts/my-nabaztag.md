---
category:
  - tutorials
date: "2007-05-08T04:01:16+00:00"
guid: http://www.davidcraddock.net/?p=5
title: My Nabaztag
url: /2007/05/08/my-nabaztag/

---
_Nabaztag (Armenian for "rabbit") is a Wi-Fi enabled rabbit, manufactured by Violet. The Nabaztag is a "smart object"; it can connect to the Internet (for example to download weather forecasts, read its owner's email, etc). It is also fully customizable and programmable._ \- [Wikipedia.org](http://en.wikipedia.org/wiki/Nabaztag)

Here is our Nabaztag - Francois Xavier:

Of course, I've been messing around with poor old Francois's programming..

With the help of [OpenNab](http://sourceforge.net/projects/opennab/), a proxy server that masquerades as an official Nabaztag server, you can make your Nabaztag do all kinds of tricks. At the moment I'm getting him to read out what's currently showing on TV when someone presses his button.

Here's the technical details:

Whenever the button is pressed on Francois, he sends a message destined for the official Nabaztag server, that is caught by the proxy server. The proxy server then executes a PHP script. This PHP script grabs the current TV listings from a RSS feed, composes them into a readable list, and then sends the list to the official Nabaztag server, which converts the list (using a text-to-speech synthesis program) into audio files, and streams those audio files to Francois.

The result is a rabbit that reads the TV listings. A useful addition to our TV room.

**Coming soon:** More technical information on how you can do this yourself.
