#!/bin/bash
set -e

set -a
. ./devcontainer-features.env
set +a


if [ ! -z ${_BUILD_ARG_TESTFEATURE1} ]; then

	echo "Activating testfeature1"

	text=${_BUILD_ARG_TESTFEATURE_TEXT:-undefined}
	echo "$text" >> "/home/vscode/testfeature1.txt"
fi
