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

mkdir -p x32 x64

cd "/c/Program Files (x86)\Racket"
find . -mindepth 1 -maxdepth 1 | xargs -i cp -rpv {} $cwd/tmp/x32/

cd "/c/Program Files\Racket"
find . -mindepth 1 -maxdepth 1 | xargs -i cp -rpv {} $cwd/tmp/x64/

cd $cwd/tmp
echo ".">x32/.path-list.txt
echo ".">x64/.path-list.txt

7z a -tzip -r racket.zip  $(find . -mindepth 1 -maxdepth 1)
