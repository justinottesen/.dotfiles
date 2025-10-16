FROM osrf/ros:humble-desktop

ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo unzip ninja-build gettext cmake curl build-essential git ripgrep fd-find clang clangd stow tree \
    ros-humble-nav2-msgs ros-humble-irobot-create-msgs inetutils-ping ros-humble-teleop-twist-keyboard ros-humble-gazebo-ros-pkgs \
    ros-humble-turtlebot4-simulator ros-humble-turtlebot4-navigation ros-humble-nav2-bringup ros-humble-slam-toolbox \
    && rm -rf /var/lib/apt/lists/*

# Create user
RUN groupadd --gid 1000 jottesen \
    && useradd --uid 1000 --gid 1000 -m jottesen -s /bin/bash \
    && usermod -aG sudo jottesen \
    && echo "jottesen ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/99_jottesen \
    && chmod 0440 /etc/sudoers.d/99_jottesen

# Craete mount points
RUN mkdir -p /home/jottesen/.ssh \
    && chown -R jottesen:jottesen /home/jottesen/.ssh \
    && chmod 700 /home/jottesen/.ssh \
    && mkdir -p /home/jottesen/.config/nvim \
    && chown -R jottesen:jottesen /home/jottesen/.config/nvim \
    && touch /home/jottesen/.gitconfig \
    && chown -R jottesen:jottesen /home/jottesen/.gitconfig

# Build neovim
RUN git clone --branch v0.11.4 --depth 1 https://github.com/neovim/neovim /tmp/neovim \
    && make -C /tmp/neovim CMAKE_BUILD_TYPE=Release \
    && make -C /tmp/neovim install \
    && rm -rf /tmp/neovim

# Create Workspace
RUN mkdir -p /home/jottesen/ros2_ws/src \
    && chown -R jottesen:jottesen /home/jottesen/ros2_ws

USER jottesen
WORKDIR /home/jottesen

CMD ["/bin/bash"]
