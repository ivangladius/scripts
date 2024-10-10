
#!/usr/bin/env

xhost +local:docker
docker start ros1-env-container
docker exec -it -w /root ros1-env-container /bin/bash
xhost -local:docker
