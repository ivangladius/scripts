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
    cmake \
    fd \
    the_silver_searcher \
    xorg-server-xvfb \
    ripgrep

RUN useradd -m dockeruser
USER dockeruser

CMD ["emacs"]
