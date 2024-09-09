#!/usr/bin/env bash

xhost +local:docker
sudo docker run -it --rm \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -v $HOME:/home/user \
    binaryninja:22.04
xhost -local:docker
