---
category:
  - tutorials
date: "2008-06-18T17:43:19+00:00"
guid: http://www.davidcraddock.net/2008/06/18/scraping-artists-bios-off-of-wikipedia/
title: Scraping artists bios off of Wikipedia
url: /2008/06/18/scraping-artists-bios-off-of-wikipedia/

---
I've been hacking away at [BrightonSound.com](http://www.brightonsound.com) and I've been looking for a way of automatically sourcing biographical information from artists, so that visitors are presented with more information on the event.

The Songbird media player plugin 'mashTape' draws upon a number of web services to grab artist bio, event listings, youtube vidoes and flickr pictures of the currently playing artist. I was reading through the mashTape code, and then found [this posting](http://whacked.net/2008/03/30/mashtape-and-apis/) by its developer, which helpfully provided the exact method I needed.

I then hacked up two versions of the code, a PHP version using simpleXML:

```
Result->Url);
    if($ar[2] == 'en.wikipedia.org'){
      $wikikey = $ar[4]; // more than likely to be the wikipedia page
    }else{
      return ""; // nothing on wikipediea
    }
    $url = "http://dbpedia.org/data/$wikikey";
    $x = file_get_contents($url);
    $s = new SimpleXMLElement($x);
    $b = $s->xpath("//p:abstract[@xml:lang='en']");
     return $b[0];
 }
?>

```

and a pythonic version using the amara XML library (has to be installed seperately):

```
import amara
import urllib2
from urllib import urlencode

def getwikikey(band):
  url = "http://api.search.yahoo.com/WebSearchService/V1/webSearch?appid=YahooDemo&query=%22"+band+"%22&site=wikipedia.org";
  print url
  c=urllib2.urlopen(url)
  f=c.read()
  doc = amara.parse(f)
  url = str(doc.ResultSet.Result[0].Url)
  return url.split('/')[4]

def uurlencode(text):
   """single URL-encode a given 'text'.  Do not return the 'variablename=' portion."""
   blah = urlencode({'u':text})
   blah = blah[2:]
   return blah

def getwikibio(key):
  url = "http://dbpedia.org/data/"+str(key);
  print url
  try:
    c=urllib2.urlopen(url)
    f=c.read()
  except Exception, e:
    return ''
  doc = amara.parse(f)
  b = doc.xml_xpath("//p:abstract[@xml:lang='en']")
  try:
    r = str(b[0])
  except Exception, e:
    return ''
  return r

def scrapewiki(band):
  try:
    key = getwikikey(uurlencode(band))
  except Exception, e:
    return ''
  return getwikibio(key)

  #unit test
  #print scrapewiki('guns n bombs')
  #print scrapewiki('diana ross')

```

There we go, artist bio scraping from wikipedia.
