---
category:
  - solutions-to-a-specific-problem
date: "2008-09-22T23:22:54+00:00"
guid: http://www.davidcraddock.net/?p=21
title: Automated Emails on Commiting to a Subversion Repository Using Python
url: /2008/09/22/automated-emails-on-commiting-to-a-subversion-repository/

---
At work I've written a couple of scripts that send out emails to the appropriate project team when someone checks in a commit to the project subversion repository. Here are the details.

Firstly, you will need a subversion hook setup on post-commit. The post-commit hook needs to be located in SVNROOT/YOURPROJECT/hooks where YOURPROJECT is your svn project name, and SVNROOT is the root directory where you are storing the data files for your subversion repository.

Substitute projectmember1,projectmember2 etc.. in the post-commit script below for the email addresses of the people to be notified when someone commits a change to the project.

```
#!/bin/sh

# POST-COMMIT HOOK
#
# The post-commit hook is invoked after a commit.  Subversion runs
# this hook by invoking a program (script, executable, binary, etc.)
# named 'post-commit' (for which this file is a template) with the
# following ordered arguments:
#
#   [1] REPOS-PATH   (the path to this repository)
#   [2] REV          (the number of the revision just committed)
#
# The default working directory for the invocation is undefined, so
# the program should set one explicitly if it cares.
#
# Because the commit has already completed and cannot be undone,
# the exit code of the hook program is ignored.  The hook program
# can use the 'svnlook' utility to help it examine the
# newly-committed tree.
#
# On a Unix system, the normal procedure is to have 'post-commit'
# invoke other programs to do the real work, though it may do the
# work itself too.
#
# Note that 'post-commit' must be executable by the user(s) who will
# invoke it (typically the user httpd runs as), and that user must
# have filesystem-level permission to access the repository.
#
# On a Windows system, you should name the hook program
# 'post-commit.bat' or 'post-commit.exe',
# but the basic idea is the same.
#
# The hook program typically does not inherit the environment of
# its parent process.  For example, a common problem is for the
# PATH environment variable to not be set to its usual value, so
# that subprograms fail to launch unless invoked via absolute path.
# If you're having unexpected problems with a hook program, the
# culprit may be unusual (or missing) environment variables.
#
# Here is an example hook script, for a Unix /bin/sh interpreter.
# For more examples and pre-written hooks, see those in
# the Subversion repository at
# http://svn.collab.net/repos/svn/trunk/tools/hook-scripts/ and
# http://svn.collab.net/repos/svn/trunk/contrib/hook-scripts/

REPOS="$1"
REV="$2"
EMAILS="projectmember1email,projectmember2email,projectmember3email,projectmember4email"
LOG="svnlook log $REPOS -r$REV"
/usr/bin/python /usr/local/scripts/svncommitemail.py $EMAILS $REPOS `whoami` $REV "`$LOG`" > /tmp/svncommitemail.log

```

Secondly you will need this python script:

Edit the 'fromaddr' variable to equal your configuration manager's email address (probably your own!).

```
#!/usr/bin/env python

import smtplib
import sys
import getopt
import time
import datetime
import string

def sendMail(subject, body, TO, FROM):
    HOST = "localhost"
    BODY = string.join((
        "From: %s" % FROM,
        "To: %s" % TO,
        "Subject: %s" % subject,
        "",
        body
        ), "rn")
    server = smtplib.SMTP(HOST)
    server.set_debuglevel(1)
    server.sendmail(FROM, [TO], BODY)
    server.quit()

def send(alias,rev,username,repo,changelog):

        today = datetime.date.today()
        fromaddr = 'Configuration.Management@YOURCOMPANY.COM'
        subject = """Subversion repository """+repo+""" changed by """+username+""" on """+str(today)

        aliases = alias.split(',')
        for alias in aliases:
                body = """
Hello,

        This is an automated email to let you know that subversion user: '"""+username+"""' has updated repository """+repo+""" to version """+rev+""". The changelog (might be empty) is recorded as:

"""+changelog+"""

Please contact subversion user: '"""+username+"""' in the first instance if you have any questions about this commit.

Thanks,
Configuration Management
        """
                sendMail(subject,body,alias,fromaddr)

argv = sys.argv
argc = len(sys.argv)
if argc == 6:
        alias = argv[1]
        repo = argv[2]
        username = argv[3]
        rev = argv[4]
        changelog = argv[5]
        send(alias,rev,username,repo,changelog)
else:
        print "Usage: "+argv[0]+"     "

```

Now once you have this all in place, test it by creating a a test file in the repository, and commiting it. If you issue a "tail -f /tmp/svncommitemail.log" on the box where your subversion project repository is located, you should be able to see what happens when people commit to the project repository.

If it is setup correctly, you will see emails being fired off to all interested parties with information about the svn commit.
