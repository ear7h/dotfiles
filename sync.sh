#/bin/sh
set -e

BASE_NAME=`basename $(pwd)`
if [[ $BASE_NAME != "dotfiles" ]]; then
	echo 'you must run this script from the dotfiles repo'
	echo 'exiting'
	exit 1
fi

if [[ ! $HOME ]]; then
	echo '$HOME not set'
	echo 'exiting'
	exit 1
else
	echo "syncing `pwd` with $HOME"
	read -p 'press y/Y to continue: ' -n 1 ok
	echo

	if [[ $ok != 'y' && $ok != 'Y' ]]; then
		echo 'exiting'
		exit 1
	fi
fi


rsync -vr --update --progress --files-from=file_list.txt home $HOME
rsync -vr --update --progress --files-from=file_list.txt $HOME home

