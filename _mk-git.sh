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

mkdir -p git
cp -rp /c/Users/user/scoop/apps/git/current/* ./
#touch cmd/.path
echo "./cmd">.path-list.txt

7z a -tzip -r git.zip *
