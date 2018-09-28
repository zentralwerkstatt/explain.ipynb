#!/bin/bash

cwd=$(pwd)
parentdir="$(dirname "$cwd")"

# Install Docker according to https://docs.docker.com/install/linux/docker-ce/ubuntu/
# Original files from: https://github.com/keras-team/keras/tree/master/docker

docker build -t keras --build-arg python_version=3.6 -f Dockerfile_CPU .
# Add 'bash' at the end to run bash instead of Jupyter
docker run -it -p 8888:8888 -p 6006:6006 -v "$parentdir:/data" --env KERAS_BACKEND=tensorflow --env PASSWORD="YOUR PASSWORD HERE" keras