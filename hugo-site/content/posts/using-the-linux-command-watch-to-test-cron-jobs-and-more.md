---
category:
  - cron-job
  - real-time-who
  - testing-cron-jobs
  - watch
date: "2010-03-13T16:02:42+00:00"
guid: http://www.davidcraddock.net/?p=506
tag:
  - cron-job
  - real-time-who
  - testing-cron-jobs
  - watch
  - who
title: Using the Linux command 'Watch' to test Cron jobs and more
url: /2010/03/13/using-the-linux-command-watch-to-test-cron-jobs/

---
OK, so you have added a cron job that you want to perform a routine task every day at 6am. How do you test it?

You probably don't want to spend all night waiting for it to execute, and there's every chance that when it does execute, you won't be able to find out whether it is executing properly - the task might take 30 minutes to run, for example. So every time you debug it and want to test it again, you have to wait until 6am the following day.

So instead, configure that cron job to run a bit earlier than that, say in 10 minutes, and monitor the execution with a 'watch' command, so you can see if it's doing what you want it to.

'watch' is a great command that will run a command at frequent intervals, by default, every 2 seconds. It's very useful when chained with the 'ps' command, like the following:

`
watch 'ps aux | grep bash'
`

What that command will do, is continually monitor your server, and maintain an updated list that changes every 2 seconds, of every instance of the bash shell. When someone logs in and spawns a new bash shell, you'll know about it. When a cron'd command runs that invokes a bash shell before executing a shellscript, you'll know about it. When someone writes a badly written shell script, and runs it invoking about 100 bash shells by accident, flooding your servers memory, you'll know about it.

OK so back to the cron example. Suppose I'm testing a cronjob that should invoke a shell script that runs an rsync command. I just set the cron job to run in 5 minutes, then run this command:

`
watch 'ps aux | grep rsync'
`

Here is the result.. every single rsync command that is running on my server is displayed, and the list is updated every 2 seconds:

```
Every 2.0s: ps aux | grep rsync                                              Sat Mar 13 15:59:35 2010

root     16026  0.0  0.0   1752   480 ?        Ss   15:28   0:00 /bin/sh -c /opt/remote/rsync-matt/cr
root     16027  0.0  0.0   1752   488 ?        S    15:28   0:00 /bin/sh /opt/remote/rsync-matt/crond
root     16032  0.0  0.1   3632  1176 ?        S    15:28   0:00 rsync -avvz --remove-source-files -P
root     16033  0.5  0.4   7308  4436 ?        R    15:28   0:09 ssh -l david someotherhost rsync --se
root     16045  0.4  0.1   4152  1244 ?        S    15:28   0:07 rsync -avvz --remove-source-files -P
root     18184  0.0  0.1   3176  1000 pts/2    R+   15:59   0:00 watch ps aux | grep rsync
root     18197  0.0  0.0   3176   296 pts/2    S+   15:59   0:00 watch ps aux | grep rsync
root     18198  0.0  0.0   1752   484 pts/2    S+   15:59   0:00 sh -c ps aux | grep rsync

```

Now I can see the time ticking away, and when the cron job is run, I can watch in real-time as it invokes rsync, and I can keep monitoring it to make sure all is running smoothly. This proves to be very useful when troubleshooting cron jobs.

You can also run two commands at the same time. You can actually tail a log file and combine it with the process monitoring like so:

`
watch 'tail /var/log/messages && ps aux | grep rsync'
`

Try this yourself. It constantly prints out the last ten lines of the standard messages log file every two seconds, while monitoring the number of rsync processes running, and the commands used to invoke them. Tailor it to the cron'd job you wish to test.

Watch can be used to keep an eye on other things also. If you're running a multi-user server and you want to see who's logged on at any one time, you can run this command:

`
watch 'echo CURRENT: && who && echo LASTLOGIN: && lastlog | grep -v Never'
`

This chains 5 commands together. It will keep you updated with the current list of users logged in to your system, and it will also give you a constantly updated list of those users who have ever logged in before, with their last login time.

The following shows the output of that command above on a multi-user server I administrate, and will refresh with current information every 2 seconds until I exit it:

```
Every 2.0s: echo CURRENT: && who && echo LASTLOGIN: && lastlog | grep -v Never                                                             Sat Mar 13 07:48:32 2010

CURRENT:
mark     tty1         2010-02-23 11:08
david    pts/2        2010-03-13 07:48 (wherever)
mike     pts/4        2010-02-26 07:53 (wherever)
mike     pts/5        2010-02-26 07:53 (wherever)

LASTLOGIN:
Username         Port     From           Latest
mark               pts/6    wherever      Thu Mar 11 23:24:36 -0800 2010
mike               pts/0    wherever      Sat Mar 13 03:54:28 -0800 2010
dan                pts/4    wherever      Fri Jan  1 08:46:29 -0800 2010
sam                pts/1    wherever      Sat Jan 30 08:06:01 -0800 2010
rei                pts/2    wherever      Thu Dec 10 11:45:39 -0800 2009
david              pts/2    wherever      Sat Mar 13 07:48:05 -0800 2010

```

This shows that mark, david and mike are currently logged on. Mark is logged in on the server's physical monitor and keyboard(tty1). Everyone else is logged in remotely. Mike currently has two connections, or sessions, on the server. We can also see the list of users that have logged in before - ie: are active users, and when they last logged on. I immediately notice, for example, that rei hasn't logged in for 4 months and probably isn't using her account.

(Normally this command will also provide IP addresses and hostnames of where the users have logged on from, but I've replaced those with 'wherever' for privacy reasons)

So.. you can see that the 'watch' command can be a useful window into what is happening, in real-time, on your servers.
