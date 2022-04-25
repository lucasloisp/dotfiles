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

abbr capsctrl 'setxkbmap -option ctrl:nocaps -v'

set -x EDITOR vim
set -x LANG en_US.UTF-8
set snorin_chevrons blue white blue white
set snorin_show_git_prefix

# Ruby Development Setup
switch (uname)
case Darwin
    status --is-interactive; and . (rbenv init -|psub)
end

# Android Development Setup
switch (uname)
case Darwin
    set -x JAVA_HOME "$HOME/.sdkman/candidates/java/as-embedded"
    set -x ANDROID "$HOME/Library/Android"
    set -x ANDROID_HOME "$ANDROID/sdk"
    fish_add_path $ANDROID_HOME/emulator
    fish_add_path $ANDROID_HOME/tools
    fish_add_path $ANDROID_HOME/tools/bin
    fish_add_path $ANDROID_HOME/platform-tools
    fish_add_path /opt/homebrew/bin
case Linux
    set -x JAVA_HOME ~/.sdkman/candidates/java/17.0.1-open
    set -x ANDROID $HOME/Android
    set -x ANDROID_HOME $ANDROID/Sdk
end
