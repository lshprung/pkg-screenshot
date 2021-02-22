# pkg-screenshot

pkg-screenshot is a shell script that can display preview screenshots of packages using xdg-open. Screenshots are provided by screenshots.debian.net, so the package must exist in the Debian repositories. Please note that not all packages have screenshots available to preview.

## Prerequisites

pkg-screenshot requires **wget** to download screenshots, **jq** to parse the json provided at `https://screenshots.debian.net/json/package/PACKAGENAME` and **xdg-open** to open the image file (saved to the /tmp/ directory)

## Usage

```
pkg-screenshot.sh [options] package
```

### Options

**-h, --help** - Print a help list

**--no-download** - Open the image URL instead of saving an image file in /tmp/
