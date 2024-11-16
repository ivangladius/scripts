# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="josh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# lsmple format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

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
# lsmple aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#



export PATH="~/.local/bin:$PATH"
export PATH="~/scripts:$PATH"
#export GOPATH=$HOME/go
#export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.qlot/bin:$PATH"
export PATH="$HOME/common-lisp/lem:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/alien/programs/graalvm/graalvm-jdk-17.0.11+7.1/bin:$PATH"
export PATH="/home/max/flutter/flutter/bin:$PATH"

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

alias ls='exa --color=auto'
alias ll='exa -all --icons --color=auto'
alias la='exa -a --color=auto'
alias l='exa --color=auto'
alias ssh='TERM=xterm-256color ssh'


# alias h='bash -c "$(history | awk '{print $2}' | fzf)"'

#alias vim='helix'
#alias nvim='helix'
alias vim='nvim'
alias nvim='nvim'
alias v='nvim $(find ~ -type f | fzf)'
alias vv='nvim $(find . -type f | fzf)'
alias vs='sudo nvim $(sudo find / -type f | fzf)'

alias grep='grep --color=auto'
alias r='. ranger'
alias z='zellij'

alias hconf='nvim ~/.config/helix/config.toml'
alias zconf='nvim ~/.zshrc && source ~/.zshrc'
alias bconf='nvim ~/.bashrc && source ~/.bashrc'
alias yconf='nvim ~/.zshrc && source ~/.zshrc'
alias nconf='nvim ~/.config/nvim/init.lua'
alias iconf='nvim ~/.config/i3/config'
alias qconf='nvim ~/.config/qtile/config.py'
alias sconf='(cd ~/programs/st/ && nvim config.h && sudo make install)'

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
alias vpsconn3='ssh max@128.140.10.7'
vps3scp() {
	scp -r $1 :
}
alias vpsconn4='ssh root@185.198.234.13'

alias vpsconn4user='ssh alien@185.198.234.13'
alias pi='ssh pi@192.168.178.82'
alias sv1='ssh rambo@10.100.8.145'

alias g='lazygit'
alias da='lazydocker'

export VPS='181.215.69.116'
export VPS2='152.53.16.238'
export VPS3ADDR='128.140.10.7'
export VPS3='max@128.140.10.7'

export VPS4ADDR='185.198.234.13'
export VPS4='alien@185.198.234.13'

export PI='192.168.178.82'
export SV1='10.100.8.145'

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
#alias ll='exa -all --icons --icons'
alias l='ls -l --icons'
alias va='. venv/bin/activate'
alias vd='deactivate'


alias gdb64='aarch64-linux-gnu-gdb'
alias gcc64='aarch64-linux-gnu-gcc'
#alias gdb32='aarch64-linux-gnu-gdb'

export IDF_PATH='~/micros/esp8266/ESP8266_RTOS_SDK'
export PATH="$HOME/micros/esp8266/xtensa-lx106-elf/bin:$PATH"

alias stconf='(cd ~/programs/st/ && helix config.h && sudo make install)'
alias proj='cd ~/projects/ && helix .'

#alias code='flatpak run com.vscodium.codium'

build_sbcl() {
  sbcl --load $1 --eval "(sb-ext:save-lisp-and-die \"$2\" :toplevel #'$3 :executable t)"
}

#source <(fzf --zsh)
#source /home/alien/.compgen.sh
alias acode="cursor . --no-sandbox &>/dev/null &"

#alias ros1="source /opt/ros/noetic/setup.zsh"
alias qmake='/home/ubuntu/libs/Qt5.12.3/5.12.3/gcc_64/bin/qmake'

# Function to source ROS1 and change the prompt
# Function to source ROS1 and change the prompt
# ros1() {
#     source /opt/ros/noetic/setup.zsh
#     export PS1="%{$fg[green]%}[ros1]%{$reset_color%} %n@%m:%~\$ "
# }

# Function to source ROS2 and change the prompt
# ros2() {
#     source /opt/ros/foxy/setup.zsh
#     export PS1="%{$fg[red]%}[ros2]%{$reset_color%} %n@%m:%~\$ "
# }

alias mgf2='gf2 -ex "break main" -ex "run"'
alias wpi='ssh berry@192.168.2.15'
WPI='192.168.2.15'
alias xcp='xclip -selection clipboard'
alias p='cd $(find ~/projects/ -maxdepth 1 -type d | fzf) && acode . &'
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin:$PATH
export PATH=$PATH:/home/max/.cargo/bin

export BINANCE_TESTNET_API_KEY="FuNFjmw59elp0GV8zpx0M8FYtiyjq9bmP6sZ1dLnTveK0WyaQz3DX0JJ394n4zpH"
export BINANCE_TESTNET_SECRET_KEY="iwfYh31X4AvwggnLr4t3MIGPNzK69pymFtje2evie55NKtnCxrojTPYkeTJTt2lo"
export CHROME_EXECUTABLE=/snap/bin/chromium
export PATH="$PATH:$HOME/.pub-cache/bin"
#needed to remove zoom when pressing alt + mousewheel:up/down for vscode to
#scroll faster and bind it there
#xfconf-query -c xfwm4 -p /general/zoom_desktop -s false

alias alp1='ssh rambo@10.100.8.145'

alias ros1='~/scripts/ros1/connect.sh'
export PATH="$HOME/programs/lem:$PATH"

alias e='docker run --rm -it --net=host -v $HOME:/home/dockeruser  emacs-native-docker'
alias lem='$HOME/programs/lem/lem -i ncurses'
alias sbcl='rlwrap sbcl'
alias sexec="ansible servers -i $HOME/scripts/servers/inventory.yml -m shell -a "
alias nfs="cd /mnt/nfs_wireguard && ls"

scopy() {
	ansible servers -i $HOME/scripts/servers/inventory.yml -m copy -a "src=$1 dest=$2"
}

aes256-encrypt() {
	openssl enc -aes-256-cbc -salt -pbkdf2 -in $1 -out $2
}

aes256-decrypt() {
	openssl enc -d -aes-256-cbc -pbkdf2 -in $1 -out $2
}


