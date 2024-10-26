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
    sbcl \
    the_silver_searcher \
    xorg-server-xvfb \
    ripgrep \
    python \
    python-pip \
    nodejs \
    npm \
    clang \
    llvm \
    make \
    autoconf \
    automake \
    texinfo \
    libgccjit \
    sqlite \
    libxml2 \
    libxslt \
    aspell \
    aspell-en \
    hunspell \
    hunspell-en_US \
    shellcheck \
    tree \
    htop \
    tmux \
    openssh \
    gnupg \
    jq \
    yq \
    fzf

RUN useradd -m dockeruser
USER dockeruser

CMD ["emacs"]
