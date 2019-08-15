#/bin/bash

set -e

if [[ `uname` == 'Darwin' ]]; then
	# install dev tools
	xcode-select --install

	# install homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install $(cat app_list.txt)

else
	sudo apt-get update
	sudo apt-get install -y build-essential vim-nox
	sudo apt-get install $(cat app_list.txt)

fi
