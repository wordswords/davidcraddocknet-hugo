---
category:
  - tips
date: "2009-03-26T18:53:01+00:00"
guid: http://www.davidcraddock.net/?p=63
title: EasyEclipse + Vimplugin for Python Development
url: /2009/03/26/easyeclipse-vimplugin-for-python-development/

---
Up until now, I've always used the terminal for programming development on my projects. Because I'm so familiar with the advanced text editor [vim](http://www.vim.org), I can get a lot done on the command line, and it doesn't detract away from what is actually going on behind the scenes, as a lot of IDEs seem to do.

However, in reading the book [Foundations of Agile Python Development](http://www.amazon.com/Foundations-Python-Development-Experts-Source/dp/1590599810) (which I recommend highly), and through working in software houses using [IDE](http://en.wikipedia.org/wiki/Integrated_development_environment) s only, I've come to realise that I need to gain at least some familiarity with an IDE.

So I've decided to try out [Eclipse](http://www.eclipse.org). I fiddled around with the Eclipse version in the Ubuntu 8.10 repositories for a while, with little success. I wanted to install [pydev](http://pydev.sourceforge.ne) and [vimplugin](http://vimplugin.org/). Pydev is an eclipse python development environment. Vimplugin allows vim keybindings, and can actually embed the gvim editor within Eclipse. I tried for a few hours, but couldn't get it all working with the stock Eclipse version in the Ubuntu repositories.

So I thought I'd try out [EasyEclipse](http://www.easyeclipse.org/site/distributions/python.html). EasyEclipse bundles a stable version of Eclipse with pydev in its "Easy Eclipse for Python Development" distribution, and that worked a charm. I then installed vimplugin which worked immediately when enabled, and supported embedded VIM mode within Eclipse. In the screenshot below, you should be able to (just about!) see what I mean, gvim is embedded into Eclipse:
