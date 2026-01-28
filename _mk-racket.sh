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

#cd "/c/racket/x32"
#find . -mindepth 1 -maxdepth 1 | xargs -i cp -rpv {} $cwd/tmp/x32/
robocopy "C:/racket/x32" $cwd/tmp/x32 -mir


#cd "/c/racket/x64"
#find . -mindepth 1 -maxdepth 1 | xargs -i cp -rpv {} $cwd/tmp/x64/
robocopy "C:/racket/x64" $cwd/tmp/x64 -mir

cd $cwd/tmp
echo ".">x32/.path-list.txt
echo ".">x64/.path-list.txt

7z a -tzip -r racket.zip  $(find . -mindepth 1 -maxdepth 1)
