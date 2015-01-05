#!/bin/bash
######################################################
## Configuration file for Xinit - run startx to use. #
## Created by Anthony Clays                          #
######################################################

## X Config
# Set the cursor (needed for Xmonad, among others)
#xsetroot -cursor_name left_ptr
# Load Xresources
#[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# Hide mouse when not in use
unclutter -idle 5 &
# Load xbindkeys
xbindkeys
# Setting keyboard layout in X
setxkbmap -layout be-latin1
# Setting X to lock after 1 minute of inactivity
#xautolock -time 5 -locker ~/bin/lock &
# Starting the urxvt daemon
#urxvtd --quiet --opendisplay --fork
# Starting the powerline daemon
PYTHONPATH=/usr/lib/python3.4/site-packages powerline-daemon -q
# Starting the GnuPG agent
envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh

## Possible WMs/DEs, uncomment the one you want to use
# exec startfluxbox
# exec i3
exec startkde
# exec gnome-session
# exec enlightenment_start
# exec cinnamon-session
# exec startxfce4

# For SLiM: start the selected session
# Possibilities are in /usr/share/xsessions/
# exec $1
