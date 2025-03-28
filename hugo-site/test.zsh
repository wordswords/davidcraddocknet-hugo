#!/bin/zsh

set -e
set -x

hugo --gc --config ./hugo.yaml
hugo server --buildDrafts --config ./hugo.yaml --disableFastRender

