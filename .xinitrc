#!/bin/sh

#~/.xinitrc
# Excuted by startx or xinit for running window manager and initialization commands

# This is for importing the .xprofile on startup
# Make sure this is before the 'exec' command or it won't be sourced
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Execute window manager:
#exec dbus-launch dwm
