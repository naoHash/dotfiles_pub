#!/bin/bash

GHQ_HOME="$HOME/dev"
DOT_DIR_SOURCE="$HOME/dev/github.com/naoHash/dotfiles_pub"

# 色付きのメッセージ表示
print_message() {
  printf '\033[32m%s\033[m\n' "$1"
}

# Preztoのインストール
install_zprezto() {
  if [[ ! -e "$GHQ_HOME/github.com/sorin-ionescu/prezto" ]]; then
    print_message 'Installing Prezto...'
    ghq get https://github.com/sorin-ionescu/prezto.git || return 1
  fi
  ln -snf "$GHQ_HOME/github.com/sorin-ionescu/prezto" "$ZDOTDIR/.zprezto" || return 1
}

# Tmux Plugin Manager (TPM) のインストール
install_tpm() {
  if [[ ! -e "$GHQ_HOME/github.com/tmux-plugins/tpm" ]]; then
    print_message 'Installing Tmux Plugin Manager (TPM)...'
    ghq get https://github.com/tmux-plugins/tpm || return 1
  fi
  mkdir -p "$XDG_CONFIG_HOME/tmux/plugins" || return 1
  print_message 'Creating symbolic link: tmux/plugins'
  ln -snf "$GHQ_HOME/github.com/tmux-plugins/tpm" "$XDG_CONFIG_HOME/tmux/plugins" || return 1
  bash "$XDG_CONFIG_HOME/tmux/plugins/tpm/scripts/install_plugins.sh" || return 1
}

main() {
  print_message '========================'
  print_message 'Installing packages...'
  print_message '========================'

  install_zprezto
  install_tpm
}

# mainの実行
main "$@"
