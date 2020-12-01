#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# User added:

set -o vi  # open bash in vi-mode

# Aliases:
alias sus='systemctl suspend'
alias rbt='reboot'
alias sht='shutdown -h now'
alias open='xdg-open'
alias cp='cp -rv'
alias ls='ls --color=auto -h'
alias nvim='nvim -pN'
alias sxiv='sxiv -a'  # changed sxiv to the aur sxiv bachoseven for full directory browsing, should replace with the script in the arch wiki
alias nnn='nnn -e'
alias transmission='stig'
alias xclip='xclip -selection clipboard'
alias dns-up='sudo opennic-up -f /etc/resolv.conf'
alias pipin='python3 -m pip install --upgrade'
alias cheat='cht.sh'
alias umount-all='udiskie-umount -a'
alias arduino='arduino-cli --config-file $XDG_CONFIG_HOME/arduino/arduino-cli.yaml'
alias arduino-serial='picocom -c'
alias spraicap="source ~/.venv/spraicap/bin/activate && cd ~/Projects/elhassan/spraicap_robotic_arm/software/spraicap/python"  # temporary alias

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'  # for git bare repo, ref: https://news.opensuse.org/2020/03/27/Manage-dotfiles-with-Git/


## Functions:

n ()  # opens nnn and cd to the directory when exiting, alternative to shell keybindinig in nnn
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -e "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}




## Right-to-Left language support (Arabic) in terminal:  # fails to start the x server for now
#if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
#  exec bicon.bin
#fi
