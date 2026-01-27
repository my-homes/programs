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
cd "/c/Program Files/JetBrains/JetBrains Rider 2025.3.1"
find . -mindepth 1 -maxdepth 1 | xargs -i cp -rpv {} $cwd/tmp/
echo "(1)"
cd $cwd/tmp
echo "(2)"
touch bin/.path
echo "(3)"

#7z a -tzip -r rider.zip *
7z a -t7z -r rider.zip *
echo "(4)"
