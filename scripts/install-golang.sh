#!/bin/bash

source ./common.sh

if [ ! -f /usr/local/go/bin/go ]; then
    installing "Go Language (and tools)"
    curl -o /tmp/go.tar.gz -sSL https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz
    tar -C /usr/local -xzf /tmp/go.tar.gz

    curl -o /tmp/dep -sSL https://github.com/golang/dep/releases/download/v0.3.2/dep-linux-amd64
    install /tmp/dep /usr/local/bin/dep
    rm /tmp/dep
fi
