#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

# PATH edits
PATH=$PATH:~/.programs/Telegram/

# Created by `userpath` on 2020-06-26 09:16:30
export PATH="$PATH:/home/pavlo/.local/bin"
