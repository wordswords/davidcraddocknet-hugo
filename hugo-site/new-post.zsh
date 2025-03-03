#!/bin/bash

set -e
set -x

if [ -z "$1" ]; then
    echo "Usage: $0 <post-name>.md"
    exit 1
fi

hugo new content content/posts/$1

