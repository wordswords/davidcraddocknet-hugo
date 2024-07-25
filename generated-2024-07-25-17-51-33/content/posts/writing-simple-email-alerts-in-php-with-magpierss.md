---
category:
  - solutions-to-a-specific-problem
date: "2011-02-12T20:01:13+00:00"
guid: http://www.davidcraddock.net/?p=842
title: Writing simple email alerts in PHP with MagpieRSS
url: /2011/02/12/writing-simple-email-alerts-in-php-with-magpierss/

---
I wrote an email alerter that sends me an email whenever the upcoming temperature may dip below freezing. It uses the [Magpie RSS reader](http://magpierss.sourceforge.net/) to pull down a 3 day weather forecast that is provided for my area in RSS form by the BBC weather site. It then parses this forecast and determines if either today's or tomorrow's weather may dip below freezing. If it might, it sends an email to my email address to warn me.

I scheduled this script to run every day by adding it as a [daily cron job](http://en.wikipedia.org/wiki/Cron) on my web host. You can set this up for any web hosts that support cron jobs.

```
items) != 3){
                $message .= 'Error: problem parsing BBC weather feed';
        }
        $i=0;
        foreach ($rss->items as $item) {
                $href = $item['link'];
                $title = $item['title'];
                preg_match('/Min Temp:.+?-*d*/',$title,$mintemp);
                preg_match('/Max Temp:.+?-*d*/',$title,$maxtemp);
                $mintemp[0] = str_replace('Min Temp: ','',$mintemp[0]);
                $maxtemp[0] = str_replace('Max Temp: ','',$maxtemp[0]);
                $mins[$i] = (int)$mintemp[0];
                $maxs[$i] = (int)$maxtemp[0];
                $i++;
        }

        // freezing warnings

        if($mins[0] < 0){
                $message .= "Today's temperature in W3 may go below freezing, anything down to ".$mins[0];
        }
        if($mins[1]

```

You can right click on this link and 'save as' to [download the script](http://svn.davidcraddock.net/weather-services/freezing.php).
