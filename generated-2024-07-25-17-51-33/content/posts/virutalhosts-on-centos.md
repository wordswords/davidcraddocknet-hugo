---
category:
  - apache
  - centos
  - lamp
  - ubuntu
date: "2009-03-30T22:45:50+00:00"
guid: http://www.davidcraddock.net/?p=98
tag:
  - apache
  - centos
  - lamp
  - ubuntu
  - virutal-hosts
title: VirutalHosts on CentOS
url: /2009/03/30/virutalhosts-on-centos/

---
A common task when setting up an [Apache](http://en.wikipedia.org/wiki/Apache_HTTP_Server) webserver under Linux, is writing a httpd.conf file. The httpd.conf file is the main configuration file for Apache. One of the main reasons to edit the httpd.conf file is to setup virtual hosts In Apache. A Virtual host configuration allows several different domains to be run off a single instance of Apache, on a single IP. Each host is a 'Virtual host', and typically has a different web root, log file, and any number of subdomains aliased to it. The virtualhosts are configured in parts of the httpd.conf file that look like this:

```

    ServerName myserver.co.uk
    ServerAlias www.myserver.co.uk
    ServerAdmin me@myserver.co.uk
    DocumentRoot /var/www/html/myserver.co.uk
    ErrorLog logs/myserver.co.uk-error_log
    CustomLog logs/myserver.co.uk-access_log common

```

Now on [Ubuntu](http://en.wikipedia.org/wiki/Ubuntu_server), virutalhosts are made easy. The httpd.conf is split into several files. Each virutalhost has a different file in `/etc/apache2/sites-available`. When you want to activate a particular vitualhost, you create a symbolic link from `/etc/apache2/sites-enabled/mysite` to `/etc/apache2/sites-available/mysite` (if you wanted to call your site configuration file 'mysite'). When apache boots up, it loads all the files it can find in `/etc/apache2/sites-available/*` and that determines which virutalhosts it loads. If there is not a link from `/etc/apache2/sites-available/` to your virutalhost file, it won't load it. So you can easily remove the links in /etc/apache2/sites-available without deleting the actual virutalhost file. Therefore you can easily toggle which virtualhosts get loaded.

[CentOS](http://en.wikipedia.org/wiki/Centos) uses a different structure. Everything is lumped into `/etc/apache/httpd.conf`. So there is no way to easily toggle virutalhosts on/off, and everything is a bit more chaotic. I've just had to setup a new CentOS webserver, and I struggled for a bit after being used to ubuntu-server. Here's a format you can use if you're in the same boat, and you have to setup httpd.conf files for CentOS:

```
NameVirtualHost *:80 # this is eseential for for name-based switching

# an example of a simple VirtualHost that serves data from
# /var/www/html/myserver.co.uk to anyone who types in
# www.myserver.co.uk to the browser

  ServerName myserver.co.uk
    ServerAlias www.myserver.co.uk
    ServerAdmin me@myserver.co.uk
    DocumentRoot /var/www/html/myserver.co.uk
    ErrorLog logs/myserver.co.uk-error_log
    CustomLog logs/myserver.co.uk-access_log common

# an example of a VirutalHost with apache overrides allowed, this means you can use
# .htaccess files in the servers web root to change your config dynamically

    ServerName bobserver.co.uk
    ServerAlias www.bobserver.co.uk
    ServerAdmin me@bobserver.co.uk
    DocumentRoot /var/www/html/bobserver.co.uk
    ErrorLog logs/bobserver.co.uk-error_log
    CustomLog logs/bobserver.co.uk-access_log common


      AllowOverride All


      AllowOverride AuthConfig
      Order Allow,Deny
      Allow from All


# an example of a VirutalHost with apache overrides allowed, and two subdomains
# (mail and www) that both point to the same web root

  ServerName fredserver.co.uk
    ServerAlias www.fredserver.co.uk
    ServerAlias mail.fredserver.co.uk
    ServerAdmin me@fredserver.co.uk
    DocumentRoot /var/www/html/fredserver.co.uk
    ErrorLog logs/fedserver.co.uk-error_log
    CustomLog logs/fredserver.co.uk-access_log common


      AllowOverride All


      AllowOverride AuthConfig
      Order Allow,Deny
      Allow from All


# .. etc

```

With the above structure, you can add as many VirutalHosts to your configuration as you have memory to support (typically dozens). Apache will decide on which to choose based on the 'ServerName' specified in each VirtualHost section. Just remember to add that all-important `NameVirtualHost: *:80` in the beginning.

Once you've got your httpd.conf file the way you like it, be sure to test it before you restart apache. If you restart apache and your httpd.conf file has errors in it, Apache will abort the load process. This means that all the websites on your webserver will fail to load. I always use `apachectl -t` or `apache2ctl -t` before I restart. That will parse the httpd.conf file and check the syntax. Once that's OK, then you can issue a `/etc/init.d/httpd restart` to restart Apache.
