FROM docker.io/ubuntu:latest

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install git git-lfs vim \
                        libwayland-client0 libwayland-egl1 libwayland-cursor0 libwayland-dev libxkbcommon0 \
                        libvulkan1 libvulkan-dev mesa-vulkan-drivers \
                        pipewire-alsa pipewire alsa-utils \
                        mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev \
                        build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev libgl1-mesa-dev libglu1-mesa-dev libasound2-dev libpulse-dev libudev-dev libxi-dev libxrandr-dev


RUN apt-get update && export DEBIAN_FRONTEND=noninternactive \
    && apt-get -y install clang-format black

# Needed to access /tmp as user in order to achieve audio output via pipewire. There might be a smarter way of doing this.
RUN chown -R 1000:1000 /tmp

# Install LFS plugin for large binary-file asset management.
RUN git lfs install

# Install our run script into the image as a shell command
RUN echo '\
    OLD_AUTHORITY=$(basename ${XAUTHORITY}) \n\
    NEW_AUTHORITY_SEARCH=${OLD_AUTHORITY%.*} \n\
    export XAUTHORITY=$(find $(dirname ${XAUTHORITY}) -maxdepth 1 -name *${NEW_AUTHORITY_SEARCH}*) \n'\
    >> /etc/bash.bashrc;

# Setup our "Welcome" message to provide usage tips or other advice...
# First we insert it to our /etc/bash.bashrc and then we change the message.
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && echo -e $(cat /etc/issue) && cat /etc/motd' \
    >> /etc/bash.bashrc; \
    echo "\n\
===================================================================\n\
= Studio Regen Godot Docker Container                             =\n\
===================================================================\n\
(c) Studio Regen (2024-20XX)\n\
\n"\
    > /etc/motd
