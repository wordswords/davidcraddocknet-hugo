---
category:
  - dylan-thomas
  - ec2
  - haiku
  - haikumachine
  - node.js
date: "2013-07-27T02:29:10+00:00"
guid: http://www.davidcraddock.net/?p=1103
tag:
  - dylan-thomas
  - ec2
  - haiku
  - haikumachine
  - node.js
  - prosaic
  - twitter
title: The Haiku Machine
url: /2013/07/27/thehaiku-machine/

---
[![550px-Write-a-Haiku-Poem-Intro](/wp-content/uploads/2013/07/550px-write-a-haiku-poem-intro.jpg)](/wp-content/uploads/2013/07/550px-write-a-haiku-poem-intro.jpg)

I found this [awesome cut-up poetry generator](https://github.com/nathanielksmith/prosaic), which takes the text of famous poets and builds structured poetry out of it. The guy that made it even developed the underlying algorithm as a research project. I have put a version of a free Amazon EC2 instance, wrote a little twitter bot in node.js, and wired the poetry generator with the twitter bot, and now I have this: [https://twitter.com/haikumachine](https://twitter.com/haikumachine) \- a twitter bot that posts a haiku every five minutes, derived from Dylan Thomas's poetry.

It could be improved, and there are sometimes erroneous tweets where the syllables aren't counted quite right, or some of the punctuation doesn't make sense once cut up, but damnit, it's a bot that writes Haikus.

> "The grains beyond age / Oh miracle of fishes / in the lamb white days"
>
> — I am a Haiku Machine (@haikumachine) [July 26, 2013](https://twitter.com/haikumachine/statuses/360829607177502721)

 [//platform.twitter.com/widgets.js](//platform.twitter.com/widgets.js)
