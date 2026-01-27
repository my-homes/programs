#! /usr/bin/env bash
set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

#git-release-clear

name=$1
version=$name.v$ts

echo $name $version https://github.com/my-homes/programs/releases/download/$version/$name.zip>$name.url.txt

tag="$version"
cd $cwd
git add .
git commit -m"$tag"
git tag -a "$tag" -m"$tag"
git push origin "$tag"
git push origin HEAD:main
#git remote -v

git-release-create $version tmp/$name.zip

echo https://github.com/my-homes/programs/raw/main/$name.url.txt
