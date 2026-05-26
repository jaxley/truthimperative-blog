#!/bin/sh

SCRIPT_DIR=$(dirname "$0")
ROOT_DIR=$SCRIPT_DIR/..

if [ "$#" -eq 1 ]; then
	dirname=$(basename "foo-bar.md" .md);
	if [ -f $ROOT_DIR/content/posts/"$1" ]; then
		mkdir $ROOT_DIR/content/posts/$dirname;	
		mv $ROOT_DIR/content/posts/$1 $ROOT_DIR/content/posts/$dirname/;
	fi	
else
	echo "Usage: $0 <post-name.md>"
fi
