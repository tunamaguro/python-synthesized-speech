FROM  pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

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
    # python3-pip \
    # for ttslearn
    build-essential \
    libsamplerate0 \
    libsndfile1 

COPY ./requirements.txt /tmp/requirements.txt

# Install libralies
RUN pip3 install --no-cache-dir --upgrade pip setuptools \
    && pip3 install --no-cache-dir -r /tmp/requirements.txt

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