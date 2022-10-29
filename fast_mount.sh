
#!/bin/bash


USER=$(whoami)


if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

. $(dirname "$0")/colors.sh

if ! [[ -x "$(command -v lsblk)" ]]; then
    echo -e "${Red} command lsblk is required but not found! ${Color_Off}" >&2
    exit 1
fi


TARGET_PART=$(lsblk | grep part | fzf)

# grep partition name

PART_NAME=$(echo $TARGET_PART | grep -o "\w*" | head -n1)

DEV_NAME="/dev/${PART_NAME}"

TARGET_DIR=$(find / -type d | fzf)

mount $DEV_NAME $TARGET_DIR

sleep 0.1

cd $TARGET_DIR






