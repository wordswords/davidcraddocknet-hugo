---
category:
  - uncategorized
date: "2021-10-21T16:44:09+00:00"
guid: http://davidcraddock.net/?p=2755
title: My Simple Commandline Git Workflow
url: /2021/10/21/my-simple-commandline-git-workflow/

---
This is a simple description of how I work 99% of the time, as I am a simpleton. Origin/main is the new origin/master for future repositories, I just note both here for completeness because I use origin master for a lot of current repos.

01. I first make sure I am uptodate on origin/master or origin/main by git pulling.
02. `git checkout origin master`
03. `git pull origin master`
04. I start making changes to the local copy on my local machine.
05. When it gets to a point where I want to save my changes, I:
06. `git stash push`
07. `git checkout -b <branch name which will be made into a PR>`
08. `git stash pop`
09. I then commit the changes to the new branch.
10. `git commit`
11. When I am ready to create the PR, I create and push to the remote branch:
12. `git push origin <branch name which will be made into a PR>`
13. Github will tell me if master/main has diverged past a state where my commits can be merged in without conflict. If there is a possible conflict, I will merge in origin master/main to my local copy and then push to the PR branch again:
14. `git checkout <branch name which will be made into a PR>`
15. `git pull origin master (or origin main)`
16. I resolve locally conflicts through `git mergetool` which, for me, is vim's three way diff tool.
17. I commit the updated conflicts and push to the remote branch - `git add && git commit && git push origin <branch name which will be made into a PR>`
18. Often at this point I find I have to add new commits to fix things I have broken or have been flagged up in PR review.
19. `git commit`
20. `git push origin <branch name which will be made into a PR>`
21. Reviewers now have some of their comments made on stale commits in Github. This is better than squashing the commits I find because sometimes the commits are not stale and their comments are still valid, and it becomes easier to keep track of. They can view the 'files changed' tab to add review comments until they are happy. I loop back to check whether master/main has diverged, and if it hasn't just keep adding commits to address their concerns.
22. The PR gets approved (hopefully)
23. I merge the PR into master or main
24. I delete the old branch
