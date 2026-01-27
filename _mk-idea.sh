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
cd "/c/idea"
find . -mindepth 1 -maxdepth 1 | xargs -i cp -rpv {} $cwd/tmp/
cd $cwd/tmp
echo "./bin">.path-list.txt

7z a -t7z -r idea.zip  $(find . -mindepth 1 -maxdepth 1)
