#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# User added:
alias sus='systemctl suspend'
alias rbt='reboot'
alias sht='shutdown -h now'
alias open='xdg-open'
alias cp='cp -rv'
alias nvim='nvim -pN'
alias sxiv='sxiv -a'
alias transmission='stig'
alias xclip='xclip -sel clipboard'
alias dns-up='sudo opennic-up -f /etc/resolv.conf'
alias pipin='python3 -m pip install --upgrade'
alias cheat='cht.sh'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'  # for git bare repo, ref: https://news.opensuse.org/2020/03/27/Manage-dotfiles-with-Git/

set -o vi  # open bash in vi-mode


## Right-to-Left language support (Arabic) in terminal:  # fails to start the x server for now
#if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
#  exec bicon.bin
#fi
