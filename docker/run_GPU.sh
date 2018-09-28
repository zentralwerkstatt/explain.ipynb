#!/bin/bash

cwd=$(pwd)
parentdir="$(dirname "$cwd")"

# Install Docker according to https://docs.docker.com/install/linux/docker-ce/ubuntu/
# Install nvidia-docker according to https://github.com/NVIDIA/nvidia-docker
# Original files from: https://github.com/keras-team/keras/tree/master/docker

docker build -t keras --build-arg cuda_version=9.0 --build-arg cudnn_version=7 -f Dockerfile_GPU .
# Add 'bash' at the end to run bash instead of Jupyter
nvidia-docker run -it -p 8888:8888 -p 6006:6006 -v "$parentdir:/data" --env KERAS_BACKEND=tensorflow --env PASSWORD="YOUR PASSWORD HERE" keras