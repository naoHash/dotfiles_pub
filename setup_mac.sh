#!/bin/bash

DOT_DIR_SOURCE="$HOME/dev/github.com/naoHash/dotfiles_pub"

# ===== 1. Homebrewのインストール =====
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrewがインストールされていません。インストールを開始します。"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "Homebrewがインストールされました。"
else
  echo "Homebrewはすでにインストールされています。"
fi

# ===== 2. ghqのインストール =====
if ! command -v ghq >/dev/null 2>&1; then
  echo "ghqがインストールされていません。インストールを開始します。"
  brew install ghq
  echo "ghqがインストールされました。"
else
  echo "ghqはすでにインストールされています。"
fi

# ===== 3. Homebrewパッケージのインストール（brew.shを呼び出す） =====
bash "$DOT_DIR_SOURCE/installer/brew.sh"

# ===== 4. zshenvのシンボリックリンク作成＆反映 =====
ln -snf $DOT_DIR_SOURCE/.config/zsh/.zshenv ~
source $HOME/.zshenv

# ===== 5. デフォルトシェルをzshに変更 =====
bash $DOT_DIR_SOURCE/installer/change_shell.sh

# ===== 6. dotfiles・.configディレクトリのシンボリックリンク作成 =====
bash $DOT_DIR_SOURCE/installer/setup_symlinks.sh

# ===== 7. Prezto, TPMなどのセットアップ =====
bash $DOT_DIR_SOURCE/installer/install_packages.sh

# ===== 8. macOS システム設定の反映 =====
bash $DOT_DIR_SOURCE/installer/macos_settings.sh
