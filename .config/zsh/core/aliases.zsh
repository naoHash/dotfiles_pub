alias vi='nvim'

alias ls='lsd'
alias l='ls -l'
alias la='ls -la'
alias lt='ls --tree'

alias c='cd'
alias -g rp='| rg'
alias hi='history'
alias cl='clear'

alias dot='cd $HOME/dotfiles'

alias zmv='noglob zmv -W'

alias python='python3'
alias py='python'
alias pip='pip3'

# zshrc setting
alias vz='vi $XDG_CONFIG_HOME/zsh/.zshrc'
alias viz='vi $XDG_CONFIG_HOME/zsh/.zshrc'
alias sz='source $XDG_CONFIG_HOME/zsh/.zshrc'

# xkeysnail
alias restart_xkeysnail='systemctl --user restart xkeysnail'

# display path as one directory per line
alias path='echo $PATH | tr : "\n"'

# VSCode
# UbuntuでCtrl+Shift+Eが効かない問題に対処
if [[ ! "$(uname -r)" == *WSL* ]]; then
  alias code='GTK_IM_MODULE="xim" code'
fi

# --- git ---
alias g='git'
# log
alias gl='git log'
alias gg='git g'  # original function 'graph'
# commit
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcam='git commit --amend -m'
alias gcan='git commit --amend --no-edit'
# diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'
# switch
alias gs='git switch'
alias gsc='git switch -c'
# status
alias gst='git status'
alias gsts='git status -s'
alias gstu='git status -uno'
# cherry-pick
alias gcp='git cherry-pick'
alias gcpn='git cherry-pick -n'
# stash
alias gsp='git stash push'
alias gsa='git stash apply'
alias gspop='git stash pop'
alias gsl='git stash list'
# branch
alias gb='git branch'
alias gbd='git branch -d'
alias gbf='git branch -f'
# staging
alias ga='git add'
alias gap='git add -p'
alias gu='git unstage'
# fetch
alias gf='git fetch'
# push
alias gp='git push'
alias gpu='git push -u'  # --set-upstream
alias gpoh='git push origin HEAD'
# pull
alias gpl='git pull'
# merge
alias gm='git merge'
# tag
alias gt='git tag'
alias gtd='git tag -d'
# remote
alias gr='git remote'
alias grpo='git remote prune origin'
alias grpod='git remote prune origin --dry-run'
# show
alias gsh='git show'
# checkout
alias gch='git checkout'

# git flow
alias gfi='git flow init'
alias gff='git flow feature'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'
alias gfr='git flow release'
alias gfrs='git flow release start'
alias gfrf='git flow release finish'
alias gfh='git flow hotfix'

# Open git repository website
alias brouse='git_brouse_current_repository'

# --- docker ---
alias d='docker'
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcr='docker-compose restart'
alias dcp='docker-compose ps'
alias dcl='docker-compose logs'
alias dco='docker container'
alias dcol='docker container ls -a'
alias dil='docker image ls -a'

# --- tmux ---
alias t='tmux'

# --- other ---
alias quit='exit'
alias q='quit'

# ghq
alias de='cd $(ghq list -p | fzf)'

