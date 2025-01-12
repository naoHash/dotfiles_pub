#!/bin/bash

printf '\033[32m%s\033[m\n' '========================'
printf '\033[32m%s\033[m\n' ' Setting up symlinks... '
printf '\033[32m%s\033[m\n' '========================'

DOT_DIR_SOURCE="$HOME/dev/github.com/naoHash/dotfiles_pub"

# dotfiles
ln -snf $DOT_DIR_SOURCE ~

# .config
mkdir -p $HOME/.config
cd ${DOT_DIR_SOURCE/.config}
echo $PWD
dirs=$(find $DOT_DIR_SOURCE/.config -maxdepth 1 -mindepth 1 -type d)
for dir in $dirs;
do
  echo "Creating symbolic link: $dir"
  ln -snf $dir $XDG_CONFIG_HOME
done
