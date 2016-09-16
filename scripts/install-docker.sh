#!/bin/bash

source ./common.sh

if ! which docker > /dev/null; then
    installing "Docker"

    curl -sSL https://get.docker.com | sh

    gpasswd -a vagrant docker
fi

if ! which docker-compose > /dev/null; then
    installing "Docker Compose"

    curl -sL https://github.com/docker/compose/releases/download/1.8.0/docker-compose-Linux-x86_64 -o /tmp/dc
    install /tmp/dc /usr/local/bin/docker-compose
    rm /tmp/dc
fi