FROM jrei/systemd-ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-server && \
    systemctl enable ssh
