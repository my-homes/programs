#! /usr/bin/env bash
#set -uvx
#set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

scoop install git
scoop bucket add extras
scoop bucket add java

while read -r app; do
  echo $app
  scoop install "$app"
  scoop update "$app"
done <<< $(cat $cwd/programs.txt)

cd $cwd
mkdir -p tmp
./rmdir.cmd tmp
mkdir tmp
cd $cwd/tmp

while read -r app; do
  echo $app
  mkdir -p "$app"
  #cp -rp /c/Users/user/scoop/apps/$app/current/* ./$app/
  robocopy "C:/Users/user/scoop/apps/$app/current" ./$app -mir
done <<< $(cat $cwd/programs.txt)

cd $cwd/tmp
find . -name "*.exe" -print | xargs -i dirname {} | xargs -i touch {}/.path
touch .path-list.txt
find . -name .path | xargs -i dirname {} >> .path-list.txt
find . -name .path -exec rm -rf {} +

7z a -tzip -r programs.zip $(find . -mindepth 1 -maxdepth 1)
