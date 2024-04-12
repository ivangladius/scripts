#i User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#



export PATH="~/.local/bin:$PATH"
export PATH="~/scripts:$PATH"
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
export PATH="/home/max/.qlot/bin:$PATH"

#setxkbmap -option caps:escape
#xset r rate 200 40

alias e='emacsclient_open'
alias ed='emacsclient_open_doom'
alias ee='emacsclient_open_dired'
alias ec='emacsclient_open_init'

alias code='flatpak run com.vscodium.codium'


emacsclient_open() {
    local file_path="$1"
    
    # Check if the path is absolute. If not, prepend the current working directory.
    if [[ "${file_path:0:1}" != "/" ]]; then
        file_path="$PWD/$file_path"
    fi

    emacsclient -nw \
                --create-frame \
                --alternate-editor="" \
                --eval "(client-persp-new \"$file_path\")"
}

# emacsclient_open() {
#     if [[ "${1:0:1}" == "/" ]];then
# 	PATH="$PWD/$1"
#     else
# 	PATH="$1"
#
#     emacsclient -nw \
# 		--create-frame \
# 		--alternate-editor="" \
# 		--eval "(client-persp-new \"$PATH\")"
# }


#emacsclient_open() {
#    emacsclient -nw \
#		--create-frame \
#		--alternate-editor="" \
#		--eval "(client-persp-new \"$PWD/$1\")"
#}

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


# alias h='bash -c "$(history | awk '{print $2}' | fzf)"'

alias vim='nvim'
alias v='nvim $(find ~ -type f | fzf)'
alias vv='nvim $(find . -type f | fzf)'
alias vs='sudo nvim $(sudo find / -type f | fzf)'

alias grep='grep --color=auto'
alias r='. ranger'
alias z='zellij'

alias bconf='nvim ~/.bashrc && source ~/.bashrc'
alias yconf='nvim ~/.zshrc && source ~/.zshrc'
alias nconf='nvim ~/.config/nvim/init.lua'
alias iconf='nvim ~/.config/i3/config'
alias qconf='nvim ~/.config/qtile/config.py'

alias te='translate :en'
alias td='translate :de'

alias h='bash -c "$(history | awk '\''{print $2}'\'' | fzf)"'

alias c='cd $(find ~/ -type d | fzf) && ls'

alias cs='cd $(sudo find / -type d | fzf) && ls'
grep_vim() {
    nvim $(grep -rni $1 | fzf)
}

# alias vf='grep_vim'

# fast_copy() {
#     if [ $# -ne 1 ];then
# 	echo "usage: fc <item_to_copy>"
#     else
# 	cp $1 $(find ~ -type d | fzf)
#     fi
# }

fast_copy() {
    if [ $# -ne 1 ];then
	echo "usage: fc <item_to_copy>"
    else
	if [[ ! -e "$1" ]];then
	    echo "fc error: File $1 does not exist"
	else
	    COPY_PATH=$(find ~ -type d | fzf)
	    cp -r $1 $COPY_PATH
	    if [[ ! -e "$COPY_PATH" ]];then
		echo "copy NOT successfull"
	    else
		echo "copy SUCCESSFUL"
	    fi
	fi
    fi
}

# fast_copy_into_cwd() {
#     if [ $# -ne 1 ];then
# 	echo "usage: fcic <item_to_copy>"
#     else
# 	cp $1 $(find . -type d | fzf)
#     fi
# }
alias fc='fast_copy'
# alias fcic='fast_copy_into_cwd'

alias vpsconn='ssh root@181.215.69.116'
alias vpsconn2='ssh root@152.53.16.238'

alias g='lazygit'

export VPS='181.215.69.116'
export VPS2='152.53.16.238'

# PS1='[\u@\h \W]\$ '

export EDITOR='nvim'
export VISUAL='nvim'

alias xu='sudo xbps-install xbps && sudo xbps-install -Suv'
alias xin='sudo xbps-install'
alias xr='sudo xbps-remove -Rcon'
alias xl='xbps-query -l'
alias xf='xl | grep'
alias xs='xbps-query -Rs'
alias xd='xbps-query -x'
alias clrk='sudo vkpurge rm all && sudo rm -rf /var/cache/xbps/*'
alias ll='exa -all --icons'
alias l='exa -l --icons'

build_arm_asm() {
    as $1.s -o $1.o
    ld $1.o -o $1
}

alias b='build_arm_asm'
alias as32='assembly_arm32_asm'
alias ld32='link_arm32_asm'
alias objdump32='arm-linux-gnueabihf-objdump'

assembly_arm32_asm() {
    arm-linux-gnueabihf-as -o $1.o $1.s
}

link_arm32_asm() {
    arm-linux-gnueabihf-ld -o $1 $1.o
}

