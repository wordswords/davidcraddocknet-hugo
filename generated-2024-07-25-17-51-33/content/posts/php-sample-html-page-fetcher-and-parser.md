---
category:
  - php-page-scraper
  - php-page-scraper-class
  - php-scraper
  - solutions-to-a-specific-problem
date: "2010-01-14T05:53:47+00:00"
guid: http://www.davidcraddock.net/?p=383
tag:
  - php-page-scraper
  - php-page-scraper-class
  - php-scraper
title: PHP Sample - HTML Page Fetcher and Parser
url: /2010/01/14/php-sample-html-page-fetcher-and-parser/

---
Back in 2008, I wrote a PHP class that fetched an arbitary URL, parsed it, and coverted it into an PHP object with different attributes for the different elements of the page. I recently updated it and sent it along to a company that wanted a programming example to show I could code in PHP.

I thought someone may well find a use for it - I've used the class in several different web scraping applications, and I found it handy. From the readme:

```
This is a class I wrote back in 2008 to help me pull down and parse HTML pages I updated it on
14/01/10 to print the results in a nicer way to the commandline.

- David Craddock (contact@davidcraddock.net)

/// WHAT IT DOES

It uses CURL to pull down a page from a URL, and sorts it into a 'Page' object
which has different attributes for the different HTML properties of the page
structure. By default it will also print the page object's properties neatly
onto the commandline as part of its unit test.

/// FILES

* README.txt - this file
* page.php - The PHP Class
* LIB_http.php - a lightweight external library that I used. It is just a very light wrapper around CURL's HTTP functions.
* expected-result.txt - output of the unit tests on my development machine
* curl-cookie-jar.txt - this file will be created when you run the page.php's unit test

/// SETUP

You will need CURL installed, PHP's DOMXPATH functions available, and the PHP
command line interface. It was tested on PHP5 on OSX.

/// RUNNING

Use the php commandline executable to run the page.php unit tests. IE:
$ php page.php

You should see a bunch of information being printed out, you can use:
$ php page.php > result.txt

That will output the info to result.txt so you can read it at will.

```

Here's an example of one of the unit tests, which fetches this frontpage and parses it:

```
**++++
*** Page Print of http://www.davidcraddock.net ***
**++++

** Transfer Status
+ URL Retrieved:
http://www.davidcraddock.net
+ CURL Fetch Status:
Array
(
    [url] => http://www.davidcraddock.net
    [content_type] => text/html; charset=UTF-8
    [http_code] => 200
    [header_size] => 237
    [request_size] => 175
    [filetime] => -1
    [ssl_verify_result] => 0
    [redirect_count] => 0
    [total_time] => 1.490972
    [namelookup_time] => 5.3E-5
    [connect_time] => 0.175803
    [pretransfer_time] => 0.175812
    [size_upload] => 0
    [size_download] => 30416
    [speed_download] => 20400
    [speed_upload] => 0
    [download_content_length] => 30416
    [upload_content_length] => 0
    [starttransfer_time] => 0.714943
    [redirect_time] => 0
)

** Header
+ Title: Random Eye Movement
+ Meta Desc:
Not Set
+ Meta Keywords:
Not Set
+ Meta Robots:
Not Set
** Flags
+ Has Frames?:
FALSE
+ Has body content been parsed?:
TRUE

** Non Html Tags
+ Tags scanned for:
Tag Type: script tags processed: 4
Tag Type: embed tags processed: 1
Tag Type: style tags processed: 0

+ Tag contents:
Array
(
    [ script ] => Array
        (
            [0] => Array
                (
                    [src] => http://www.davidcraddock.net/wp-content/themes/this-just-in/js/ThemeJS.js
                    [type] =>
                    [isinline] =>
                    [content] =>
                )

            [1] => Array
                (
                    [src] => http://www.davidcraddock.net/wp-content/plugins/lifestream/lifestream.js
                    [type] => text/javascript
                    [isinline] =>
                    [content] =>
                )

            [2] => Array
                (
                    [src] =>
                    [type] =>
                    [isinline] => 1
                    [content] =>
                 var odesk_widgets_width = 340;
                var odesk_widgets_height = 230;

                )

            [3] => Array
                (
                    [src] => http://www.odesk.com/widgets/v1/providers/large/~~8f250a5e32c8d3fa.js
                    [type] =>
                    [isinline] =>
                    [content] =>
                )

            [count] => 4
        )

    [ embed ] => Array
        (
            [0] => Array
                (
                    [src] => http://www.youtube-nocookie.com/v/Fpm0m6bVfrM&hl=en&fs=1&rel=0
                    [type] => application/x-shockwave-flash
                    [isinline] =>
                    [content] =>
                )

            [count] => 1
        )

    [ style ] => Array
        (
            [count] => 0
        )

)

**----
*** Page Print of http://www.davidcraddock.net Finished ***
**----

```

If you want to download a copy, the file is below. If you find it useful for you, a pingback would be appreciated.
[code-sample.tar.gz](http://www.davidcraddock.net/uploads/code-sample.tar.gz)
