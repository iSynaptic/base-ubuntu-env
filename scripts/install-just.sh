#!/bin/bash

source ./common.sh

if ! which just >> /dev/null; then
    installing "Just 1.23.0"
    curl -o /tmp/just.tar.gz -sSL https://github.com/casey/just/releases/download/1.23.0/just-1.23.0-x86_64-unknown-linux-musl.tar.gz
    (
        cd /tmp
        tar -xf just.tar.gz
    )

    install /tmp/just /usr/local/bin/just
    rm /tmp/just /tmp/just.tar.gz
fi