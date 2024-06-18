FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime

RUN apt-get update && apt-get install -y curl git build-essential libsamplerate0 libsndfile1 && apt-get clean

# ここからは筆者が追記しました
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
RUN pip3 install --no-cache-dir --upgrade pip setuptools cmake wheel
ADD requirements.txt /home/$USERNAME/workspaces/requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

