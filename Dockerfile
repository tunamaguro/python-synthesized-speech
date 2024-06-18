FROM  nvcr.io/nvidia/cuda:12.4.1-cudnn-runtime-ubuntu22.04

ENV TZ=Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive=value

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
    wget \
    git \
    curl \
    unzip \
    # ffmpeg \
    sudo \
    python3 \
    python3-pip \
    # for ttslearn
    build-essential \
    cmake \
    clang \
    libssl-dev \
    gcc \
    g++ \
    libsamplerate0 \
    libsndfile1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# COPY ./requirements.txt /tmp/requirements.txt

# Set non root user
ARG USERNAME=vscode
ARG GROUPNAME=vscode
ARG UID=1000
ARG GID=1000
ARG PASSWORD=vscode
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/workspaces

# Install libralies
# RUN pip3 install --no-cache-dir --upgrade pip setuptools cmake \
#     && pip3 install --no-cache-dir -r /tmp/requirements.txt

