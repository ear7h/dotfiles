#/bin/bash
set -e

DIR=`dirname "$0"`

git submodule upate --init --recursive

for file in $(cat $DIR/file_list.txt); do
	echo $file
	mv $DIR/$file ~/
done
