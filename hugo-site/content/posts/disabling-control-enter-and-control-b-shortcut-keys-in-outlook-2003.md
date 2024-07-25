---
category:
  - disabling-shortcut
  - outlook-2003
  - regedit
  - solutions-to-a-specific-problem
date: "2011-07-13T16:34:39+00:00"
guid: http://www.davidcraddock.net/?p=924
tag:
  - disabling-shortcut
  - outlook-2003
  - regedit
title: Disabling Control-Enter and Control-B shortcut keys in Outlook 2003
url: /2011/07/13/disabling-control-enter-and-control-b-shortcut-keys-in-outlook-2003/

---
At work, I still have to use Windows XP and Outlook 2003. I don't particually mind this, except when I draft an email to someone and accidently I press Control-B instead of Control-V. Control-B will go ahead and send your partially composed email, resulting in some embarassment as you have to tell everyone to disregard it.

So I wanted to remove the 'send email' shortcut keys in Outlook 2003. There are two ways of doing this, one involves editing your group policy, which is something only my IT administration team can do, and I didn't want to have to involve them. The other way is by making a change to your registry, which I will describe here.

1. Open up regedit, and browse to the following registry key: HKEY\_CURRENT\_USER -> Software -> Policies -> Microsoft -> office -> 11.0 -> outlook
2. Then create a new key called: "DisabledShortcutKeysCheckBoxes".
3. Under that key, create two new String Values:
   Name: CtrlB Data: 66,8
   Name: CtrlEnter Data: 13,8

4. Then restart Outlook and those keys will be disabled.

Click on the thumbnail below to see what the finished edit should look like:
