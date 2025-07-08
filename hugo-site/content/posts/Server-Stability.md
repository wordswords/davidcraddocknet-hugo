+++
title = 'Server Stability'
date = 2025-07-08T14:11:05+01:00
draft = true
+++

There has been numerous problems with the server that hosts all my domains, which resulted often in my websites becoming unavailable.

I traced the problem down to the scheduled tasks that I was regularly running which were blocking on I/O on my old enterprise storage drives, and causing problems.

With judicious use of 'ionice' I was able to address the problem, and now it seems things are running much better.

Again, with self-hosted servers, nothing is guaranteed, and my sites may go down for any reason at all, but for the moment, things look more stable.

Of course I should be moving home soon, so that will necessitate some extended downtime until I get the internet setup in the new place, but hopefully it will be manageable.



