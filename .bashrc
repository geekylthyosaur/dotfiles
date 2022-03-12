[[ $- != *i* ]] && return

PS1='\W > '

export PATH=$PATH:/home/dmytro/.cargo/bin/

alias syu='sudo pacman -Syu'
alias ss='pacman -Ss'
alias sy='sudo pacman -Sy'
alias s='sudo pacman -S'

alias rcns='sudo pacman -Rcns'

alias ls='ls --color=auto'
alias ..='cd ..'
alias mkdir='mkdir -p'

ff() {
    find . -iname "*$1*"
}
