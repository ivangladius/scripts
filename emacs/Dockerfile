# Dockerfile for Arch Linux with Emacs Native Compilation
FROM archlinux:latest

# Install necessary packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    emacs-nativecomp \
    git \
    base-devel \
    gcc \
    xorg-server-xvfb

# Create a default user
RUN useradd -m dockeruser

# Set environment variable
ENV HOME=/home/hostuser

# Set working directory
WORKDIR /home/hostuser

# Switch to non-root user
USER dockeruser

# Set Emacs as the default command
CMD ["emacs"]

