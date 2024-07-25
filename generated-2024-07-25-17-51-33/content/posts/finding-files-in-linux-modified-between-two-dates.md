---
category:
  - solutions-to-a-specific-problem
date: "2011-02-16T12:33:44+00:00"
guid: http://www.davidcraddock.net/?p=848
title: Finding files in Linux modified between two dates
url: /2011/02/16/finding-files-in-linux-modified-between-two-dates/

---
You use the 'touch' command to create two blank files, with a last modified date that you specify - one with a date of the start of the range you want to specify, and the second with a date at the end of the range you want to specify. Then you reference to those two files in your find command:

```
touch /tmp/temp -t 200604141130
touch /tmp/ntemp -t 200604261630
find /data/ -cnewer /tmp/temp -and ! -cnewer /tmp/ntemp

```
