---
category:
  - duplicati
  - google-drive
  - linux
  - rclone
  - ubuntu
date: "2022-09-24T17:39:06+00:00"
guid: https://davidcraddock.net/?p=3249
tag:
  - duplicati
  - google-drive
  - linux
  - rclone
  - ubuntu
title: Google Drive Backup using Rclone
url: /2022/09/24/google-drive-backup-using-rclone/

---
For 8 TB of data storage on Google Drive, plus my own Google organization, I am paying £30/month, which is a pretty good deal.

I wanted to use this space for backing up my NAS, but it was proving difficult. The program I was recommended for Linux backup, Duplicati, was not the best for this purpose. My backup runs would not complete, they would be slow, and full of syncing errors.

Until I discovered rclone.

rclone was much better than Duplicati at backing up my NAS to Google Drive.

This is the script I use to sync the NAS content to Google Drive: [https://github.com/wordswords/dotfiles/blob/568a8768154de8609a01b26560373ec5ca0eab85/bin/rclone-backup.sh](https://github.com/wordswords/dotfiles/blob/568a8768154de8609a01b26560373ec5ca0eab85/bin/rclone-backup.sh)

It works just like rsync, but with a progress indicator. I've added it to my crontab and it syncs everything up weekly.
