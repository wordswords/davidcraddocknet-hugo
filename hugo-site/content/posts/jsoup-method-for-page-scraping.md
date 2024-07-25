---
category:
  - beautifulsoup
  - java
  - jsoup
  - scraper
  - scraping-webpages
  - screen-scrape
  - web-scraping
date: "2011-09-07T18:35:17+00:00"
guid: http://www.davidcraddock.net/?p=938
tag:
  - beautifulsoup
  - java
  - jsoup
  - scraper
  - scraping-webpages
  - screen-scrape
  - web-scraping
title: JSoup Method for Page Scraping
url: /2011/09/07/jsoup-method-for-page-scraping/

---
[![Soup bowl](/wp-content/uploads/2011/09/soup.jpg)](/wp-content/uploads/2011/09/soup.jpg)

I'm currently in the process of writing a web scraper for the forums on [Gaia Online](http://www.gaiaonline.com/forum "Gaia Online"). Previously, I used to use Python to develop web scrapers, with the very handy Python library [BeautifulSoup](http://www.crummy.com/software/BeautifulSoup/ "BeautifulSoup"). Java has an equivalent called JSoup.

Here I have written a class which is extended by each class in my project that wants to scrape HTML. This 'Scraper' class deals with the fetching of the HTML and converting it into a JSoup tree to be navigated and have the data picked out of. It advertises itself as a 'web spider' type of web agent and also adds a 0-7 second random wait before fetching the page to make sure it isn't used to overload a web server. It also converts the entire page to ASCII, which may not be the best thing to do for multi-language web pages, but certainly has made the scraping of the English language site Gaia Online much easier.

Here it is:

```
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.text.Normalizer;
import java.util.Random;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/**
* Generic scraper object that contains the basic methods required to fetch
* and parse HTML content. Extended by other classes that need to scrape.
*
* @author David
*/
public class Scraper {

        public String pageHTML = ""; // the HTML for the page
        public Document pageSoup; // the JSoup scraped hierachy for the page

        public String fetchPageHTML(String URL) throws IOException{

            // this makes sure we don't scrape the same page twice
            if(this.pageHTML != ""){
                return this.pageHTML;
            }

            System.getProperties().setProperty("httpclient.useragent", "spider");

            Random randomGenerator = new Random();
            int sleepTime = randomGenerator.nextInt(7000);
            try{
                Thread.sleep(sleepTime); //sleep for x milliseconds
            }catch(Exception e){
                // only fires if topic is interruped by another process, should never happen
            }

            String pageHTML = "";

            HttpClient httpclient = new DefaultHttpClient();
            HttpGet httpget = new HttpGet(URL);

                HttpResponse response = httpclient.execute(httpget);
                HttpEntity entity = response.getEntity();

                if (entity != null) {
                    InputStream instream = entity.getContent();
                    String encoding = "UTF-8";

                    StringWriter writer = new StringWriter();
                    IOUtils.copy(instream, writer, encoding);

                    pageHTML = writer.toString();

                    // convert entire page scrape to ASCII-safe string
                    pageHTML = Normalizer.normalize(pageHTML, Normalizer.Form.NFD).replaceAll("[^\p{ASCII}]", "");

                }

                return pageHTML;
        }

        public Document fetchPageSoup(String pageHTML) throws FetchSoupException{

            // this makes sure we don't soupify the same page twice
            if(this.pageSoup != null){
                return this.pageSoup;
            }

            if(pageHTML.equalsIgnoreCase("")){
                throw new FetchSoupException("We have no supplied HTML to soupify.");
            }

            Document pageSoup = Jsoup.parse(pageHTML);

            return pageSoup;
        }
}

```

Then each class subclasses this scraper class, and adds the actual drilling down through the JSoup hierachy tree to get what is required:

```
...
this.pageHTML = this.fetchPageHTML(this.rootURL);
this.pageSoup = this.fetchPageSoup(this.pageHTML);

// get the first
.. section on the page
Element forumPageLinkSection = this.pageSoup.getElementsByAttributeValue("id","forum_hd_topic_pagelinks").first();
// get all the links in the above
 section
Elements forumPageLinks = forumPageLinkSection.getElementsByAttribute("href");
...

```

I've found that this method provides a simple and effective way of scraping pages and using the resultant JSoup tree to pick out important data.
