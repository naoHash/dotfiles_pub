# ============================
#  Powerlevel10k Instant Prompt
# ============================
# Powerlevel10kのインスタントプロンプトを有効化
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================
#  プラグインと設定の読み込み
# ============================

# Prezto の設定
if [[ -s "$ZDOTDIR/.zprezto/init.zsh" ]]; then
  source "$ZDOTDIR/.zprezto/init.zsh"
fi

# Powerlevel10k のカスタマイズ設定
if [[ -f ~/.config/zsh/.p10k.zsh ]]; then
  source ~/.config/zsh/.p10k.zsh
fi

# fzf (Fuzzy Finder) の設定
if [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/fzf/fzf.zsh" ]]; then
  source "${XDG_CONFIG_HOME:-$HOME/.config}/fzf/fzf.zsh"
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
  export FZF_DEFAULT_OPTS='--height 70% --reverse --border'
fi

# ============================
#  履歴の設定
# ============================

# 履歴に保存しないコマンドの設定
# 特定のコマンドは履歴に保存しないようにします
zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|pwd|mv|la|ll|ls|rm|rmdir)($| )" ]]
}
# ============================
#  その他の設定
# ============================

# zmv（バッチ リネーム）の有効化
autoload -Uz zmv

# ============================
#  Zinit プラグインマネージャのインストールと設定
# ============================

# Zinit のインストール
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} Installing Zinit... %f"
  git clone https://github.com/zdharma-continuum/zinit $HOME/.local/share/zinit/zinit.git
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# Zinit プラグインの設定
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Zinit プラグイン
# This zsh plugin converts "..." to "../.."
zinit light momo-lab/zsh-replace-multiple-dots

# ============================
#  読み込み
# ============================
for func in $ZDOTDIR/functions/*; do
  source $func
done
source "$ZDOTDIR/core/aliases.zsh"
source "$ZDOTDIR/core/options.zsh"

