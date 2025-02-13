#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias yeet='setxkbmap -option "caps:swapescape"'

export PS1="\[$(tput setaf 165)\]\u\[$(tput setaf 171)\]:\[$(tput setaf 213)\][\h]\[$(tput setaf 219)\]\w\[$(tput setaf 2)\]$ \[$(tput sgr0)\]"

function ll() {
    mkdir -p "$1"
    cd "$1"
}
