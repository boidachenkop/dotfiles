#
# ~/.bashrc
#


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

# vim = nvim
alias vim='nvim'

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

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
