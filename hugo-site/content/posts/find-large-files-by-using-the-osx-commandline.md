---
category:
  - command-line
  - finding-large-files
  - osx
  - solutions-to-a-specific-problem
date: "2011-02-22T00:16:12+00:00"
guid: http://www.davidcraddock.net/?p=852
tag:
  - command-line
  - finding-large-files
  - osx
title: Find large files by using the OSX commandline
url: /2011/02/22/find-large-files-by-using-the-osx-commandline/

---
To quickly find large files to delete if you have filled your startup disk, enter this command on the OSX terminal:

```
sudo find / -size +500000 -print

```

This will find and print out file paths to files over 500MB. You can then go through them and delete them individually by typing **rm "<file path>"**, although there is no undelete so make sure you know you won't miss them.
