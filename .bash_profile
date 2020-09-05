#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# These are copied lines from Luke Smith .bash_profile

# appends a directory to $PATH to run user custom commands
export PATH=$PATH:$HOME/.local/bin:$HOME/.user_scripts:$HOME/.config/nvim/plugged/vim-live-latex-preview/bin

export XDG_CONFIG_HOME=$HOME/.config/

# Setting default applications
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"

# excutes startx automatically after logging in
if [[ "$(tty)" = "/dev/tty1" ]]; then  # if the running tty is tty1 (the default tty)
	pgrep dwm || startx  # find i3 in the processes if not running startx, could change the default wm from ~/.xinitrc, this line could just be startx
fi

