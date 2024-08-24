---
category:
  - bbc-weather-feed
  - ical-service
  - php
  - weather-forecast
date: "2011-02-24T19:31:48+00:00"
guid: http://www.davidcraddock.net/?p=857
tag:
  - bbc-weather-feed
  - ical-service
  - php
  - weather-forecast
  - web-services
title: '''Weather Forecast'' Calendar Service in PHP'
url: /2011/02/24/a-3-day-weather-forecast-calendar-service/

---
The BBC provide 3 day weather RSS feeds for most locations in the UK. I thought it would be interesting to create a web service to turn the weather feed into calendar feed format, so I could have a constantly updated forecast of the next 3 days of weather mapped on to my iPhone’s calendar. Here it is on my iPhone:

**Overview**

The service is separated into five files:

- **ical.php** – this contains the class ical which corresponds to a single calendar feed. A method called ‘addevent’ allows you to add new events to the calendar, and a method called ‘returncal’ redirects the resulting calendar file to the browser so people can subscribe to it using their calendar application.
- **forecast.php** – this file contains the class forecast, which has properties for all aspects that we want to record for each day’s forecast, ie: Wind Speed and Humidity. It also contains the forecast set, which is a collection of forecast objects. The set class is serializable, which means each forecast object can be stored in a text file, including the Wind Speed, Humidity and all other things we want to record for each day.
- **scrape-weather.php** – this file contains code that scrapes the weather feed, populates the forecast set with all the weather information for the next 3 days, and stores the result in a file called forecasts.ser.
- **forecasts.ser** – this is all the data for the three day weather forecast, in serialized format. It is automatically deleted and recreated when the scrape-weather.php script is run.
- **reader.php** – this file converts the forecasts.ser file into an iCal calendar, and outputs the iCal formatted result to the calendar application that accesses reader.php page.

It uses two external libraries:

- **MagpieRSS 0.72** – this popular library is used for reading the calendar RSS feed and converting it into a PHP object that is easier to manipulate by scrape-weather.php.
- **iCalcreator 2.8** – this is used for creating the output iCal format of the calendar in ical.php and outputting it to the browser in reader.php.

**Files**

```
init();
	}

	function init(){
		$config = array( 'unique_id' => 'weather.davidcraddock.net' );
		  // set Your unique id
		$this->v = new vcalendar( $config );
		  // create a new calendar instance

		$this->v->setProperty( 'method', 'PUBLISH' );
		  // required of some calendar software
		$this->v->setProperty( "x-wr-calname", "Calendar Sample" );
		  // required of some calendar software
		$this->v->setProperty( "X-WR-CALDESC", "Calendar Description" );
		  // required of some calendar software
		$this->v->setProperty( "X-WR-TIMEZONE", "Europe/London" );
		  // required of some calendar software
	}

	function addevent($start_year,$start_month,$start_day,$start_hour,$start_min,
		  $finish_year,$finish_month,$finish_day,$finish_hour,$finish_min,
		  $summary,$description,$comment
	){
		$vevent = & $this->v->newComponent( 'vevent' );
		  // create an event calendar component
		$start = array( 'year'=>$start_year, 'month'=>$start_month, 'day'=>$start_day, 'hour'=>$start_hour, 'min'=>$start_min, 'sec'=>0 );
		$vevent->setProperty( 'dtstart', $start );
		$end = array( 'year'=>$finish_year, 'month'=>$finish_month, 'day'=>$finish_day, 'hour'=>$finish_hour, 'min'=>$finish_min, 'sec'=>0 );
		$vevent->setProperty( 'dtend', $end );
		$vevent->setProperty( 'LOCATION', '' );
		  // property name - case independent
		$vevent->setProperty( 'summary', $summary );
		$vevent->setProperty( 'description',$description );
		$vevent->setProperty( 'comment', $comment );
		$vevent->setProperty( 'attendee', 'contact@davidcraddock.net' );
	}

	function returncal(){
		// redirect calendar file to browser
		$this->v->returnCalendar();
	}
}
?>

```

```
forecasts = new ArrayObject();
	}
}

```

```
scrapecurrent();
		$this->store();
	}

	function store(){
		$store_path = $this->store_path;
		unlink($store_path);
		file_put_contents($store_path, serialize($this->set));
	}

	function scrapecurrent(){
		$url = $this->feed_url;
		$rss = fetch_rss( $url );
		$message = "";
		if(sizeof($rss->items) != 3){
			die("Problem with BBC weather feed.. dying");
		}
		$i=0;
		$set = new forecast_set();
		$curdate = date("Y-m-d");
		echo $curdate;
		foreach ($rss->items as $item) {
			$href = $item['link'];
			$title = $item['title'];
			$description = $item['description'];
			print_r($item);
			$curyear = date('Y',strtotime(date("Y-m-d", strtotime($curdate)) . " +1 day"));
			$curmonth = date('m',strtotime(date("Y-m-d", strtotime($curdate)) . " +1 day"));
			$curday = date('d',strtotime(date("Y-m-d", strtotime($curdate)) . " +1 day"));
			preg_match('/:.+?,/',$title,$summary);
			preg_match('/Min Temp:.+?-*d*/',$title,$mintemp);
			preg_match('/Max Temp:.+?-*d*/',$title,$maxtemp);
			preg_match('/Wind Speed:.+?-*d*/',$description,$windspeed);
			preg_match('/Humidity:.+?-*d*/',$description,$humidity);
			$summary[0] = str_replace(': ','',$summary[0]);
			$summary[0] = str_replace(',','',$summary[0]);
			$mintemp[0] = str_replace('Min Temp: ','',$mintemp[0]);
			$maxtemp[0] = str_replace('Max Temp: ','',$maxtemp[0]);
			$windspeed[0] = str_replace('Wind Speed: ','',$windspeed[0]);
			$humidity[0] = str_replace('Humidity: ','',$humidity[0]);
			$mins[$i] = (int)$mintemp[0];
			$maxs[$i] = (int)$maxtemp[0];
			$forecast = new forecast();
			$forecast->low = (int)$mintemp[0];
			$forecast->high = (int)$maxtemp[0];
			$forecast->year = (int)$curyear;
			$forecast->month = (int)$curmonth;
			$forecast->day = (int)$curday;
			$forecast->windspeed = $windspeed[0];
			$forecast->humidity = $humidity[0];
			$forecast->summary = ucwords($summary[0]);
			$set->forecasts->append($forecast);
			$i++;
			$curdate = date('Y-m-d',strtotime(date("Y-m-d", strtotime($curdate)) . " +1 day"));
		}
		print_r($set);
		$this->set = $set;

	}

}
$s = new scrape3day();

```

```
<?php
require_once('ical.php');
require_once('forecast.php');

$c = new ical();
$f = unserialize(file_get_contents('forecasts.ser'));
for($i=0;$iforecasts[$i];
	$weather_digest = "Max: ".$curforecast->high." Min: ".$curforecast->low." Humidity: ".$curforecast->humidity."% Wind Speed: ".$curforecast->windspeed."mph.";
	$c->addevent($curforecast->year,$curforecast->month,$curforecast->day,7,0,$curforecast->year,$curforecast->month,$curforecast->day,7,30,$curforecast->summary,$weather_digest,$weather_digest);
}
$c->returncal();
?>

```

**SVN Version**

If you have subversion, you can check out the project from: http://svn.davidcraddock.net/weather-services/. There are a couple extra files in that directory for my automated freezing weather alerts, but you can safely ignore those.

**Installation**

You will have to add this entry to your crontab to run once per day. You could set the script to run at midnight through adding the following:

```
0 0 * * *
```

For example, in my case:

```
0 0 * * * /usr/local/bin/php /home/david_craddock/work.davidcraddock.net/weather/scrape-weather.php
```

You will then need to edit the contents of the $store\_path and $feed\_url variables in scrape-weather.php. Store\_path should refer to a file path that the web server can create and edit files in, and feed\_url should refer to the RSS feed of your local area that you have copied and pasted from the [http://news.bbc.co.uk/weather/](http://news.bbc.co.uk/weather/) site, don't use mine because your area is likely different. After that, you're set to go.
