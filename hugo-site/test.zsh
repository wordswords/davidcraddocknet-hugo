#!/bin/zsh

set -e
set -x

snap run hugo server --disableFastRender || echo ''

