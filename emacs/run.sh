#!/usr/bin/env bash

xhost +local:docker
docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -e HOME=/home/hostuser \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME:/home/hostuser \
    -w /home/hostuser \
    --name arch-emacs-gui \
    emacs-native-docker
xhost -local:docker
