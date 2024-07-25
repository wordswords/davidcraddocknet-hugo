---
category:
  - uncategorized
date: "2022-09-08T09:43:35+00:00"
guid: https://davidcraddock.net/?p=3219
title: Home Network September 2022
url: /2022/09/08/home-network-september-2022/

---
I had planned a different network toplogy for sure, but this is my current setup and it seems to work well:

![](/wp-content/uploads/2022/09/home-network-sept-22.drawio1.png)

- I was not able to implement connection load balancing using the Miktrotik router. It was just too complicated and didn't work reliably enough.
- My current network is a gigabit network across all areas, so every PC has gigabit cables, switch and so on.
- I either have plugged in my Virgin Media 1000mb/50mbs internet connection or my BRSK fibre 900mb/900mb connection. I simply plug in the WAN cable from the main Linksys router into one of the hubs at one time. If one connection goes down, I manually switch over.
- I have a 10GB/sec SFP link between my server upstairs in the study and my main studio PC downstairs. This allows me to transfer files at 10Gb/sec rate between the two.
- I need two wireless repeaters, even though I have a small house, because the house walls are made of a concrete mix. This means the wireless signal needs boosting a lot.
- In the future, I may try load balancing again, or wait until one of my service providers offers >1000mb/sec speeds. When this happens it would make sense to expand the 10Gbs/sec links as there would be more point.
