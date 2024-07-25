---
category:
  - fish-shell
  - google-chrome
  - osx
  - tips
date: "2016-04-04T11:50:31+00:00"
guid: http://www.davidcraddock.net/?p=1734
tag:
  - fish-shell
  - google-chrome
  - osx
title: OSX Fish Functions to open Chrome from the Shell
url: /2016/04/04/osx-fish-functions-to-open-chrome-from-the-shell/

---
These functions are quite handy, and allow you to do things such as copy and paste errors and google for them without having to manually open a browser. You have to enclose arguments to both functions in single quotes, e.g. 'chrome 'http://www.google.co.uk' and google 'one two three four'. You should add these to your config file at ~/.config/fish/config.fish and make sure Google Chrome is already installed.

\[code language="bash"\]
function chrome
 /usr/bin/open -a '/Applications/Google Chrome.app' $argv\[1:\]
end
function google
 /usr/bin/open -a '/Applications/Google Chrome.app' "https://www.google.co.uk/search?q=$argv\[1\]"
end
\[/code\]
