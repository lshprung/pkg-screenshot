#!/bin/sh

if [ -z $1 ]; then
	echo "Error: Missing package name"
	echo "Usage: pkg-screenshot.sh package"
fi

URL=`wget -qO- https://screenshots.debian.net/json/package/$1 | jq '.screenshots[0].large_image_url' | tr -d \"`
xdg-open $URL
