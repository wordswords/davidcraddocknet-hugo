#!/bin/zsh

set -e
set -x

hugo server --config ./hugo.yaml --disableFastRender || echo ''

