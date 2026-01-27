#! /usr/bin/env bash
set -uvx
#set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

cd $cwd
rm -rf tmp
mkdir tmp
cd $cwd/tmp

mkdir -p rider
cd "/c/rider"
find . -mindepth 1 -maxdepth 1 | xargs -i cp -rpv {} $cwd/tmp/
cd $cwd/tmp
#touch bin/.path
echo "./bin">.path-list.txt

7z a -tzip -r rider.zip  $(find . -mindepth 1 -maxdepth 1)
