
#!/bin/bash


TARGET_DIR=$(find -L ~ -type d | fzf)

echo $TARGET_DIR

cp $1 $TARGET_DIR

cd $TARGET_DIR

ls

