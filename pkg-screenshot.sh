#!/bin/sh

if [ -z $1 ]; then
	echo "Error: Missing package name"
	echo "Usage: pkg-screenshot.sh package"
fi

if [ $1 != "--no-download" ]; then
	URL=`wget -qO- https://screenshots.debian.net/json/package/$1 | jq '.screenshots[0].large_image_url' | tr -d \"`
	EXTENSION=`echo $URL | rev | cut -d . -f 1 | rev`
	wget -qO /tmp/pkg-screenshot.$EXTENSION $URL
	xdg-open /tmp/pkg-screenshot.$EXTENSION
else
	URL=`wget -qO- https://screenshots.debian.net/json/package/$2 | jq '.screenshots[0].large_image_url' | tr -d \"`
	xdg-open $URL
fi
