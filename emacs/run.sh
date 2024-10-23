#!/usr/bin/env bash

xhost +local:docker
sudo docker run --rm \
    -e DISPLAY=$DISPLAY \
    -e HOME=/home/hostuser \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME:/home/hostuser \
    -w /home/hostuser \
    --name emacs-docker \
    emacs-native-docker
	
xhost -local:docker
