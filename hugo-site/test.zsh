#!/bin/zsh

set -e
set -x

hugo server --buildDrafts
hugo --gc --config ./hugo.yaml
hugo server --config ./hugo.yaml --disableFastRender || echo ''

