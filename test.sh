#! /usr/bin/env bash
set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

cd tmp
find . -name "*.exe" -print | xargs -i dirname {} | xargs -i touch {}/.path
find . -name .path
