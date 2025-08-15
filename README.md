# dotfiles_pub

## セットアップ手順

---

### ステップ1：SSHキー作成とGitHub登録

まずはGitHubに安全に接続するためのSSHキーを作成し、公開鍵をGitHubに登録します。

```sh
# Xcode Command Line Toolsのインストール（Homebrewやgitに必須）
xcode-select --install

# SSHキー生成とクリップボードコピー
mkdir -p ~/.ssh
ssh-keygen -t ed25519 -f ~/.ssh/github_ed25519 -N "" -C ""
cat ~/.ssh/github_ed25519.pub | pbcopy

# SSH config作成
cat <<'EOF' >> ~/.ssh/config
# GitHub用設定
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/github_ed25519
  IdentitiesOnly yes
EOF
chmod 600 ~/.ssh/config
```

⬇️

**上記コマンドで生成された公開鍵がクリップボードにコピーされています。下記URLからGitHubにログインし、「New SSH key」などで公開鍵を登録してください。**
- https://github.com/settings/keys

---

### ステップ2：dotfilesセットアップ

SSHキーをGitHubに登録したら、以下をまとめて実行してください。

```sh
# dotfilesリポジトリをクローン
dir=~/dev/github.com/naoHash
mkdir -p "$dir"
cd "$dir"
git clone git@github.com:naoHash/dotfiles_pub.git
cd dotfiles_pub

# setup_mac.shに実行権限を付与
chmod +x ./setup_mac.sh

# セットアップスクリプトを実行
./setup_mac.sh
```
