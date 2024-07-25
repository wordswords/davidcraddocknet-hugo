---
category:
  - apache-default-from-address
  - default-from-address
  - default-sender-address
  - php-default-sender-address
  - solutions-to-a-specific-problem
date: "2010-03-10T06:36:26+00:00"
guid: http://www.davidcraddock.net/?p=475
tag:
  - apache-default-from-address
  - default-from-address
  - default-sender-address
  - php-default-sender-address
title: Changing the default "From:" email address for emails sent via PHP on Linux
url: /2010/03/10/changing-the-default-from-email-address-for-php/

---
I've had to solve this problem a couple of times at least, and it's quite a common task, so I thought I'd document it here.

When you send emails to users of your site through using the PHP mail() function, they will sometimes turn up in the mailbox of customers of your site with the following from address:

```
From: Root <root@apache.ecommercecompany.com>
```

This makes absolutely no sense to your customers, and often they will think it is spam and delete it. Often, the decision will be made for them by their web mail host, such as hotmail.com or googlemail.com, and they will never even see the email. You don't want this to happen.

Writing email templates that appear "trustworthy" and have a low chance of being mislabled as spam by the webmail companies, is quite a difficult task, and there's quite a bit to know about it. However it is quite easy to change the default "From:" email address that PHP sends your emails on as, and that will definitely help.

Assuming you're running a linux server using sendmail, all you have to do is this.

First create an email address that you would want the customers to see, through editing the /etc/aliases files and running the command newaliases. I created an email address called **customer-emails@ecommercecompany.com**.

Then change the following sendmail\_path line in your php.ini file to something like this:

/etc/php.ini
`...
sendmail_path = /usr/sbin/sendmail -t -i -F 'customer-emails' -f 'Customer Emails <customer-emails@ecommercecompany.com>'
...
`

Broken down, those extra options are:
`-F 'customer-emails' # the name of the sender
-f 'Customer Emails <customer-emails@ecommercecompany.com>' # the email From header, which should have the name matching the email address, and it should be the same email address as above
`

Then restart apache, and it should load the php.ini file changes. Test it by sending a couple of emails to your email address, and you should see emails sent out like this:

```
From: Customer Emails <customer-emails@ecommercecompany.com>
```
