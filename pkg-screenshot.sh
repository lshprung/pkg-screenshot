#!/bin/sh

print_usage(){
	echo "Usage: pkg-screenshot.sh [options] package"
	echo ""
	echo " -h, --help     	give this help list"
	echo " --no-download		Open the image URL instead of saving an image file in /tmp/"
}

case $1 in
	-h|--help)
		print_usage
		;;

	--no-download)
		if [ -z $2 ]; then
			echo "Error: Missing package name"
			print_usage
		else
			URL=`wget -qO- https://screenshots.debian.net/json/package/$2 | jq '.screenshots[0].large_image_url' | tr -d \"`
			if [ -z $URL ]; then
				echo "Error: Package \"$2\" does not exist"
			elif [ $URL = "null" ]; then
				echo "Error: Package \"$2\" does not have any screenshots available"
			else
				xdg-open $URL
			fi
		fi
		;;

	*)
		if [ -z $1 ]; then
			echo "Error: Missing package name"
			print_usage
		else
			URL=`wget -qO- https://screenshots.debian.net/json/package/$1 | jq '.screenshots[0].large_image_url' | tr -d \"`
			if [ -z $URL ]; then
				echo "Error: Package \"$1\" does not exist"
			elif [ $URL = "null" ]; then
				echo "Error: Package \"$1\" does not have any screenshots available"
			else
				EXTENSION=`echo $URL | rev | cut -d . -f 1 | rev`
				wget -qO /tmp/pkg-screenshot.$EXTENSION $URL
				xdg-open /tmp/pkg-screenshot.$EXTENSION
			fi
		fi
		;;
esac
