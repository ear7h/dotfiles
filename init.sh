#/bin/bash
set -e
set -x

cd `dirname "$0"`

echo "setting up git..."
cp .gitconfig ~/

if [ $(uname) = "Darwin" ]; then
	git config --global credential.helper osxkeychain
els:sp
	echo "WARNING: this password will be stored in plain text"
	echo "WARNING: use a limited auth token for best security"
	git config --global credential.helper store
fi

echo "prompting for password"
# git push

git submodule update --init --recursive

echo "setting up dotfiles..."
./copy_out.sh
