#!/bin/sh

if [ -z $1 ]; then
	echo "Error: Missing package name"
	echo "Usage: pkg-screenshot.sh [options] package"
fi

case $1 in
#if [[ $1 == "-h" || $1 == "--help" ]]; then
	-h|--help)
		echo "Usage: pkg-screenshot.sh [options] package"
		echo ""
		echo " -h, --help     	give this help list"
		echo " --no-download		Open the image URL instead of saving an image file in /tmp/"
		;;

#elif [ $1 != "--no-download" ]; then
	--no-download)
		URL=`wget -qO- https://screenshots.debian.net/json/package/$2 | jq '.screenshots[0].large_image_url' | tr -d \"`
		xdg-open $URL
		;;

#else
	*)
		URL=`wget -qO- https://screenshots.debian.net/json/package/$1 | jq '.screenshots[0].large_image_url' | tr -d \"`
		EXTENSION=`echo $URL | rev | cut -d . -f 1 | rev`
		wget -qO /tmp/pkg-screenshot.$EXTENSION $URL
		xdg-open /tmp/pkg-screenshot.$EXTENSION
		;;
esac
