#!/bin/bash

# ===== macOS システム設定の反映 =====

# --- 外観とデスクトップ ---
# ダークモード
defaults write -g AppleInterfaceStyle -string "Dark"

# --- Dock ---
# Dock自動非表示
defaults write com.apple.dock autohide -bool true
# Dock拡大
defaults write com.apple.dock magnification -bool true
# Dockサイズ
defaults write com.apple.dock tilesize -int 71
# Dock拡大時の最大サイズ
defaults write com.apple.dock largesize -int 63
# Dockエフェクト
defaults write com.apple.dock mineffect -string "genie"
# Dock最近使ったアプリ非表示
defaults write com.apple.dock "show-recents" -bool false

# --- Finder ---
# 拡張子を常に表示
defaults write -g AppleShowAllExtensions -bool true
# パスバー表示
defaults write com.apple.finder ShowPathbar -bool true
# サイドバー表示
defaults write com.apple.finder ShowSidebar -bool true
# 外部ディスクをデスクトップに表示
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# ハードディスクをデスクトップに表示
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# リムーバブルメディアをデスクトップに表示
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# --- ウィンドウ操作 ---
# ダブルクリックでウィンドウをしまう
defaults write -g AppleMiniaturizeOnDoubleClick -bool false

# --- キーボード ---
# キーリピート速度
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 30

# --- トラックパッド ---
defaults write -g com.apple.trackpad.scaling 6.820513
defaults write -g com.apple.trackpad.forceClick 1

# --- サウンド ---
defaults write -g com.apple.sound.beep.volume 1

# --- スクリーンショット ---
# スクリーンショット保存先
defaults write com.apple.screencapture location -string "~/Pictures/ScreenShots"
# スクリーンショット形式
defaults write com.apple.screencapture type -string "png"

# --- アクセシビリティ ---
# 透明度を下げる
defaults write com.apple.universalaccess reduceTransparency -bool true
# モーションを減らす
defaults write com.apple.universalaccess reduceMotion -bool true

# --- バッテリー・電源 ---
# ディスプレイのスリープまでの時間（バッテリー）
sudo pmset -b displaysleep 2
# ディスプレイのスリープまでの時間（AC電源）
sudo pmset -c displaysleep 10

# --- ソフトウェアアップデート ---
# 重要なアップデートを自動インストール
defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

# --- その他 ---
# メニューバーにTime Machineを表示
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"

# --- 起動ディスク ---
# 起動ディスク名（参考情報）
# diskutil info / | grep 'Volume Name'

echo "macOSの主要なカスタマイズ設定を反映しました。"
