---
category:
  - solutions-to-a-specific-problem
date: "2010-11-24T13:50:44+00:00"
guid: http://www.davidcraddock.net/?p=823
title: Converting week numbers to dates
url: /2010/11/24/converting-week-numbers-to-dates/

---
Here is some python code I adapted from [this stackoverflow post](http://stackoverflow.com/questions/396913/in-python-how-do-i-find-the-date-of-the-first-monday-of-a-given-week) to get the first day of a week specificed by a week number. This method includes leap year and summer time differences.

```
import time
def weeknum(num,year):
	instr = str(year)+" "+str(num-1)+" 1"
	print time.asctime(time.strptime(instr,'%Y %W %w'))

```

Here is me exectuting the code in Python's IDLE shell:

See that the first week of 2009 actually started in 2008, but by the end of that week we are in 2009.
