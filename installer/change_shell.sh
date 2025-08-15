#!/bin/bash

# ===== メッセージ表示 =====
printf '\033[32m%s\033[m\n' '=========================='
printf '\033[32m%s\033[m\n' ' Changing shell to zsh... '
printf '\033[32m%s\033[m\n' '=========================='

# ===== /etc/shells にzshが登録されているか確認・なければ追加 =====
if [ -z $(grep zsh /etc/shells) ]; then
  # zshが未登録なら、zshのパスを/etc/shellsに追加
  echo `which zsh` | sudo tee -a /etc/shells
fi

# ===== 現在のログインシェルがzshかどうか確認・違えば変更 =====
LOGIN_SHELL=$(grep $USER /etc/passwd)
if [[ ! "$LOGIN_SHELL" == *zsh ]]; then
  # ログインシェルがzshでなければ、zshに切り替え
  printf '\033[32m%s\033[m\n' 'Change shell to zsh'
  chsh -s `which zsh`
fi
