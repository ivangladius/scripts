#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export PATH="~/.local/bin:$PATH"
export PATH="~/scripts:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

setxkbmap -option caps:escape
xset r rate 200 40

alias e='emacsclient_open'
alias ed='emacsclient_open_doom'
alias ee='emacsclient_open_dired'
alias ec='emacsclient_open_init'

emacsclient_open() {
    emacsclient -nw \
		--create-frame \
		--alternate-editor="" \
		--eval "(client-persp-new \"$PWD/$1\")"
}

emacsclient_open_doom() {
    emacsclient -nw \
		--create-frame \
		--alternate-editor="" 
}

emacsclient_open_dired() {
    emacsclient_open ""
}

emacsclient_open_init() {
    emacsclient_open "~/.emacs.d/init.el"
}

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
alias nconf='nvim ~/.config/nvim/init.lua'

alias te='translate :en'
alias td='translate :de'

alias c='cd $(find ~/ -type d | fzf)'
grep_vim() {
    nvim $(grep -rni $1 | fzf)
}
alias vf='grep_vim'

alias ic='fastcopy.sh'
alias icc='fastcopy_cwd.sh'

alias vpsconn='ssh root@181.215.69.116'
alias vpsconn2='ssh root@152.53.16.238'

alias g='lazygit'

VPS='181.215.69.116'
VPS2='152.53.16.238'

PS1='[\u@\h \W]\$ '

EDITOR='nvim'
VISUAL='nvim'
