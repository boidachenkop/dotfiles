#
# ~/.bashrc
#
# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# picture viewer alias
alias sw='shotwell'

# sync mac and pc
alias prsync='rsync -avu ~/Desktop/pr pavlo.local:Desktop/'

# ssh uj
alias sshuj='ssh boidache_1124969@spk-ssh.if.uj.edu.pl'

# python 3 as py 
alias py='python3'

# pacman autosudo
alias pacman='sudo pacman'

# vim = nvim, just make a link u dummie 
# alias vim='nvim' 

# rc aliases
alias vimrc='vim ~/.config/nvim/init.vim'
alias bashrc='vim ~/.bashrc'
alias i3rc='vim ~/.config/i3/config'
alias comptonrc='vim ~/.config/compton.conf'

# ls aliases
alias ll='ls -al'
alias l='ls -a'

#cd aliases
alias cdpr='cd /home/pavlo/pr/'
alias cdbr='cd /home/pavlo/Breas-iBridge/iBridge/'
alias cdbrc='cd /home/pavlo/Breas-iBridge/iBridge/proj/ubuntu/'
alias cdiot='cd /home/pavlo/iot-hub/IoThub/'
alias cdiotc='cd /home/pavlo/iot-hub/IoThub/proj/ubuntu/'
alias cdiot2='cd /home/pavlo/Documents/iot-hub/IoThub/'
alias cdiotc2='cd /home/pavlo/Documents/iot-hub/IoThub/build/ubuntu/'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export VISUAL=vim
export EDITOR="$VISUAL"

# Created by `userpath` on 2020-06-26 09:16:30
export PATH="$PATH:/home/pavlo/.local/bin"
