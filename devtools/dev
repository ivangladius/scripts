#!/usr/bin/bash

CURRENT_USER=$(id -u)
if [[ "$CURRENT_USER" == "0" ]];then
    BASE_PATH="/"
else
    BASE_PATH="$HOME"
fi
TOOL="$1"
FPATH="$2"
if [[ -n "FPATH" && -n "$TOOL" ]]; then
    # Use the current working directory's absolute path for the work directory
    WORKDIR_PATH=$PWD
    # Run the Docker container with the appropriate settings
    docker run -it -v "$BASE_PATH:$BASE_PATH" -w "$WORKDIR_PATH" -u "$(id -u):$(id -g)" -e HOME="$HOME" arch-devtools $TOOL $FPATH
else
    echo "Tool name or path is missing!"
fi
