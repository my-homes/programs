#! /usr/bin/env bash
set -uvx
#set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

app="$1"

scoop install git
scoop bucket add extras
scoop bucket add java

#scoop uninstall "$app"
scoop install "$app"
scoop update "$app"

cd $cwd
#rm -rf tmp
#cmd.exe //c rd //s //q tmp
#cmd.exe -c rd -s -q tmp
mkdir -p tmp
./rmdir.cmd tmp
mkdir tmp
cd $cwd/tmp

#cp -rp /c/Users/user/scoop/apps/$app/current/* ./
#xcopy /c/Users/user/scoop/apps/$app/current/* . -s -e
#robocopy "`cygpath -w /c/Users/user/scoop/apps/$app/current`" . -mir
robocopy "C:/Users/user/scoop/apps/$app/current" . -mir

find . -name "*.exe" -print | xargs -i dirname {} | xargs -i touch {}/.path
touch .path-list.txt
find . -name .path | xargs -i dirname {} >> .path-list.txt
find . -name .path -exec rm -rf {} +

7z a -tzip -r $app.zip $(find . -mindepth 1 -maxdepth 1)
