#! /usr/bin/env bash
#set -uvx
set -e
cd "$(dirname "$0")"
cwd=`pwd`
ts=`date "+%Y.%m%d.%H%M.%S"`

#url-text `url-text https://github.com/my-homes/programs/raw/main/url.txt`
url-text https://github.com/my-homes/programs/raw/main/version-url.txt
line=`url-text https://github.com/my-homes/programs/raw/main/version-url.txt`
version=`echo "$line" | awk '{print $1}'`
url=`echo "$line" | awk '{print $2}'`
url-download-2 tmp.$version.zip $url
