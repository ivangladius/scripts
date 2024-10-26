#!/usr/bin/env bash

docker run -it --privileged \
  --env DISPLAY=$DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --name ros1-env-container \
  --net=host \
  ros1-env
