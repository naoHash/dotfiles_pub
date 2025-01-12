#!/bin/bash

# ===== 1. Homebrewのインストール =====
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrewがインストールされていません。インストールを開始します。"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

# ===== 3. SSHキーの作成 =====
KEY_PATH="$HOME/.ssh/github_ed25519"
CONFIG_FILE="$HOME/.ssh/config"

# SSH秘密鍵の作成
if [ -f "$KEY_PATH" ]; then
  echo "鍵 $KEY_PATH はすでに存在します。生成をスキップします。"
else
  echo "GitHub用のSSHキーを生成します（コメントなし）。"
  ssh-keygen -t ed25519 -f "$KEY_PATH" -N "" -C ""
  echo "SSHキーが生成されました: $KEY_PATH"
fi

# 公開鍵を表示し、クリップボードにコピー
if command -v pbcopy >/dev/null 2>&1; then
  echo "公開鍵をクリップボードにコピーします。"
  cat "${KEY_PATH}.pub" | pbcopy
  echo "公開鍵がクリップボードにコピーされました。GitHubに貼り付けてください。"
else
  echo "公開鍵の内容:"
  cat "${KEY_PATH}.pub"
  echo
  echo "この公開鍵を GitHub の設定に追加してください: https://github.com/settings/keys"
fi

# ===== 4. SSH設定ファイルの作成・更新 =====
if [ ! -f "$CONFIG_FILE" ]; then
  echo "SSH設定ファイルが見つかりません。新しく作成します。"
  touch "$CONFIG_FILE"
fi

# GitHub用のエントリを追加
if grep -q "Host github.com" "$CONFIG_FILE"; then
  echo "SSH設定ファイルにすでにGitHub用の設定が存在します。"
else
  echo "SSH設定ファイルにGitHub用のエントリを追加します。"
  {
    echo ""
    echo "# GitHub用設定"
    echo "Host github.com"
    echo "  HostName github.com"
    echo "  User git"
    echo "  IdentityFile $KEY_PATH"
    echo "  IdentitiesOnly yes"
  } >> "$CONFIG_FILE"
  echo "SSH設定ファイルが更新されました。"
fi

# 設定ファイルと鍵の権限を適切に設定
chmod 600 "$CONFIG_FILE"
chmod 600 "$KEY_PATH"
chmod 644 "${KEY_PATH}.pub"

# zshenv
ln -snf $DOT_DIR_SOURCE/.config/zsh/.zshenv ~
source $HOME/.zshenv

bash $DOT_DIR_SOURCE/installer/setup_symlinks.sh
bash $DOT_DIR_SOURCE/installer/install_packages.sh
