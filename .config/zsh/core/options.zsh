# "zsh: no matches found:" エラーの対処
# https://www.wwwmaplesyrup-cs6.work/entry/2020/08/08/030240
setopt +o nomatch

# Disable auto correction
unsetopt correct

setopt no_beep

# `git switch feature/#42_xxx`でエラーが出ないようにする
# see: https://teratail.com/questions/316470
setopt NO_EXTENDED_GLOB

# 3秒以上かかった処理は詳細表示
REPORTTIME=3
