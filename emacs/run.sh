#!/usr/bin/env bash

xhost +local:docker
docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -e HOME=/home/dockeruser \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME:/home/dockeruser \
    -w /home/dockeruser \
    --name emacs-docker \
    emacs-native-docker \
    /bin/bash
xhost -local:docker
