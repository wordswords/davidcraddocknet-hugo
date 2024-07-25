---
category:
  - beautifulsoup
  - property-adverts
  - python
  - scraping
  - scraping-gumtree
  - web-scraping
date: "2011-05-01T14:07:02+00:00"
guid: http://www.davidcraddock.net/?p=886
tag:
  - beautifulsoup
  - property-adverts
  - python
  - scraping
  - scraping-gumtree
  - web-scraping
title: Scraping Gumtree Property Adverts with Python and BeautifulSoup
url: /2011/05/01/scraping-gumtree-property-adverts-with-python-and-beautifulsoup/

---
I am moving to Manchester soon, and so I thought I'd get an idea of the housing market there by scraping all the Manchester Gumtree property adverts into a MySQL database. Once in the database, I could do things like find the average monthly price for a 2 bedroom flat in an area, and spot bargains through using standard deviation from the mean on the price through using simple SQL queries via [phpMyAdmin](http://www.phpmyadmin.net/home_page/index.php).

I really like the Python library [BeautifulSoup](http://www.crummy.com/software/BeautifulSoup/) for writing scrapers, there is also a Java version called [JSoup](http://jsoup.org/). BeautifulSoup does a really good job of tolerating markup mistakes in the input data, and transforms a page into a tree structure that is easy to work with.

I chose the following layout for the program:

**advert.py** \- Stores all information about each property advert, with a 'save' method that inserts the data into the mysql database
**listing.py** \- Stores all the information on each listing page, which is broken down into links for specific adverts, and also the link to the next listing page in the sequence (ie: the 'next page' link)
**scrapeAdvert.py** \- When given an advert URL, this creates and populates an advert object
**scrapeListing.py** \- When given a listing URL, this creates and populates a listing object
**scrapeSequence.py** \- This walks through a series of listings, calling scrapeListing and scrapeAdvert for all of them, and finishes when there are no more listings in the sequence to scrape

Here is the MySQL table I created for this project (which you will have to setup if you want to run the scraper):

```
--
-- Database: `manchester`
--

-- --------------------------------------------------------

--
-- Table structure for table `adverts`
--

CREATE TABLE IF NOT EXISTS `adverts` (
  `url` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `pricePW` int(10) unsigned NOT NULL,
  `pricePCM` int(11) NOT NULL,
  `location` text NOT NULL,
  `dateAvailable` date NOT NULL,
  `propertyType` text NOT NULL,
  `bedroomNumber` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

```

PricePCM is price per calendar month, PricePW is price per week. Usually each advert with have one or the other specified.

**advert.py:**

```
import MySQLdb
import chardet
import sys

class advert:

        url = ""
        title = ""
        pricePW = 0
        pricePCM = 0
        location = ""
        dateAvailable = ""
        propertyType = ""
        bedroomNumber = 0
        description = ""

        def save(self):
                # you will need to change the following to match your mysql credentials:
                db=MySQLdb.connect("localhost","root","secret","manchester")
                c=db.cursor()

                self.description = unicode(self.description, errors='replace')
                self.description = self.description.encode('ascii','ignore')
                # TODO: might need to convert the other strings in the advert if there are any unicode conversetion errors

                sql = "INSERT INTO adverts (url,title,pricePCM,pricePW,location,dateAvailable,propertyType,bedroomNumber,description) VALUES('"+self.url+"','"+self.title+"',"+str(self.pricePCM)+","+str(self.pricePW)+",'"+self.location+"','"+self.dateAvailable+"','"+self.propertyType+"',"+str(self.bedroomNumber)+",'"+self.description+"' )"

                c.execute(sql)

```

In advert.py we convert the unicode output that BeautifulSoup gives us into plain ASCII so that we can put it in the MySQL database without any problems. I could have used Unicode in the database as well, but the chances of really needing Unicode for representing Gumtree ads is quite slim. If you intend to use this code then you will also want to enter the MySQL credentials for your database.

**listing.py:**

```
class listing:

        url=""
        adverturls=[]
        nextLink=""

        def addAdvertURL(self,url):

                self.adverturls.append(url)

```

**scrapeAdvert.py:**

```
from BeautifulSoup import BeautifulSoup          # For processing HTML
import urllib2
from advert import advert
import time

class scrapeAdvert:

        page = ""
        soup = ""

        def scrape(self,advertURL):

                # give it a bit of time so gumtree doesn't
                # ban us
                time.sleep(2)

                url = advertURL
                # print "-- scraping "+url+" --"
                page = urllib2.urlopen(url)
                self.soup = BeautifulSoup(page)

                self.anAd = advert()

                self.anAd.url = url
                self.anAd.title = self.extractTitle()
                self.anAd.pricePW = self.extractPricePW()
                self.anAd.pricePCM = self.extractPricePCM()

                self.anAd.location = self.extractLocation()
                self.anAd.dateAvailable = self.extractDateAvailable()
                self.anAd.propertyType = self.extractPropertyType()
                self.anAd.bedroomNumber = self.extractBedroomNumber()
                self.anAd.description = self.extractDescription()

        def extractTitle(self):

                location = self.soup.find('h1')
                string = location.contents[0]
                stripped = ' '.join(string.split())
                stripped = stripped.replace("'",'"')
                # print '|' + stripped + '|'
                return stripped

        def extractPricePCM(self):

                location = self.soup.find('span',attrs={"class" : "price"})
                try:
                        string = location.contents[0]
                        string.index('pcm')
                except AttributeError: # for ads with no prices set
                        return 0
                except ValueError: # for ads with pw specified
                        return 0

                stripped = string.replace('£','')
                stripped = stripped.replace('pcm','')
                stripped = stripped.replace(',','')
                stripped = stripped.replace("'",'"')
                stripped = ' '.join(stripped.split())
                # print '|' + stripped + '|'
                return int(stripped)

        def extractPricePW(self):

                location = self.soup.find('span',attrs={"class" : "price"})
                try:
                        string = location.contents[0]
                        string.index('pw')
                except AttributeError: # for ads with no prices set
                        return 0
                except ValueError: # for ads with pcm specified
                        return 0
                stripped = string.replace('£','')
                stripped = stripped.replace('pw','')
                stripped = stripped.replace(',','')
                stripped = stripped.replace("'",'"')
                stripped = ' '.join(stripped.split())
                # print '|' + stripped + '|'
                return int(stripped)

        def extractLocation(self):

                location = self.soup.find('span',attrs={"class" : "location"})
                string = location.contents[0]
                stripped = ' '.join(string.split())
                stripped = stripped.replace("'",'"')
                # print '|' + stripped + '|'
                return stripped

        def extractDateAvailable(self):

                current_year = '2011'

                ul = self.soup.find('ul',attrs={"id" : "ad-details"})
                firstP = ul.findAll('p')[0]
                string = firstP.contents[0]
                stripped = ' '.join(string.split())
                date_to_convert = stripped + '/'+current_year
                try:
                        date_object = time.strptime(date_to_convert, "%d/%m/%Y")
                except ValueError: # for adverts with no date available
                        return ""

                full_date = time.strftime('%Y-%m-%d %H:%M:%S', date_object)
                # print '|' + full_date + '|'
                return full_date

        def extractPropertyType(self):

                ul = self.soup.find('ul',attrs={"id" : "ad-details"})
                try:
                        secondP = ul.findAll('p')[1]
                except IndexError: # for properties with no type
                        return ""
                string = secondP.contents[0]
                stripped = ' '.join(string.split())
                stripped = stripped.replace("'",'"')
                # print '|' + stripped + '|'
                return stripped

        def extractBedroomNumber(self):

                ul = self.soup.find('ul',attrs={"id" : "ad-details"})
                try:
                        thirdP = ul.findAll('p')[2]
                except IndexError: # for properties with no bedroom number
                        return 0
                string = thirdP.contents[0]
                stripped = ' '.join(string.split())
                stripped = stripped.replace("'",'"')
                # print '|' + stripped + '|'
                return stripped

        def extractDescription(self):

                div = self.soup.find('div',attrs={"id" : "description"})
                description = div.find('p')
                contents = description.renderContents()
                contents = contents.replace("'",'"')
                # print '|' + contents + '|'
                return contents

```

In scrapeAdvert.py there are a lot of string manipulation statements to pull out any unwanted characters, such as the 'pw' characters (short for per week) found in the price string, which we need to remove in order to store the property price per week as an integer.

Using BeautifulSoup to pull out elements is quite easy, for example:

```
ul = self.soup.find('ul',attrs={"id" : "ad-details"})

```

That finds all the HTML elements under the tag id="ad-details", so all the list elements in that list. More detail can be found in the [Beautiful Soup documentation](http://www.crummy.com/software/BeautifulSoup/documentation.html) which is very good.

**scrapeListing.py:**

```
from BeautifulSoup import BeautifulSoup          # For processing HTML
import urllib2
from listing import listing
import time

class scrapeListing:

        soup = ""
        url = ""
        aListing = ""

        def scrape(self,url):
                # give it a bit of time so gumtree doesn't
                # ban us
                time.sleep(3)

                print "scraping url = "+str(url)

                page = urllib2.urlopen(url)
                self.soup = BeautifulSoup(page)

                self.aListing = listing()
                self.aListing.url = url
                self.aListing.adverturls = self.extractAdvertURLs()
                self.aListing.nextLink = self.extractNextLink()

        def extractAdvertURLs(self):

                toReturn = []
                h3s = self.soup.findAll("h3")
                for h3 in h3s:
                        links = h3.findAll('a',{"class":"summary"})
                        for link in links:
                                print "|"+link['href']+"|"
                                toReturn.append(link['href'])

                return toReturn

        def extractNextLink(self):

                links = self.soup.findAll("a",{"class":"next"})
                try:
                        print ">"+links[0]['href']+">"
                except IndexError: # if there is no 'next' link found..
                        return ""
                return links[0]['href']

```

The extractNextLink method here extracts the pagination 'next' link which will bring up the next listing page from the selection of listing pages to browse. We use it to step through the pagination 'sequence' of resultant listing pages.

**scrapeSequence.py:**

```
from scrapeListing import scrapeListing
from scrapeAdvert import scrapeAdvert
from listing import listing
from advert import advert
import MySQLdb
import _mysql_exceptions

# change this to the gumtree page you want to start scraping from
url = "http://www.gumtree.com/flats-and-houses-for-rent/salford-quays"

while url != None:
        print "scraping URL = "+url
        sl = ""
        sl = scrapeListing()
        sl.scrape(url)
        for advertURL in sl.aListing.adverturls:
                sa = ""
                sa = scrapeAdvert()
                sa.scrape(advertURL)
                try:
                        sa.anAd.save()
                except _mysql_exceptions.IntegrityError:
                        print "** Advert " + sa.anAd.url + " already saved **"
                sa.onAd = ""

        url = ""
        if sl.aListing.nextLink:
                print "nextLink = "+sl.aListing.nextLink
                url = sl.aListing.nextLink
        else:
                print 'all done.'
                break

```

This is the file you run to kick off the scrape. It uses an MySQL IntegrityError try/except block to pick out when an advert has already been entered into the database, this will throw an error because the URL of the advert is the primary key in the database. So no two records can have the same primary key.

The URL you provide it above gives you the starting page from which to scrape from.

The above code worked well for scraping several hundred Manchester Gumtree ads into a database, from which point I was able to use a combination of phpMyAdmin and OpenOffice Spreadsheet to analyse the data and find out useful statistics about the property market in said area.

[Download the scraper source code in a tar.gz archive](http://www.davidcraddock.net/uploads/gumtree-scraper.tgz)

Note: Due to the nature of web scraping, if - or more accurately, when - Gumtree changes its user interface, the scraper I have written will need to be tweaked accordingly to find the right data. This is meant to be an informative tutorial, not a finished product.
