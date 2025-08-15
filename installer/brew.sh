#!/bin/bash

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

brew update
brew upgrade
brew cleanup
brew autoremove
brew bundle --file="$HOME/dev/github.com/naoHash/dotfiles_pub/Brewfile"