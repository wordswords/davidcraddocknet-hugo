---
category:
  - denial-of-service
  - forkbomb
  - ubuntu-9.10
date: "2010-04-02T03:50:37+00:00"
guid: http://www.davidcraddock.net/?p=730
tag:
  - denial-of-service
  - forkbomb
  - ubuntu-9.10
title: Forkbombs and How to Prevent Them
url: /2010/04/02/forkbombs-and-how-to-prevent-them/

---
A forkbomb is a program or script that continually creates new copies of itself, that create new copies of themselves. It's usually a function that calls itself, and each time that function is called, it creates a new process to run the same function.

You end up with thousands of processes, all creating processes themselves, with an exponential growth. Soon it takes up all the resources of your server, and prevents anything else running on it.

Forkbombs are an example of a denial of service attack, because it completely locks up the server it's run on.

More worryingly, on a lot of Linux distributions, you can run a forkbomb as any user that has an account on that server. So for example, if you give your friend an account on your server, he can crash it/lock it up whenever he wants to, with the following shell script forkbomb:

`:(){ :|:& };:
`

Bad, huh?

Ubuntu server 9.10 is vulnerable to this shell script forkbomb. Run it on your linux server as any user, and it will lock it up.

This is something I wanted to fix right away on all my linux servers. Linux is meant to be multiuser, and it has a secure and structured permissions system allowing dozens of users to log in and do their work, at the same time. However when any one user can lock up the entire server, this is not good for a multiuser environment.

Fortunately, fixing this on ubuntu server 9.10 is quite simple. You limit the maximum number of running processes that any user can create. So the fork bomb runs, but hits this ceiling, and eventually stops without the administrator having to do anything.

As root, edit this file, and add the following line:

/etc/security/limits.conf

```
...
...
*               soft    nproc   35

```

This sets the maximum process cap for all users, to be 35. The root user isn't affected by this limit. This limit of 35 should be fine for remote servers that are not offering users gnome, kde, or any other graphical X interface. If you are expecting your users to be able to run applications like that, you may want to increase the limit to 50, and although this will increase the time forkbombs will take to exit, they should still exit without locking up your server.

Alternatively, you can setup an 'untrusted' and 'trusted' user groups, and assign that 35 limit to the untrusted users, giving trusted users access to the trusted group, which does not have that limit. Use these lines:

/etc/security/limits.conf

```
...
...
@untrusted               soft    nproc   35
@trusted               soft    nproc   50

```

I've tested these nproc limits on 8.10 and 9.10 ubuntu-server installs, but you should really test your own servers install, if possible, by forkbombing it yourself as a standard user, using the bash forkbomb above, once you've applied the fix. The fix is effective as soon as you've edited that file, but please note that you have to logout, and log back in again as a standard user before the new process cap is applied to your user account.
