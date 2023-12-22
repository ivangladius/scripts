#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export PATH="~/.local/bin:$PATH"
export PATH="~/scripts:$PATH"

alias ls='ls --color=auto'
alias ll='ls -all --color=auto'
alias la='ls -a --color=auto'
alias l='ls --color=auto'

alias vim='nvim'
alias v='nvim $(find ~ -type f | fzf)'
alias vv='nvim $(find . -type f | fzf)'

alias grep='grep --color=auto'
alias r='. ranger'
alias z='zellij'

alias bconf='nvim ~/.bashrc && source ~/.bashrc'

alias cppyy=''

alias ic='fastcopy.sh'
alias icc='fastcopy_cwd.sh'

alias vpsconn='ssh root@181.215.69.116'
VPS='181.215.69.116'

PS1='[\u@\h \W]\$ '

EDITOR=nvim
VISUAL=nvim

setxkbmap -option caps:escape
xset r rate 200 40

