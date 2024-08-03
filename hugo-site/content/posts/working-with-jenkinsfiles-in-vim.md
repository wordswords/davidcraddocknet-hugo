---
category:
  - jenkinsfile
  - lint
  - vim
date: "2022-02-19T05:51:56+00:00"
guid: http://davidcraddock.net/?p=2917
tag:
  - jenkinsfile
  - lint
  - vim
title: Working with Jenkinsfiles in VIM
url: /2022/02/19/working-with-jenkinsfiles-in-vim/

---
Using Jenkinsfiles in repositories for declarative pipelines, which is an example as infrastructure as code, is absolutely the right thing to do, in my opinion.

However the tooling for debugging and error checking Jenkinsfiles is currently quite difficult.

## Setup Jenkinsfile linter

First of all you need to make sure to be able to access the Jenkinsfile linter. This linter is processed on the Jenkins server itself, unusually. There is a configuration option that requires adminstrator access to the Jenkins server.

There are a number of options to access the linter, but Jenkins officially recommends the ssh server option with preshared ssh public keys as outlined here:

[https://www.jenkins.io/doc/book/pipeline/development/](https://www.jenkins.io/doc/book/pipeline/development/)

Once you have set it up, you can pipe Jenkinsfiles through ssh to the linter and it will lint the Jenkinsfile for you:

`ssh jenkins.dev.mycompany.co.uk -p1337 declarative-linter < Jenkinsfile`

(change jenkins.dev.mycompany.co.uk and the port number to match your configuration of course)

And it will output the errors in the file.

## Jenkinsfile syntax highlighting in VIM

VIM won't automatically syntax highlight Jenkinsfiles because they don't have an extension that it recognises. This is easily fixed with the following autocommand added to your .vimrc though:

`autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy`

This will ensure that Jenkinsfiles have some measure of syntax highlighting when loaded, as they are valid Groovy files.

## Jenkinsfile linting on save in VIM

Once you have the linter running on a ssh port (see above) you can add this line to your .vimrc to have the linter run whenever a Jenkinsfile is saved, allowing you to debug your changes when you save them:

`autocmd BufWritePost Jenkinsfile !ssh jenkins.dev.myompany.co.uk -p1337 declarative-linter < %`

(change jenkins.dev.mycompany.co.uk and the port number to match your configuration of course)

This setup should make it significantly easier to spot and fix errors in your Jenkinsfile before it gets to the git commit stage.
