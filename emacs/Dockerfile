# Dockerfile for Arch Linux with Emacs Native Compilation
FROM archlinux:latest

# Install necessary packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    emacs-nativecomp \
    git \
    base-devel \
    gcc \
    zsh \
    wget \
    curl \
    git \
    xorg-server-xvfb

RUN useradd -m dockeruser
ENV HOME=/home/dockeruser
WORKDIR /home/dockeruser

USER dockeruser

RUN git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
RUN ~/.config/emacs/bin/doom install --force

CMD ["emacs"]
