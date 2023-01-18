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
#alias sht='xdotool search "" windowkill %@ ; shutdown -h now'  # a solution for shutting down, might try if issues happened, might add to rbt, alt+shift+q as well, still doesn't work
alias open='xdg-open'
alias cp='cp -rv'
alias rm="rm -i"  # I'm a dumbass
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias mv='mv -v'
alias nvim='nvim -pN'
alias vim='nvim -pN'
alias bi='bicon.bin'
alias sxiv='rsxiv'  # a script to browse all directroy images in sxiv
alias nnn='nnn -e'
alias transmission='stig'
alias nmutt='cd $HOME/dls/email_attachments/ && neomutt'
alias xclip='xclip -selection clipboard'
alias dns-up='sudo opennic-up -f /etc/resolv.conf'
alias pipin='python3 -m pip install --upgrade'
alias pipun='python3 -m pip uninstall'
alias cheat='cht.sh'
alias mnt='udiskie-mount -a'
alias umnt='udiskie-umount -a'
alias arduino-serial='picocom -c'
alias android-qemu='qemu-system-x86_64 -enable-kvm -m 4G -drive file=~/unsorted/android/android-img.img'
alias vimwiki='cd $VIMWIKI && nvim index.wiki'
alias timer='termdown'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'  # for git bare repo, ref: https://news.opensuse.org/2020/03/27/Manage-dotfiles-with-Git/

set HISTFILESIZE=300
set HISTSIZE=300

# pacman
alias remove-orphans='sudo pacman -Rns $(pacman -Qqdt)'

# home directory cleanup:
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias arduino='arduino-cli --config-file $XDG_CONFIG_HOME/arduino/arduino-cli.yaml'

# Console colors: https://wiki.archlinux.org/title/Color_output_in_console
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip -color=auto"
export LESS='-R --use-color -Dd+b$Du+c'  # see man less, also colors man
alias ls='ls --color=auto -h'

# Command not found handler
source /usr/share/doc/pkgfile/command-not-found.bash  # requires pkgfile, see the wiki to enable automatic updates

# Auto cd
shopt -s autocd


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
