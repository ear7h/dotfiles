#/bin/sh


set -e
set -x

if [[ `uname` == 'Darwin' ]]; then
	# install dev tools
	xcode-select --install

	# install homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install $(cat app_list.txt)

else
	sudo apt-get update
	sudo apt-get install -y butild-essential
	sudo apt-get install $(cat app_list.txt)

fi
