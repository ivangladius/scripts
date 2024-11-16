
#!/usr/bin/env

xhost +local:docker
docker start ros1-stm32-container
docker exec -it -w /root ros1-stm32-container /bin/bash
xhost -local:docker
