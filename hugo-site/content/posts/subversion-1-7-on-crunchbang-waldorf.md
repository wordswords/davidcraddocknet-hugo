---
category:
  - crunchbang
  - smart-svn
  - subversion-1.7
  - svn
  - waldorf
date: "2013-06-16T03:43:49+00:00"
guid: http://www.davidcraddock.net/?p=1063
tag:
  - crunchbang
  - smart-svn
  - subversion-1.7
  - svn
  - waldorf
  - wandisco
  - wheezy
title: Subversion 1.7 on Crunchbang Waldorf
url: /2013/06/16/subversion-1-7-on-crunchbang-waldorf/

---
I use the excellent [http://www.smartsvn.com/](http://www.smartsvn.com/ "Smart SVN") client from WANdisco. WANdisco have been releasing new open-source versions of SVN to the public with new improved reliability, and the client uses one of these versions, 1.7, to offer better performance.

Unfortunately if you choose to upgrade your entire repository to 1.7, this breaks compatibility with the default commandline SVN client on Waldorf which I like to use as well as Smart SVN, for quick 'svn up's and other commandline magic.

This means I have to download the latest commandline SVN client, the 1.7 version of subversion for Linux, available for free on the WANdisco site.

Unfortunately, you can't install this version on the version of Debian that Crunchbang Waldorf is based on. There are broken dependencies on an old version of libsvn1, which is a requirement for another package that is part of the Debian base install.

Eventually I found this really helpful page, the instructions which will work 100% on Waldorf:

[http://ymartin59.free.fr/wordpress/index.php/2012/11/25/how-to-install-subversion-1-7-from-wandisco-repository-on-debian-wheezy/](http://ymartin59.free.fr/wordpress/index.php/2012/11/25/how-to-install-subversion-1-7-from-wandisco-repository-on-debian-wheezy/ "http://ymartin59.free.fr/wordpress/index.php/2012/11/25/how-to-install-subversion-1-7-from-wandisco-repository-on-debian-wheezy/")
