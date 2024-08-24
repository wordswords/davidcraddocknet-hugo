---
category:
  - solutions-to-a-specific-problem
date: "2010-01-10T23:06:06+00:00"
guid: http://www.davidcraddock.net/?p=331
title: Config files for the Windows version of VIM
url: /2010/01/10/config-files-for-the-windows-version-of-vim/

---
Today I encountered problems configuring the windows version of the popular text editor [VIM](http://www.vim.org), so I thought I'd write up a quick post talk about configuration files under the Windows version, if anyone becomes stuck like I did. I use Linux, OSX and Windows on a day-to-day basis, and VIM as a text editor for a lot of quick edits on all three platforms. Here's a quick comparison:

### Linux

Linux is easy because that's what most people who use VIM run, and so it is very well tested.

**~/.vimrc** \- Configuration file for command line vim.
**~/.gvimrc** \- Configuration file for gui vim.

### OSX

OSX is simple also, as it's based on unix:

**~/.vimrc** \- Configuration file for command line vim.
**~/.gvimrc** \- Configuration file for gui vim.

### Windows

Windows is not easy at all.. it doesn't have a unix file structure, and doesn't have support for the unix hidden file names, that start with a '.', ie: '.vimrc', '.bashrc', and so on. Most open-source programs like VIM that require these hidden configuration files, and have been ported over to windows, seem to adopt this naming convention: '\_vimrc', '\_bashrc'.. and so forth. So:

**\_vimrc** \- Configuration file for command line vim.
**\_gvimrc** \- Configuration file for gui vim.

Renaming configuration files from "." to "\_" wouldn't make much difference on its own. You'd have to rename your files, but.. big deal. It's not much of a problem.

Another, more tricky, problem you may encounter however, is that there's no clear **home** directory on windows systems. Each major incarnation of windows seems to have a slightly different way of dealing with user's files.. from 2000 to XP, a change, from XP to Vista, there is a change. I haven't tried VIM on W7 yet, but it seems similar to Vista in structure, so this information may actually be consistent to W7.

The Vista 64 version of VIM I have, looks in another place for configuration files. For a global configuration file, it looks in "C:Program Files". Yes.. "C:Program Files". According to Vista 64's version of VIM.. that's the exact directory where I installed VIM. This is clearly not right. What's happening is that the file system on windows is different to the unix-type file systems, and the VIM port is having problems adapting. The real VIM install directory is **C:Program Filesvim72**. Because VIM is looking for a global configuration file in "C:Program Files\_vimrc", it'll never find it.

Now you could override this with a batch file that sets the right environmental variables on startup, or you could change the environmental variables exported in windows, but I prefer to have a user-specified configuration file in my personal files directory, as it's easier to backup and manage. If you wanted to specify the environmental variables yourself, which I'm guessing many will, the two environmental variables to override are:

$VIM = the VIM install directory, not always set properly, as I mentioned.
$HOME = the logged in user's documents and settings directory, in windows speak this is also where the 'user profile' is stored, which is a collection of settings and configurations for the user. The exact directory will depend on which version of Windows you're running, and if you override the HOME folder, you may have problems with other programs that rely on it being static.

On my Windows Vista 64 install:

**$VIM = "C:Program Files"** **$HOME = "C:UsersDave"**

You can see what files VIM includes by running the handy command

```
vim -V
```

 at a command prompt; it will go through the different settings and output something similar to this:

```
Searching for "C:UsersDave/vimfilesfiletype.vim"
Searching for "C:Program Files/vimfilesfiletype.vim"
Searching for "C:Program Filesvim72filetype.vim"
line 49: sourcing "C:Program Filesvim72filetype.vim"
finished sourcing C:Program Filesvim72filetype.vim
continuing in C:UsersDave_vimrc
Searching for "C:Program Files/vimfiles/afterfiletype.vim"
Searching for "C:UsersDave/vimfiles/afterfiletype.vim"
Searching for "ftplugin.vim" in "C:UsersDave/vimfiles,C:Program Files/vimfiles,C:Program Filesvim72,C:Program Files/vimfiles/after,C:UsersDave/vimfiles/after"
Searching for "C:UsersDave/vimfilesftplugin.vim"
Searching for "C:Program Files/vimfilesftplugin.vim"
Searching for "C:Program Filesvim72ftplugin.vim"
line 49: sourcing "C:Program Filesvim72ftplugin.vim"
finished sourcing C:Program Filesvim72ftplugin.vim
continuing in C:UsersDave_vimrc
Searching for "C:Program Files/vimfiles/afterftplugin.vim"
Searching for "C:UsersDave/vimfiles/afterftplugin.vim"
finished sourcing $HOME_vimrc
Searching for "plugin/**/*.vim" in "C:UsersDave/vimfiles,C:Program Files/vimfiles,C:Program Filesvim72,C:Program Files/vimfiles/after,C:UsersDave/vimfiles/after"
Searching for "C:UsersDave/vimfilesplugin/**/*.vim"
Searching for "C:Program Files/vimfilesplugin/**/*.vim"
Searching for "C:Program Filesvim72plugin/**/*.vim"
sourcing "C:Program Filesvim72plugingetscriptPlugin.vim"
finished sourcing C:Program Filesvim72plugingetscriptPlugin.vim
sourcing "C:Program Filesvim72plugingzip.vim"
finished sourcing C:Program Filesvim72plugingzip.vim
sourcing "C:Program Filesvim72pluginmatchparen.vim"
finished sourcing C:Program Filesvim72pluginmatchparen.vim
sourcing "C:Program Filesvim72pluginnetrwPlugin.vim"
finished sourcing C:Program Filesvim72pluginnetrwPlugin.vim
sourcing "C:Program Filesvim72pluginrrhelper.vim"
finished sourcing C:Program Filesvim72pluginrrhelper.vim
sourcing "C:Program Filesvim72pluginspellfile.vim"
finished sourcing C:Program Filesvim72pluginspellfile.vim
sourcing "C:Program Filesvim72plugintarPlugin.vim"
finished sourcing C:Program Filesvim72plugintarPlugin.vim
sourcing "C:Program Filesvim72plugintohtml.vim"
finished sourcing C:Program Filesvim72plugintohtml.vim
sourcing "C:Program Filesvim72pluginvimballPlugin.vim"
finished sourcing C:Program Filesvim72pluginvimballPlugin.vim
sourcing "C:Program Filesvim72pluginzipPlugin.vim"
finished sourcing C:Program Filesvim72pluginzipPlugin.vim
Searching for "C:Program Files/vimfiles/afterplugin/**/*.vim"
Searching for "C:UsersDave/vimfiles/afterplugin/**/*.vim"
Reading viminfo file "C:UsersDave_viminfo" info
Press ENTER or type command to continue

```

Notice how it does pull in all the syntax highlighting macros and other extension files correctly, which are specified in the **.vim** files above.. but it doesn't pull in the global configuration files that I've copied also to **C:Program Filesvim72\_gvimrc** and **C:Program Filesvim72\_vimrc**. However, it does pickup the files I copied to **C:UsersDave**.. both the **C:UsersDave\_vimrc** and **C:UsersDave\_gvimrc** are picked up, although VIM will normally read '\_gvimrc' when the gui version of VIM is run (called gvim).

To see exactly what those environmental variables are being set to, when you're inside the editor, issue these two commands, and their values will be show in the editor:

```
:echo $HOME
:echo $VIM
```

It seems to make sense for me - and perhaps you, if you're working with VIM on windows - to place my \_vimrc and \_gvimrc files configuration files in $HOME in Vista. They are then picked up without having to worry about explicitly defining any environmental variables, creating a batch file, or any other hassle.

You can do this easily by the following two commands:

```
:ed $HOME_vimrc
:sp $HOME_gvimrc
```

That will open the two new configuration files, side by side, and you can paste in your existing configuration that you've used in Linux, and windows will pick them up the next time you start VIM.
