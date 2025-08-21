+++
title = 'Thor AV APT Scanner'
date = 2025-08-21T02:29:16+01:00
draft = true
+++

![image](thor.jpg)

I have setup the excellent and free [Thor Lite AV APT (Advanced Persistent Threat) malware scanner](https://www.nextron-systems.com/thor-lite/) running on my server.

It's a paid product, but the free version is still much better than any other Linux anti-virus I've seen.

I use it to find problematic files in the many files I download from torrents/unsavoury sources etc.

It does a great job of identifying potentially suspicious files. The full version then goes on to move these files to a proprietry quarantine service.

Because the free version doesn't actually offer this functionality, I've written my own 'Thor Lite' log file parser that, from the latest Thor Lite scan log file, automatically extracts the path of any supsicious files identified in the areas I put my torrent-downloaded files, and then deletes them.

It works quite well, so well in fact that I've automated the entire process and it runs weekly, reporting to me whenever I log into the terminal on my server how many suspicious files it has deleted, and when the scheduled job last successfully ran to completion.


