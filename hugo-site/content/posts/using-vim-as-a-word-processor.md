---
category:
  - tutorials
date: "2022-03-08T19:43:00+00:00"
guid: https://davidcraddock.net/?p=2958
title: Using VIM as a Word Processor
url: /2022/03/08/using-vim-as-a-word-processor/

---
It may surprise some people to learn that I don't use a word processor to write pure text any more, and haven't for several months. I still have a subscription to Microsoft Office 365, and probably will as long as recruiters and offices around the world still pay the MS tax.

I have created my own custom writing environment in my favourite text editor, VIM. This may sound like an absolutely foolish thing to do to anyone who knows VIM. By default, it is not setup at all to be an effective word processor. It is a programmers text editor, and a very complex and difficult to learn one at that.

Over the past 12 years or so, I have been slowly customizing it to exactly my needs. The great thing about VIM is that it is highly customizable, and you can change almost every major element of it to suit your tastes.

I use the following plugins when writing text or markdown files.

## Vim Pencil

This changes the wrapping mode and a number of other VIM options to make VIM suitable as a word processor instead of just a programmers code editor.

[https://github.com/preservim/vim-pencil](https://github.com/preservim/vim-pencil)

## GOYO

This is a distraction free way of writing. Because of the way I have set it up, there is a lot going on in the default interface of VIM. This strips everything away to just what you see in this screenshot:

![](/wp-content/uploads/2022/03/goyo.png)[https://github.com/junegunn/goyo.vim](https://github.com/junegunn/goyo.vim)

I toggle the 'GOYO' mode by pressing <F12>.

## Spell

VIM's default spellchecker. I use it in British English mode (of course). As soon as I type a misspelled word, it highlights it. Then I can use the arrow keys to skip between each misspelling and fix it with some keyboard shortcuts.

## Wordy

This picks up words which are not helpful. For example, I have a bad habit of using the word 'actually' too many times. Wordy will highlight this. It has a number of dictionaries of 'useless' words which it will check for. It is opinionated, but I find it does help improve the quality of my writing.

[https://github.com/reedes/vim-wordy](https://github.com/reedes/vim-wordy)

## LanguageTool Checker

This is a Java-based command-line open-source grammar and spell checker. It is very thorough and picks up a lot of things. I don't know how it compares to MS Word's checking, but I find it more useful than I remember Word's grammar checker being.

![](/wp-content/uploads/2022/03/languagetoolchecker.png)[https://github.com/dpelle/vim-LanguageTool](https://github.com/dpelle/vim-LanguageTool)

--

For more information on my VIM setup, check out my dotfiles repository at [https://github.com/wordswords/dotfiles](https://github.com/wordswords/dotfiles).
