#! /usr/bin/env bash
set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

scoop install deno yt-dlp ffmpeg
scoop update deno yt-dlp ffmpeg

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

find .

7z a -tzip -r programs.zip *
