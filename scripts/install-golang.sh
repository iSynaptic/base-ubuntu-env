#!/bin/bash

source ./common.sh

if [ ! -f /usr/local/go/bin/go ]; then
    installing "Go Language (and tools)"
    curl -o /tmp/go.tar.gz -sSL https://dl.google.com/go/go1.17.3.linux-amd64.tar.gz
    tar -C /usr/local -xzf /tmp/go.tar.gz
    rm /tmp/go.tar.gz
fi
