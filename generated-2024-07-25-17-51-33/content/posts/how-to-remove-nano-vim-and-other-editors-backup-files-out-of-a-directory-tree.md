---
category:
  - linux
  - nano-backup-files
  - vim-backup-files
date: "2010-03-22T20:49:20+00:00"
guid: http://www.davidcraddock.net/?p=710
tag:
  - linux
  - nano-backup-files
  - vim-backup-files
  - ~-backup
title: How to remove nano, vim and other editors' backup files out of a directory tree
url: /2010/03/22/how-to-remove-nano-vim-and-other-editors-backup-files-out-of-a-directory-tree/

---
Linux command-line editors such as nano and vim often, by default, create backup files with the prefix of "~". I.e, if I created a file called /home/david/myfile, then nano would create a backup in /home/david/myfile~. Sometimes it doesn't delete them either, so you're left with a bunch of backup files all over the place, especially if you're editing a lot on a directory tree full of source code.

Those stray backup files make directory listings confusing, and also add unnecessary weight to the commits on source control systems such as svn, cvs, git.. etc. If you're working on a programming team with other people, then it causes further problems and confusion, because person A's editor can accidentally load person B's backup file.. etc etc. Nightmare.

So instruct your editor, or the programming team you're working with, not to drop these backup files. You can configure most editors to change the place where the editor drops its backup files, so you could store all your backup files in a subdirectory of your home directory, for example, if needed. However I always set my editors not to leave backup files about.

Once you know that new backup files will not be created, view the current list of backup files, along with the user that created them.. so you know who's been creating the backup files and when, etc:

```
find . -name '*~' -type f -exec ls -al {}  ;

```

Then archive the stray backup files, with this command:

```
find . -name '*~' -type f -exec mv -i {} ./archived-backups ;

```

That will find all backup files in the current directory and below, and move them all to a subdirectory in the current directory called 'archived-backups'. This is a fairly safe find/exec command, because with the -i switch, mv will not 'clobber'. This means If you have two backup files, one in /opt/code/index~ and one in /opt/code/bla/bla/index~, they will not 'clobber', or overwrite each other automatically when moved into the new directory. You will be informed of any conflicts present so you can resolve them yourself.

However in practice I usually omit the '-i' switch and let them clobber each other, because I usually end up deleting the ./archived-backups/ directory very quickly after that anyway.
