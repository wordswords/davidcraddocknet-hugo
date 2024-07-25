---
category:
  - br
  - bug
  - html-edit
  - wordpress-2.9.2
date: "2010-04-28T20:44:39+00:00"
guid: http://www.davidcraddock.net/?p=741
tag:
  - br
  - bug
  - html-edit
  - wordpress-2.9.2
title: Wordpress HTML edit mode inserts BR tags sometimes when you add a carriage return..
url: /2010/04/28/wordpress-html-edit-mode-inserts-br-tags-sometimes-when-you-add-a-carriage-return/

---
This is something that was quite annoying today, as I was struggling to use Wordpress 2.9.2 to align some pictures in the HTML mode of editing a page, on a client's website.

It turns out that Wordpress was adding BR tags sometimes when I hit return.. and sometimes not. The annoying thing was, although the BRs were outputted in the resultant Wordpress site, the BRs were not visible in the Wordpress HTML edit mode itself.. meaning they were invisible and undetectable until I viewed the resultant website source and finally figured it out.

Wordpress does insert some formatting tags now and then, it seems, but I would have thought it would tell you about the tags that would change the page layout! Apparently not. Anyway, something to be aware of for Wordpress gurus..

Edit:

I don't have time to report this as a bug, but this is the stack I'm using for anyone interested:

Browser: Google Chrome for Mac (5.0.342.9 beta)
TinyMCE Advanced Editor Plugin for WP (3.2.7)
Wordpress 2.9.2

The beta of Google Chrome is a bit unstable, although it may not be the source of the problem.
