#! /usr/bin/env bash
set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

git-release-clear

version=v$ts

echo https://github.com/my-homes/programs/releases/download/$version/programs.zip>url.txt
echo $version https://github.com/my-homes/programs/releases/download/$version/programs.zip>version-url.txt

tag="$version"
cd $cwd
git add .
git commit -m"$tag"
git tag -a "$tag" -m"$tag"
git push origin "$tag"
git push origin HEAD:main
#git remote -v

git-release-create $version tmp/programs.zip

echo https://github.com/my-homes/programs/raw/main/url.txt
