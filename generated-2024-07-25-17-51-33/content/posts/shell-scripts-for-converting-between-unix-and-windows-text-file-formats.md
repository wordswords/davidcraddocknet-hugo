---
category:
  - converting-linux-text-file-to-windows-text-file
  - converting-text-files
  - converting-windows-text-file-to-linux-text-file
  - unix-text-file-format
date: "2010-03-09T00:04:40+00:00"
guid: http://www.davidcraddock.net/?p=461
tag:
  - converting-linux-text-file-to-windows-text-file
  - converting-text-files
  - converting-windows-text-file-to-linux-text-file
  - unix-text-file-format
  - windows-text-file-format
title: Shell scripts for converting between Unix and Windows text file formats
url: /2010/03/09/shell-scripts-for-converting-between-unix-and-windows-text-file-formats/

---
I've been using these shell scripts I wrote to convert between unix and windows text file formats. They seem to work well without any problems. If you put them in the /usr/sbin/ directory, they will be accessible on the path of the linux admin account root.

/usr/sbin/unix2win
`#!/bin/bash
# Converts a unix text file to a windows text file.
# usage: unix2win <text file to convert>
# requirements: sed version 4.2 or later, check with sed --version
sed -i -e 's/$/r/' $1
`

/usr/sbin/win2unix
`#!/bin/bash
# Converts a windows text file to a unix text file.
# usage: win2unix <text file to convert>
cat $1 | tr -d '15' | tee $1 >/dev/null
`

I use these scripts with the combination of find and xargs to convert lots of log files into windows format with the following command. However this type of command can be dangerous, so don't use it if you don't know what you're doing:
`
find sync-logs/ -name '*.log' -type f | xargs -n1 unix2win
`
