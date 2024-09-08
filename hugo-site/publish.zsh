#!/bin/zsh

set -e
set -x

rm -rf public/*
snap run hugo
git add -f .
git commit -m "Latest hugo publish"
git push origin main


