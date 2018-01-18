#!/bin/bash

source ./common.sh

if [ ! -f /usr/local/go/bin/go ]; then
    installing "Go Language"
    curl -o /tmp/go.tar.gz -sSL https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz
    tar -C /usr/local -xzf /tmp/go.tar.gz
fi
