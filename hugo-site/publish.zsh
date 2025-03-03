#!/bin/zsh

set -e
set -x

rm -rf public/* || echo ''
sudo chown -R david:users .
git add -f .
git commit -m "Latest hugo modification" || echo ''
hugo
git add -f .
git commit -m "Latest hugo publish" || echo ''
git push origin main
cd ~/.hqconfig/swag-deploy/hugo-davidcraddocknet-blog
./deploy-davidcraddocknet-hugo.sh

