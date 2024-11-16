#!/usr/bin/env bash

docker run -it \
  --env DISPLAY=$DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --name ros1-stm32-container \
  --net=host \
  --privileged \
  -v /dev/bus/usb:/dev/bus/usb \
  ros1-stm32
