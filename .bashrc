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

setxkbmap -option caps:escape
xset r rate 200 40

alias e='emacsclient_open'
alias ed='emacsclient_open_doom'
alias ee='emacsclient_open_dired'
alias ec='emacsclient_open_init'

#alias code='flatpak run com.vscodium.codium'


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

alias v='nvim $(find ~ -type f | fzf)'
alias vv='nvim $(find . -type f | fzf)'
alias vs='sudo nvim $(sudo find / -type f | fzf)'
alias vim='nvim'

alias grep='grep --color=auto'
alias r='. ranger'
alias z='zellij'

alias pconf='nvim ~/scripts/fastpdf.sh'
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
export VPS='181.215.69.116'
export VPS2='152.53.16.238'
export VPS3ADDR='128.140.10.7'
export VPS3='max@128.140.10.7'

export VPS4ADDR='185.198.234.13'
export VPS4='alien@185.198.234.13'

export PI='192.168.178.82'
export SV1='10.100.8.145'


alias vpsconn='ssh root@181.215.69.116'
alias vpsconn2='ssh root@152.53.16.238'
alias vpsconn3='ssh max@128.140.10.7'
vps3scp() {
	scp -r $1 :
}
alias vpsconn4='ssh root@185.198.234.13'

alias g='lazygit'

PS1='[\u@\h \W]\n > '

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
#alias ll='exa -all --icons'
#alias l='exa -l --icons'

alias mgdb='gdb-multiarch'

# AARCH64 
alias armld64='aarch64-linux-gnu-ld'
alias armas64='aarch64-linux-gnu-as'
alias armgcc64='aarch64-linux-gnu-gcc'
alias qarm64='qemu-aarch64 -L /usr/aarch64-linux-gnu/ '

#ARM32
alias armld32='arm-linux-gnueabihf-ld'
alias armas32='arm-linux-gnueabihf-as'
alias armgcc32='arm-linux-gnueabihf-gcc'
alias qarm32='qemu-arm -L /usr/arm-linux-gnueabihf'
build_arm_asm() {
    as $1.s -o $1.o
    ld $1.o -o $1
}


assembly_arm32_asm() {
    arm-linux-gnueabihf-as -o $1.o $1.s
}

link_arm32_asm() {
    arm-linux-gnueabihf-ld -o $1 $1.o
}
#
# docker_arch_devtool() {
# 	TOOL="$1"
# 	MOUNT_PATH="$2"
# 	if [[ -n $MOUNT_PATH && -n $TOOL ]];then
# 	    ABS_PATH=$(realpath $MOUNT_PATH)
# 	    docker run -it --rm -v $ABS_PATH:$ABS_PATH -w $(realpath .) -u "$(id -u):$(id -g)" -e HOME=/ABSarch-devtools $TOOL
# 	else
# 	    echo "tool name or path is missing!"
# 	fi
# }

#alias vim='devtools nvim'
#alias g='devtools lazygit'
#. "$HOME/.cargo/env"


alias ma='. venv/bin/activate'
alias md='deactivate'

# generate_golang_script() {
#     set -x
#
#     SCRIPT_FILE_CONTENT="
#     package main
#
#     import (
# 	    "fmt"
# 	    "github.com/bitfield/script"
#     )
#
#     func main() {
#     }"
#
#     SCRIPT_DIR="$1"
#     mkdir "$SCRIPT_DIR"
#     touch "$SCRIPT_DIR/main.go"
#     echo "$SCRIPT_FILE_CONTENT" > "$SCRIPT_FILE_CONTENT"/main.go
#     cd "$SCRIPT_DIR"
#     go mod init "$SCRIPT_DIR"
#     go get -v github.com/bitfield/script
#     cd ..
#     echo "done"
#
# }
#

generate_golang_script() {
    set -x

    SCRIPT_DIR="$1"
    mkdir -p "$SCRIPT_DIR"
    touch "$SCRIPT_DIR/main.go"

    # Use 'cat' to correctly handle multi-line string with proper escaping of internal quotes
    cat <<EOF > "$SCRIPT_DIR/main.go"
package main

import (
    "fmt"
    "github.com/bitfield/script"
)

func main() {
    fmt.Println("Hello, script!")
}
EOF

    # Navigate to the script directory
    cd "$SCRIPT_DIR"

    # Initialize go module, here assuming SCRIPT_DIR is also the module name
    go mod init $(basename "$SCRIPT_DIR")
    go get -v github.com/bitfield/script

    cd ..
    echo "done"
}

export PATH="/home/jack/.qlot/bin:$PATH"
alias da='lazydocker'
alias clg='ssh hacker@pwn.college'
export PATH="/home/asdf/.local/bin:$PATH"
#export PATH="$HOME/jdk-23.0.1/bin:$PATH"

#source ./startup.sh
alias n='nautilus --new-window . &>/dev/null &'
alias cutter='QT_SCALE_FACTOR=2.0 cutter'

#export QT_SCALE_FACTOR=2.0
export PATH="$HOME/.cargo/bin:$PATH"
# alias vim='helix'
alias code='code &>/dev/null'
alias tconf='vim $HOME/.tmux.conf'
alias trel='tmux source-file $HOME/.tmux.conf'

connect_to_tmux_session() {
    SESSION=$(tmux list-sessions | fzf | awk '{print $1}')
    if [[ -n $SESSION ]]; then
        tmux attach -t "$SESSION"
    else
        echo "No session selected."
    fi
}
alias de='tmux detach'
alias dl='connect_to_tmux_session'


cat_or_bat() {
    if command -v bat &>/dev/null; then
	alias cat='bat'
    fi
}

cat_or_bat
