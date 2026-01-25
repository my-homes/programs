#! /usr/bin/env bash
set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

version=v$ts

echo https://github.com/my-homes/programs/releases/download/$version/abc.txt>url.txt

tag="$version"
cd $cwd
git add .
git commit -m"$tag"
git tag -a "$tag" -m"$tag"
git push origin "$tag"
git push origin HEAD:main
#git remote -v

git-release-create $version abc.txt
