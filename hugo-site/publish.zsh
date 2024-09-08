#!/bin/zsh

set -e
set -x

rm -rf public/*
git add -f .
git commit -m "Latest hugo modification"
snap run hugo
git add -f .
git commit -m "Latest hugo publish"
git push origin main


