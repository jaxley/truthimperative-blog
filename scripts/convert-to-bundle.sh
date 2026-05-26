#!/bin/sh

SCRIPT_DIR=$(dirname "$0")
ROOT_DIR=$SCRIPT_DIR/..

if [ "$#" -eq 1 ]; then
	filename=$(basename $1);
	dirname=$(dirname $1);
	if [ -z "$dirname" ]; then
		dirname='content/posts';
	fi
	post_bundle_dir=$(basename $filename .md);
	if [ -f $ROOT_DIR/$dirname/$filename ]; then
		mkdir $ROOT_DIR/$dirname/$post_bundle_dir;	
		mv $ROOT_DIR/$dirname/$filename $ROOT_DIR/$dirname/$post_bundle_dir/index.md;
	fi	
else
	echo "Usage: $0 <post-name.md>"
fi
