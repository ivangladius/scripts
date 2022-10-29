
#!/bin/bash


TARGET_DIR=$(find -L ~ -type d | fzf)

cp $1 $TARGET_DIR

cd $TARGET_DIR


ls -f

if [[ -f $1 ]]; then
    echo -e "\n\n### $1 copy succedded ### \n\n"
else
    echo -e "\n\n### could not copy $1 ### \n\n"
fi



