#!/bin/bash

# ===== シンボリックリンク作成処理 =====
printf '\033[32m%s\033[m\n' '========================'
printf '\033[32m%s\033[m\n' ' Setting up symlinks... '
printf '\033[32m%s\033[m\n' '========================'

DOTFILES_DIR="$HOME/dev/github.com/naoHash/dotfiles_pub"
CONFIG_SRC="$DOTFILES_DIR/.config"
CONFIG_DEST="$HOME/.config"

# dotfilesリポジトリ自体をホーム直下にリンク
ln -snf "$DOTFILES_DIR" ~

# ~/.configディレクトリがなければ作成
mkdir -p "$CONFIG_DEST"

# .config配下の各ディレクトリを~/.configにリンク
cd "$CONFIG_SRC"
for dir in "$CONFIG_SRC"/*/; do
  # ディレクトリのみ対象
  [ -d "$dir" ] || continue
  echo "Creating symbolic link: $dir -> $CONFIG_DEST"
  ln -snf "$dir" "$CONFIG_DEST"
done
