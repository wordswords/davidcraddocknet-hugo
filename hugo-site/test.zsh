#!/bin/zsh

set -e
set -x

hugo --gc --config ./hugo.yaml
hugo server --config ./hugo.yaml --disableFastRender || echo ''

