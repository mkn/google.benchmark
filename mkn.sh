#!/usr/bin/env bash
set -e
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR="g"
GIT_URL="https://github.com/google/benchmark"
VERSION="main"
[ ! -d "$CWD/$DIR" ] && git clone --depth 1 $GIT_URL -b $VERSION $DIR --recursive
