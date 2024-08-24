---
category:
  - cp
  - du--m
  - monitoring-cp
  - watch
date: "2010-03-20T22:44:06+00:00"
guid: http://www.davidcraddock.net/?p=695
tag:
  - cp
  - du--m
  - monitoring-cp
  - watch
  - watch-du
title: Tip for watching the completion of a large file copy
url: /2010/03/20/tip-for-watching-the-completion-of-a-large-file-copy/

---
[![](/wp-content/uploads/2010/03/windows-copy.gif)](/wp-content/uploads/2010/03/windows-copy.gif)

Forget the wonderful windows progress bar, and imagine I'm in the world of command-line Linux, and I want to copy a 484MB file, called VMware-server-2.0.2-203138.i386.tar.gz, from my home directory to a remote server. But I want to figure out how long it's going to take.

1\. First I can run a "du -m" command to get the total MB size of the original file:

```
du -m /home/david/VMware-server-2.0.2-203138.i386.tar.gz
```

I.e:
`
david@believe:~$ du -m VMware-server-2.0.2-203138.i386.tar.gz
484     VMware-server-2.0.2-203138.i386.tar.gz
`

Now I know it is approximately 484MB.

2\. Then I run the copy. I'm copying the file from /home/david/ to /opt/remote/myserver, which is a remotely mounted directory on a server somewhere in Canada.

`
david@believe:~$ cp ./VMware-server-2.0.2-203138.i386.tar.gz /opt/remote/myserver/
`

At this point cp will just hang until it's finished. There is normally no progress indicator or anything. But I want to figure out how much of the file has been copied, so I can figure out how much is left to copy, and get a rough idea of the progress.

3\. So I SSH into the remote server in Canada, and run this command

`
david@myserver:~$ watch du -m ./VMware-server-2.0.2-203138.i386.tar.gz
`

the copy command by default seems to be incremental, ie: piece by piece, not all at once. Therefore with the "Watch" command, you can watch the size, in MB, of the new file as it accumulates. The watch command will refresh every 2 seconds, so you'll be updated as the copy goes on.

You can probably invoke a progress meter with the cp command, or use rsync. Rsync is much better for large file copies, and remote file copies. But the advantage of the method above is that you can watch file copies already executed without any special arguments, which I sometimes find very useful when I remember that that file I already started copying isn't 200MB.. it's actually 2.5GB.
