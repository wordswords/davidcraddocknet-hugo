#!/bin/zsh

set -e
set -x

rm -rf public/* || echo ''
sudo chown -R david:users .
git add -f .
git commit -m "Latest hugo modification"
snap run hugo
git add -f .
git commit -m "Latest hugo publish"
git push origin main
cd ~/.hqconfig/hugo-davidcraddocknet-blog
./deploy-davidcraddocknet-hugo.sh

