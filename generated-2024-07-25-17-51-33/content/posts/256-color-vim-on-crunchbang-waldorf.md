---
category:
  - .vimrc
  - 256-colors
  - crunchbang.-waldorf
  - escape-sequence
  - terminator
date: "2013-06-20T22:15:52+00:00"
guid: http://www.davidcraddock.net/?p=1068
tag:
  - .vimrc
  - 256-colors
  - crunchbang.-waldorf
  - escape-sequence
  - terminator
  - vim
title: 256 Color VIM on Crunchbang Waldorf
url: /2013/06/20/256-color-vim-on-crunchbang-waldorf/

---
To get 256 colors working within terminator in Crunchbang Waldorf, I had to do the following:

1. Add to ~/.bashrc

   ```
   export TERM=xterm-256color
   ```

2. Install a 256 color VIM colorcheme, see [desert256 for example](http://www.vim.org/scripts/script.php?script_id=1243).

3. Add the following to ~/.vimrc:


   ```
   set t_Co=256
   set t_AB=^[[48;5;%dm
   set t_AF=^[[38;5;%dm

   ```


   't\_Co' specifies exactly how many colours VIM can use. The other two lines seem to be Debian-specific color code escape sequences.

4. If you want 256 color VIM for your root user when you sudo edit, then edit /usr/share/vim/vimrc and copy across your settings from your local ~/.vimrc and ~/.vim to this global environment.
