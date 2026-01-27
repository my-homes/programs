#! /usr/bin/env bash
set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

scoop install git
scoop bucket add extras
scoop bucket add java

scoop install deno yt-dlp ffmpeg python swig zulu17-jdk
scoop update deno yt-dlp ffmpeg python swig zulu17-jdk

cd $cwd
rm -rf tmp
mkdir tmp
cd $cwd/tmp

mkdir -p deno
cp -rp /c/Users/user/scoop/apps/deno/current/* deno/

find . -name "*.exe" -print | xargs -i dirname {} | xargs -i touch {}/.path
find . -name .path
touch zulu17-jdk/.java_home
find . -name .java_home

7z a -tzip -r programs.zip *
