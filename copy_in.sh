#/bin/bash
set -e

DIR=`dirname "$0"`

for file in $(cat $DIR/file_list.txt); do
	echo $file
	cp -r ~/$file $DIR
done
