#/bin/bash
set -e
set -x

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
fi

echo "changing default shell..."
chsh -s /bin/zsh

echo "setting up git..."
cp .gitconfig ~/

if [ $(uname) = "Darwin" ]; then
	git config --global credential.helper osxkeychain
else
	echo "WARNING: this password will be stored in plain text"
	echo "WARNING: use a limited auth token for best security"
	git config --global credential.helper store
fi

echo "prompting for password"
git push

git submodule update --init --recursive

echo "installing apps..."
./install_apps.sh

echo "setting up dotfiles..."
./sync.sh
