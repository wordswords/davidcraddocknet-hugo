#!/bin/zsh

set -e
set -x

hugo server --disableFastRender || echo ''

