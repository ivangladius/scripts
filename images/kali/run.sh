
#!/usr/bin/env bash

docker run -it --rm \
  --env DISPLAY=$DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --name kali-docker-container \
  --net=host \
  kali-docker
