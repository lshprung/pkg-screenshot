# pkg-screenshot

pkg-screenshot is a shell script that can display preview screenshots of packages using xdg-open. Screenshots are provided by screenshots.debian.net, so the package must exist in the Debian repositories. Please note that not all packages have screenshots available to preview.

## Prerequisites

pkg-screenshot requires **jq** to parse the json provided at `https://screenshots.debian.net/json/package/PACKAGENAME` and **xdg-open** to open the image URL

## Usage

```
pkg-screenshot.sh package
```
