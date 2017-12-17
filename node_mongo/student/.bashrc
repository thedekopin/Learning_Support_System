# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#script
PS1='\D{%FT%T} \u@\h \w\$ '

# history にコマンド実行時刻を記録する
HISTTIMEFORMAT='%FT%T '

