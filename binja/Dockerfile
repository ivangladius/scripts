FROM ubuntu:22.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    libstdc++6 \
    libgcc-s1 \
    libc6 \
    libqt6widgets6 \
    libqt6core6 \
    libqt6gui6 \
    libxcb-xinerama0 \
    libxcb-cursor0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-xfixes0 \
    libxrender1 \
    libxi6 \
    libxcomposite1 \
    libxcursor1 \
    libxtst6 \
    libxrandr2 \
    wget \
    locales

# Set locale to UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Create a non-root user
RUN useradd -ms /bin/bash user

# Copy the entire current directory to /opt/binaryninja in the container
COPY . /opt/binaryninja

# Set the ownership to the non-root user
RUN chown -R user:user /opt/binaryninja

# Switch to the non-root user
USER user

# Set the working directory
WORKDIR /opt/binaryninja

# Set the entrypoint to run Binary Ninja
ENTRYPOINT ["./binaryninja"]
