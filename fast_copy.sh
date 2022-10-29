
#!/bin/bash


# get colors
. $(dirname "$0")/colors.sh


TARGET_DIR=$(find -L ~ -type d | fzf)

if [[ -f $1 ]]; then
    cp $1 $TARGET_DIR
elif [[ -d $1 ]]; then
    cp -r $1 $TARGET_DIR
else
    echo -e "\n\n${Red}### cannot copy $1 ( src is not a file or dir ) ### ${Color_Off}\n\n"
    exit 1
fi



ls -allt $TARGET_DIR | less

if [[ -f $1 ]] || [[ -d $1 ]]; then
    echo -e "${Green}\n\n### $1 copy succedded ### ${Color_Off}\n\n"
else
    echo -e "${Red}\n\n### could not copy $1 ### ${Color_Off}\n\n"
fi



