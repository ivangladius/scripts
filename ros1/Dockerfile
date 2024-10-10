FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y ros-noetic-desktop-full \
    git && \
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

CMD ["/bin/bash"]
