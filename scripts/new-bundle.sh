#!/bin/sh

if [ "$#" -eq 1 ]; then

	hugo new --kind post-bundle posts/$1
else
	echo "Usage: $0 <post-name-with-dashes>"
fi
