#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

# PATH edits
PATH=$PATH:~/.programs/Telegram/
export EDITOR=nvim
