---
category:
  - centos
  - console
  - directory-name-not-visable
  - fedora
  - ls
  - ls_colors
  - putty
  - redhat
  - solutions-to-a-specific-problem
date: "2011-05-04T16:03:55+00:00"
guid: http://www.davidcraddock.net/?p=910
tag:
  - centos
  - console
  - directory-name-not-visable
  - fedora
  - ls
  - ls_colors
  - putty
  - redhat
title: Directory names not visable under ls? Change your colours.
url: /2011/05/04/directory-names-not-visable-under-ls-change-your-colours/

---
There is a problem I frequently encouter on Redhat/Fedora/CentOS systems with the output of the **ls** command. Under those distributions, the default setup is to display directories in a very dark colour. If you usually use a white foreground and a black background on your terminal client (such as Putty) then you will struggle to read the names of the directories under Redhat-based distributions.

There are two soloutions that I have used:

**1\. Change the colour settings in Putty**

If you use Putty, ticking 'Use System Colours' here changes the "white foreground, black background" default into a "white background, black foreground". This way you can at least read the console properly, good for a quick fix. You can also save these settings in putty to be the default for the host that you are connecting to, or even all hosts.

**2\. Change the LS\_COLORS directive temporarily in the shell.**

Alternatively, you can ask the **ls** command to display directories and other entries in colours that you specify. You could add these lines to the bottom of your .bashrc to make these changes permanent, or if you are using a shared machine, just copy and paste the following lines into the terminal and they will change the colours to a reddish more visable set, until you logout. :

```
alias ls='ls --color' # just to make sure we are using coloured ls
LS_COLORS='di=94:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

```

(Original source for this particular LS\_COLORS combo: [http://linux-sxs.org/housekeeping/lscolors.html](http://linux-sxs.org/housekeeping/lscolors.html))
