---
category:
  - background
  - bash
  - foreground
  - log
  - logs
  - tail
  - tips
date: "2013-06-11T15:55:04+00:00"
guid: http://www.davidcraddock.net/?p=1038
tag:
  - background
  - bash
  - foreground
  - log
  - logs
  - tail
title: Tailing a log file and Running an Application at the Same Time
url: /2013/06/11/monitoring-a-log-file-and-running-an-application-in-the-same-terminal/

---
A quick tip this, but a useful one. You can tail a log file in the background while running a script in the foreground. So for example, I frequently execute the following commands:

1\.

```
tail -f /var/log/httpd.log &
/etc/init.d/apache restart

```

2\. (The log file will spool onto the terminal as Apache is restarted.)

3\. Once you are finished viewing the log file, foreground the log file process and kill it:

```
fg

```

Then terminate the foregrounded log tail with a control-c.

With this technique you can run as many commands as you want, and see the real-time effects on your log file, without having to open a new terminal. You will also see your program output interspersed with your log file output, which can be helpful when tracing down particular problems.
