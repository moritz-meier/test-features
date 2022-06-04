#!/bin/bash
set -e

set -a
. ./devcontainer-features.env
set +a


if [ ! -z ${_BUILD_ARG_TESTFEATURE1} ]; then

	echo "Activating testfeature1"

	text=${_BUILD_ARG_TESTFEATURE1_TEXT:-undefined}
	echo "$text" >> "/home/vscode/testfeature1.txt"
fi

if [ ! -z ${_BUILD_ARG_JLINK_TOOLS} ]; then

	version=$_BUILD_ARG_JLINK_TOOLS_VERSION
	echo "Installing JLink tools $version"

	apt update -y && apt install -y curl
	curl -s -X POST \
		-d "accept_license_agreement=accepted&submit=Download+software" \
		-o "/tmp/jlink.deb" \
		"https://www.segger.com/downloads/jlink/JLink_Linux_$version.deb"

	apt install -fy "/tmp/jlink.deb"
fi
