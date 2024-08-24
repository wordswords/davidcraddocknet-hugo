---
category:
  - bitbucket
  - du
  - fish-shell
  - git
  - shell-scripting
  - ~-backup
date: "2016-02-02T17:28:39+00:00"
guid: http://www.davidcraddock.net/?p=1685
tag:
  - bitbucket
  - du
  - fish-shell
  - git
  - shell-scripting
  - ~-backup
title: Fish Shell Scripting
url: /2016/02/02/fish-shell-scripting/

---
![](http://i.telegraph.co.uk/multimedia/archive/01396/fish_1396516c.jpg)

A few months ago I switched across from Bash onto the [Fish shell](http://fishshell.com/), on my main development machine. I can't get enough of its fast autosuggestions and its sane scripting language. Compared to Bash it is very fun to use.

Today I wrote a script to automate the backup of my development workspace onto a private bitbucket account. Bitbucket is good because it allows unlimited private repositories, but it caps the size of these repos at 2GB max, with some features disabled after 1GB. This means that I want to find out the size of my repo before automatically backing it up. This script does this:

```
#!/usr/bin/env fish

set size (du -sm . | awk '{print $1}')
echo "Workspace is $size MB"
if math "$size > 1000"
  echo "Workspace too big to commit!"
  exit
else
  echo "Workspace is under 1GB, OK to commit"
end

git add .
git commit -m "Automated backup"
git push origin master
```

Each individual directory additionally usually has its own git config which is synced to the separate repos for the code I'm actually working on. But if my development machine is stolen or somehow destroyed, or I want to quickly replicate my environment on another machine with access to the original repos, then I can regenerate the associations between the different directories. It also makes me mindful of not committing images or other video assets.
