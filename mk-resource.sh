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

mkdir -p yt-dlp
cp -rp /c/Users/user/scoop/apps/yt-dlp/current/* yt-dlp/

mkdir -p ffmpeg
cp -rp /c/Users/user/scoop/apps/ffmpeg/current/* ffmpeg/

mkdir -p python
cp -rp /c/Users/user/scoop/apps/python/current/* python/

mkdir -p swig
cp -rp /c/Users/user/scoop/apps/swig/current/* swig/

mkdir -p zulu17-jdk
cp -rp /c/Users/user/scoop/apps/zulu17-jdk/current/* zulu17-jdk/

find .

7z a -tzip -r programs.zip *
