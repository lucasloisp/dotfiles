abbr g 'git'
abbr gb 'git branch'
abbr gbd 'git branch --delete'
abbr ga 'git add'
abbr gap 'git add -p'
abbr gc 'git commit'
abbr gca 'git commit -a'
abbr gcam 'git commit --amend'
abbr gcb 'git checkout -b'
abbr gco 'git checkout'
abbr gcp 'git cherry-pick'
abbr gd 'git diff'
abbr gdc 'git diff --cached'
abbr gf 'git fetch'
abbr gpl 'git pull'
abbr gm 'git merge'
abbr gp 'git push'
abbr gpr 'git pretty'
abbr gpra 'git pretty --all'
abbr grb 'git rebase'
abbr gst 'git status'
abbr gr 'git remote'

abbr tx 'tmux'
abbr txls 'tmux ls'

set -x EDITOR vim
set -x LANG en_US.UTF-8
set snorin_chevrons blue white blue white
set snorin_show_git_prefix

# Android Development Setup
switch (uname)
case Darwin
    abbr diskusage 'ncdu'

    set -x JAVA_HOME "/Applications/Android Studio.app/Contents/jbr/Contents/Home/"
    set -x ANDROID "$HOME/Library/Android"
    set -x ANDROID_HOME "$ANDROID/sdk"
    set -x ANDROID_SDK_ROOT "$ANDROID/sdk"
    set -x nvm_default_version v16.15.1
    fish_add_path $ANDROID_HOME/emulator
    fish_add_path $ANDROID_HOME/tools
    fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin/
    fish_add_path $ANDROID_HOME/platform-tools
    fish_add_path /usr/local/bin
    fish_add_path /opt/homebrew/bin
    fish_add_path "$HOME/.cargo/bin"
case Linux
    abbr capsctrl 'setxkbmap -option ctrl:nocaps -v'

    set -x JAVA_HOME "/opt/android-studio/jbr"
    set -x ANDROID $HOME/Android
    set -x ANDROID_HOME $ANDROID/Sdk
    set -x SYSTEMD_EDITOR vim
end

# Ruby Development Setup
switch (uname)
case Darwin
    status --is-interactive; and . (rbenv init -|psub)
end