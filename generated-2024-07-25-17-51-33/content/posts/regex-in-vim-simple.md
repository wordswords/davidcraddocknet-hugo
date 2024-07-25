---
category:
  - tutorials
date: "2009-10-07T06:40:02+00:00"
guid: http://www.davidcraddock.net/?p=137
title: Regex in VIM.. simple
url: /2009/10/07/regex-in-vim-simple/

---
There are [more than a gazillion ways](http://www.geocities.com/volontir/) to use regexs. I am sure they are each very useful for their own subset of problems. The sheer variety can be highly confusing and scary for [a lot of people](http://www.google.co.uk/search?q=regex+difficult) though, and you only need to use a few approaches to accomplish most text-editing tasks.

Here is a simple method for using regex in the powerful text editor [VIM](http://www.vim.org) that will work well for common use.

## Method

We are going to take the "search and delete a word" problem for an example. We want to delete all instances of the singular noun "needle" in a text file. Let's assume there are no instances of the pluralisation "needles" in our document.

1. **_Debug on_**.. turn some VIM options on
   `:set hlsearch
   :set wrapscan
   ` \- this will make all regex expressions possible to debug by visually showing what they match in your document (first line) and make all searches wrap around instead of just search forward from your current position, which is the default. (second line)
2. **_Develop and Test_**.. your regex attempts by using a simple search. Here we see three attempts at solving the problem: `:/needl
   :/needle
   :/<needle>` \- our third try is correct, and highlights all words that spell "needle". The **<** and **>** markers allow you to specify the beginning and the end of a word. Play with different regexs using the simple search and watching what is highlighted, until you discover one that works for you.

3. **_Run_**... your regex `:%s/<needle>//g` \- once you've figured out a regex, run the regex on your document. This example will execute a search for the word "needle" and delete every one. If you wanted to substitute needle for another word, you would put the word in between the **/** **/** marks. As we can see, there is nothing between the marks in this example, so it will replace instances of "needle" with nothing. This means it will serve to delete every instance of the word "needle".

4. **_Check things are OK_**... with your document `:/<needle>
   :/needle
   :/needl` \- has the regex done what you want? Use the search function to see if regex has done what you wanted it to do. The above examples show different searches through the document to see if different variations remain. Any matches of these searches will highlight any problems. You can use the lower-case **N**(next search result) and lower-case **P**(previous search result) commands to navigate through any found search results. You must remember to manually look through the document and see what the regex has changed, make sure there aren't any unwanted surprises!
5. **_Recover_**... from any mistakes `u` \- just press the **U** key (with no capslock or shift). This will undo the very last last change made to the document.
6. **_Redo_**... any work that you need to `<ctrl>-r` \- use the redo fuction; press the **CONTROL** and **R** keys together (with no capslock or shift). This will redo the last change made to the document.
7. **_Finish up and Write_**... to file `:w` \- write your work on the document to file. Even after you have written out to file, you can probably still use the undo function to get back to where you were, but it's best practice to not rely on this, and only write once you're done.
8. **_Debug off_**.. turn some options off
   `:set nohlsearch
   :set nowrapscan
   ` \- turn off the regular expression highlighting (line 1). turn off the wraparound searching (line 2). You can leave either or both options on if you want, they're often useful. Up to you.

Use a combination of these wonderful commands to test and improve your regex development skills in VIM.

## Examples

Here I use the shorthand " **#...**" to denote comments on what I'm doing... if you want to copy and paste the example as written, then you will have to remove those comments.

1\. Remove ancient uppercase <BLINK> tags from a document.

```
:set wrapscan # debug on
:set hlsearch # debug on
:/<BLINK> # try 1.. bingo! first time.. selected all tags I want
:%s/<BLINK>//g # lets execute my regex remove
:/BLINK # check 1.. testing things are OK in my file by searching through..
:/blinked # check 2.. yep thats ok..
:/<BLINK> # check 3.. yep looks ok... the problem tags are gone
# ...manual scroll through the document.. looks good!
:w # write out to file
:set nohlsearch # debug off
:set nowrapscan # debug off

```

2\. Oh no! We missed some lower and mixedcase <bLiNK> tags that some sneaky person slipped in. Let's take them out.

```
:set wrapscan # debug on
:set hlsearch # debug on
:/<blink> # try 1.. hm.. worked for many, but didnt match BlInK or blINK mixedcase
:/<blink>/i # try 2.. much better.. seems to have worked!
:%s/<blink>//i # lets execute my regex remove
:/BLINK # check 1.. testing things are OK in my file by searching through..
:/blinked # check 2.. yep thats ok..
:/<blink> # check 3.. yep thats fine.
:/<blink>/i # check 4.. looks good... problem solved
# ...manual scroll through the document.. looks much better!
:w # write out to file
:set nohlsearch # debug off
:set nowrapscan # debug off

```

3\. Replacing uppercase or mixedcase <BR> tags with the more modern <br>.

```
:set wrapscan # debug on
:set hlsearch # debug on
:/<BR> # try 1.. hmm.. just uppercase.. not gonna work..
:/<br> # try 2.. hmm.. just lowercase..
:/<BR>/i # try 3.. ahh.. that'll be it then
:%s/<BR>/<br>/gi # lets execute my regex substitution
:/BR # check 1.. testing things are OK in my file by searching through..
:/br # check 2.. yep thats ok..
/bR # check 3 ..yup..
:/<BR>/i # check 4.. yep looks ok... the problem tags seem to be gone
# ...manual scroll through the document.. looks good!
:w # write out to file
:set nohlsearch # debug off
:set nowrapscan # debug off

```

## For More..

Regexs are the gift that just keeps on giving. Here are some good resources on regexs in general, and regexs in VIM.

- [A great modern way to learn regexs.. try them online! interactive flash awesomeness.](http://www.gskinner.com/RegExr/)
- [A neat graphical VI/VIM cheat-sheet](http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html).
- [An advanced VIM/regex tutorial.](http://www.geocities.com/volontir/).
- [More VIM/regex ninja skills.](http://briancarper.net/blog/vim-regexes-are-awesome)
- [Stackoverflow is a good place to find practical ways to solve regex problems with VIM.](http://stackoverflow.com/questions/825764/vim-regex-search-csv-string-and-paste-matches)
- [Probably the most definitive regex site on the 'net](http://www.regular-expressions.info/)
