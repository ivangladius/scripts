#!/usr/bin/env bash

docker run -it \
    --network host \
  --env DISPLAY=$DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --name ros1-env-container \
  ros1-env
