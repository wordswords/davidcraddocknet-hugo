---
category:
  - analysis
  - connection
  - internet
  - osx
  - ping
  - psof
  - slow
  - tcpdump
  - tips
date: "2013-03-01T01:28:54+00:00"
guid: http://www.davidcraddock.net/?p=1015
tag:
  - analysis
  - connection
  - internet
  - osx
  - ping
  - psof
  - slow
  - tcpdump
title: Monitoring a Slow Internet Connection in OSX
url: /2013/03/01/monitoring-a-slow-internet-connection-in-osx/

---
I am currently on holiday in Tenerife, and although I really like it here, one thing I do not like is the internet connection we have in our resort. Sometimes networked applications will just hang with no warning and there will be minutes where it's not clear what is going on. Here are some ways you can find a little bit more about what is happening when an application is slow or seems to hang when you have a poor internet connection. Execute the following commands each in a separate terminal window.

### Log Files

```
tail -f /var/log/*
```

This will give you an indication of what is happening in OSX. For example, I was installing the XCode Command Line Utils from within XCode. The installation progress information is severely lacking, it just shows a bar which moves from left to right. However I was able to find out what was happening by tailing the log files in /var/log, which provided me with an updated breakdown of the installer progress. You can exit tail by using Control-C which will return you to the shell.

### Constant Ping

```
ping www.google.com
```

When I have problems with my internet connection, I always keep a ping running in the background in a terminal. The interesting information here is the ICMP RTT time shown as the milliseconds next to the 'time' label, and how many packets were dropped shown by the number of 'request timeout' messages. Google does not mind you pinging it, just like hundreds of thousands of other people do, and so you can keep this up constantly, monitoring problems with your internet connection. When you get 'no route to host' printed, this usually means that your gateway or wireless connection is down, which means you usually have to reestablish a connection manually.

### tcpdump

```
sudo tcpdump en0 -vvv
```

Do you really want to see what is happening on your computers network connection? Turn the floodgates on then, and use tcpdump. This will output information on each packet that your computer sends out and is received in a slightly Matrix-style torrent of information. If you are downloading something via an application or have a number of active web connections such as AJAX Facebook pages loaded, you would expect to see a lot of traffic. If you don't have a lot of traffic, and you're expecting a lot, then something may be wrong. You can use tcpdump to get a general feel of what data is being passed around, and to what IP address, which you can then look up later for more clarity. You can also use grep and some basic TCP/IP networking knowledge to find out what exactly is happening on the network level.

### Network Connection Status of Each Application

```
sudo lsof -i tcp
```

Want to find out information about applications are using your internet connection, and the connection state of each TCP connection? Use lsof. You will be given the name of the application that is using each TCP connection, the IP address to which it is connected to, and the TCP connection state (established is good, time wait can be a problem sign). Run this regularly to check on the connection state of your programs. This won't monitor UDP connections, but should cover your web browsers.

Hopefully this information will give you a bit more insight into what is actually happening on your OSX machine when your internet connection is being unreliable and you want more information about what is going on. Once you have this information, you can use it to inform actions such as toggling the wireless off and on again to reestablish a connection, reloading webpages that have hung, restarting application downloads, or possibly finding a new hotel or resort with a better internet connection :)
