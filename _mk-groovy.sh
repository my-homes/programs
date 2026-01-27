#! /usr/bin/env bash
set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

scoop install git
scoop update git

cd $cwd
rm -rf tmp
mkdir tmp
cd $cwd/tmp

mkdir -p groovy
cp -rp /c/Users/user/scoop/apps/groovy/current/* ./
#touch bin/.path
echo "./bin">.path-list.txt

7z a -tzip -r groovy.zip  $(find . -mindepth 1 -maxdepth 1)
