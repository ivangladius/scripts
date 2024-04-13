# Use the latest Arch Linux base image
FROM archlinux:latest

# Update the system and install development tools
RUN pacman -Syu --noconfirm \
    && pacman -S ranger \
		 neovim \
 		 lazygit \
		 git \
		 go \
		 openssh \
		 --noconfirm

# Create a non-root user (e.g., 'devuser') and set up the home directory
#RUN useradd -m devuser

# Switch to the new user
#USER devuser

# Set the home directory as the work directory
#WORKDIR /home/devuser
