abbr g 'git'
abbr gb 'git branch'
abbr gbd 'git branch --delete'
abbr ga 'git add'
abbr gap 'git add -p'
abbr gc 'git commit'
abbr gca 'git commit -a'
abbr gcam 'git commit -am'
abbr gcamm 'git commit --ammend'
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

abbr capsctrl 'setxkbmap -option ctrl:nocaps -v'

# if status --is-login
#     set -gx PATH $PATH ~/linux/bin
# end


set -x EDITOR vim
set -x LANG en_US.UTF-8
set snorin_chevrons blue white blue white
set snorin_show_git_prefix

# Android Development Setup
set -x JAVA_HOME /usr/lib/jvm/java-16-openjdk-amd64
set -x ANDROID $HOME/Android
set -x ANDROID_HOME $ANDROID/Sdk
