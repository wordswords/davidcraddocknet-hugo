---
category:
  - tips
date: "2011-01-28T16:27:43+00:00"
guid: http://www.davidcraddock.net/?p=836
title: Reverting back to a previous version in CVS - the magic "undo" feature
url: /2011/01/28/reverting-back-to-a-previous-version-in-cvs-the-magic-undo-feature/

---
If you've committed some code into to CVS, and made a mistake on that commit, you will want to know how to revert to a previously saved version. Here is the command line command for CLI versions of CVS:

```
$ cvs update -D '1 week ago'

```

Run this command in the main directory of your checked out working copy. This will revert your working copy to the version of the code that was checked in '1 week ago' from the present date. You also use commands like "1 day ago" and "5 days ago".

Then simply commit the changes with a log message:

```
$ cvs commit -m "Oops! Made a mistake, had to revert back to the 21/1/2011 version"

```
