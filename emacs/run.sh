#!/usr/bin/env bash

xhost +local:docker
sudo docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -e HOME=/home/dockeruser \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME:/home/dockeruser \
    -w /home/dockeruser \
    emacs-native-docker \
xhost -local:docker
