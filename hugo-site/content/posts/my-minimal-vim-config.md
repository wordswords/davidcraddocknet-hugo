---
category:
  - .vimrc
  - minimal-.vimrc
  - vi-improved
date: "2010-03-18T19:23:07+00:00"
guid: http://www.davidcraddock.net/?p=535
tag:
  - .vimrc
  - minimal-.vimrc
  - vi-improved
  - vim
title: My minimal VIM config
url: /2010/03/18/my-minimal-vim-config/

---
This is the absolute minimum I do when I have to log onto a new server or shell account that I haven't used before, that I will need to edit text files with.

First I figure out whether VIM is really installed. A lot of installs, especially those based on ubuntu, ship with VI aliased to VIM, but the VIM install is usually not really VIM at all, and behaves exactly like VI but with some minor bugs fixed. This is not what I want.

So first I figure out what distribution of linux I'm using through executing the following command:

```
cat /etc/issue

```

Then if it's ubuntu, which doesn't ship with the full VIM package on a lot of default installs, then I usually do this, presuming I have admin access. In practice I usually have admin access because people are generous with this when they want you to fix their server =) Anyway, if I have admin access, I install ubuntu's 'vim full' package, which is aliased as 'vim':

```
sudo apt-get install vim

```

Now I can move onto my config. Occasionally there will be a global system config, but I probably want to override that anyway. So I create a vim configuration file specific to me in my home directory:

/home/david/.vimrc
`set bg=dark
set backspace=2
`

The first line sets the background to be dark, so I can see what is going on when I use a dark terminal program, such as putty, mac osx's terminal.. in fact nearly all terminal programs use a dark background, so this setting is almost compulsory.

The second line configures the behaviour of the backspace key, so when I go the the start of a line, and press backspace, it adopts the wordprocessor conventional behaviour of skipping to the above line. Otherwise it uses the default VI behaviour, which is probably not intuitive at all to anyone who didn't grow up on UNIX mainframes and such.

The very existence of a user-supplied configuration file will also jolt the VIM editor into 'non compatible mode', where it figures out automatically that it should be doing all the advanced VIM things, instead of just acting as a VI replacement. This should mean that if you create a config file, syntax highlighting is already turned on, another must for me. Otherwise you can explicitly set it with the line 'syntax on', but I never have to do this anymore.

And that's it.
