#!/bin/bash

source ./common.sh

if ! which docker > /dev/null; then
    installing "Docker"

    curl -sSL https://get.docker.com | sh

    gpasswd -a vagrant docker
fi

MINIMUM_DC_VERSION=1.15.0
EXISTING_DC_VERSION=$((which docker-compose && (docker-compose --version | awk '{print $3}')) || echo "0.0.0")

if ! which docker-compose >> /dev/null || version_gt $MINIMUM_DC_VERSION $EXISTING_DC_VERSION ; then
    installing "Docker Compose $MINIMUM_DC_VERSION"

    if [ -f /usr/local/bin/docker-compose ]; then
        rm /usr/local/bin/docker-compose
    fi

    curl -sL https://github.com/docker/compose/releases/download/$MINIMUM_DC_VERSION/docker-compose-Linux-x86_64 -o /tmp/dc
    install /tmp/dc /usr/local/bin/docker-compose
    rm /tmp/dc
fi