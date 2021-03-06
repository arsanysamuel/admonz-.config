#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '

# User added:

# Prompt colors:  see ANSI colors on github, \[\e[x;ym\] ___ \[\e[0m\] are the color parenthesis
PS1="\[\e[1;91m\][\[\e[1;93m\]\u\[\e[1;92m\]@\[\e[1;94m\]\h \[\e[1;96m\]\W\[\e[1;91m\]]\[\e[0m\]\$ "  # export used only when the variable is required to be seen by other programs

set -o vi  # open bash in vi-mode

# Aliases:
alias sus='systemctl suspend'
alias rbt='reboot'
alias sht='shutdown -h now'
#alias sht='xdotool search "" windowkill %@ && shutdown -h now'  # a solution for shutting down, might try if issues happened, might add to rbt, alt+shift+q as well
alias open='xdg-open'
alias cp='cp -rv'
alias ls='ls --color=auto -h'
alias rm="echo 'Better use tm mate!';rm -ri"  # I'm a dumbass
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias mv='mv -v'
alias nvim='nvim -pN'
alias sxiv='sxiv -a'  # changed sxiv to the aur sxiv bachoseven for full directory browsing, should replace with the script in the arch wiki
alias nnn='nnn -e'
alias transmission='stig'
alias neomutt='cd $HOME/dls/email_attachments/ && neomutt'
alias xclip='xclip -selection clipboard'
alias dns-up='sudo opennic-up -f /etc/resolv.conf'
alias pipin='python3 -m pip install --upgrade'
alias cheat='cht.sh'
alias umount-all='udiskie-umount -a'
alias arduino-serial='picocom -c'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'  # for git bare repo, ref: https://news.opensuse.org/2020/03/27/Manage-dotfiles-with-Git/

set HISTFILESIZE=300
set HISTSIZE=300

# home directory cleanup:
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias arduino='arduino-cli --config-file $XDG_CONFIG_HOME/arduino/arduino-cli.yaml'


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


tm ()  # Move to trash
{
	for file in $@
	do
		mv "$file" ~/.trash/ > /dev/null
		echo "Moved $file to ~/.trash."
	done
}


et ()  # Empty trash
{
	rm  -rf ~/.trash/*
	echo "Trash has been emptied."
}



## Right-to-Left language support (Arabic) in terminal:  # fails to start the x server for now
#if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
#  exec bicon.bin
#fi
