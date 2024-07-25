---
category:
  - solutions-to-a-specific-problem
date: "2008-07-06T23:34:50+00:00"
guid: http://www.davidcraddock.net/2008/07/06/character-encoding-fix-with-php-mysql-5-and-ubuntu-server/
title: Character encoding fix with PHP, MySQL 5 and ubuntu-server
url: /2008/07/06/character-encoding-fix-with-php-mysql-5-and-ubuntu-server/

---
For some reason, under ubuntu-server, my default MySQL 5 character encoding was latin1. This caused no end of problems with grabbing data from the web, which was not necessarily in latin1 characterset.

If you are ever in this situation, I suggest you handle everything as UTF-8. That means setting the following lines in my.cnf:

```
[mysqld]
..
default-character-set=utf8
skip-character-set-client-handshake

```

If you already have tables in your database that you have created, and they have defaulted to the latin1 charset, you'll be able to tell by looking at the mysqldump SQL:

```
DROP TABLE IF EXISTS `ARTISTS`;
CREATE TABLE `ARTISTS` (
.. some col declarations..
) ENGINE=MyISAM AUTO_INCREMENT=4519 DEFAULT CHARSET=latin1;

```

See here this artists table has been set to default charset of latin1 by mysql. This is bad. So what I recommend is:

1\. Dump the full database structure + data to a file using mysqldump
2\. Substitute 'latin1' for 'utf8' universally on that file using your favourite text editor
3\. Import the resultant file into mysql using the mysql -uroot -p -Dyourdb < dump.sql method

Then everything will be in utf8, and your character encoding issues will be solved :)
