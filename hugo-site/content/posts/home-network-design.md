---
category:
  - solutions-to-a-specific-problem
date: "2022-05-14T23:15:20+00:00"
guid: http://davidcraddock.net/?p=3029
title: Home Network Design
url: /2022/05/15/home-network-design/

---
![](/wp-content/uploads/2022/05/screenshot-2022-05-15-at-00-10-35-linkedin-2.png)

Did some network design for my home network. This will ensure that my new Virgin Media 1100mbps/50mps speed is fully utilised without any bottlenecks and will futureproof things up to at least 2.5Gbs/speed connections.

I should be able to load balance both internet connections to utilise them both simultaniously in the future, but for now I want to be able to get greater than 1000mbit/s speed on a single device otherwise there is not much point in speed increases past 1000mbits. Also there is a 200-300mbits speed increase possible from my existing VM hardware that is not utilised in the current network.

I will be using this method to extract the full speed from the VM hub: [https://tech.msh100.uk/virgin/networking/2020/10/17/virgin-media-greater-than-gbit/](https://tech.msh100.uk/virgin/networking/2020/10/17/virgin-media-greater-than-gbit/)

Since I have drawn up the diagram, there have been a few improvements suggested - using fibre and fibre modules instead of CAT 7 and more expensive modules to convert to CAT 7.
