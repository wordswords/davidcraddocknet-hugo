---
category:
  - .bash_history
  - bash
  - bash-shell
  - bash-shell-customisation
  - history
  - history-command
  - tips
date: "2010-03-18T19:55:51+00:00"
guid: http://www.davidcraddock.net/?p=543
tag:
  - .bash_history
  - bash
  - bash-shell
  - bash-shell-customisation
  - history
  - history-command
title: Long Bash History Files are Great.
url: /2010/03/18/long-bash-history-files-are-great/

---
When I'm installing software, or doing some complicated stuff on the linux command line, which nowadays is pretty much all the time, I will sometimes want to remember exactly what I typed.

Now the normal /home/david/.bash\_history file is usually fine for that. Run this command, for example, and you will see the commands you typed in before you logged out of the server last time you used it:

```
cat ~/.bash_history
```

You can also find out what you typed in this session, ie: since you logged in, by typing this:

```
history
```

This is great, and it's even more useful if you add a grep pipeline, so you can search through the previous commands you typed in for a particular phrase or command, ie:

```
history | grep apt-get
```

However what I really want nowadays is an almost infinite bash\_history file, so I can find out not just what I did last week, but two weeks ago, or last month or perhaps last year. Now there are obvious security risks involved with this, and to make sure you don't accidently store mistyped passwords to other systems, or other things, you should probably make sure you never type them in on the command line. This is good practice anyway, and since I use key'd sshd logins exclusively nowadays, there is not much chance of me tripping up, typing a password into the terminal, and then forgetting about it. In theory however, using long/infinite bash\_history files does mean that if anyone compromised your shell account, they'd have any passwords to systems that you mistyped.

So I'm careful with this. You can also clear your history file quite quickly if you do accidently find you've messed up. Log out, log back in again, and just do this:

```
echo  > ~/.bash_history

```

Then that will delete all the previous logged commands.

Apart from serving as a major memory aid to complicated install work, and a log for those increasingly complicated chained, piped, one-liners that I'm fond of but only really want to have to type once, there are other benefits to keeping a large bash\_history file. The main one is that it makes it easy to convert your previous commands into a handy shell script or two, which you can set to run at a specific time of day via cron.. or even make into a system-wide command for other users to use.

OK so hopefully I've convinced you that it can be very useful to have a long, persistent, bash\_history file. But how do you configure the shell so that it does this for you? The following is the magic customization lines that I use on my personal desktops, laptops, and any other trusted computers that I think are reasonably free from the risk of people hacking in just to retrieve my .bash\_history file..:

/home/david/bash\_profile
`..
..
## bash history db
#
# increase the history file size to 20,000 lines
export HISTSIZE=20000
# append all commands to the history file, don't overwrite it at the start of every new session
shopt -s histappend
`

The above will give you an (almost) infinite bash\_history file. It will start deleting old commands at 20,000 lines, ie: 20,000 commands. Make sure you have enough disk space for that. My .bash\_history file is currently at around 200KB, not a huge file by any means. I'd say it will grow to 400-600KB max. If you want to calculate approximatly how much it will use, then in bytes, it's the number of characters in your average linux command x 20,000.
