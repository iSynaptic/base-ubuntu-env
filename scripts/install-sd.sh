#!/bin/bash

source ./common.sh

if ! which sd > /dev/null; then
    installing "sd"
    curl -o /tmp/sd.zip -sSL https://github.com/chmln/sd/releases/download/0.6.5/sd-0.6.5-x86_64-unknown-linux-gnu.zip

    (cd /tmp && unzip sd.zip)
    install /tmp/x86_64-unknown-linux-gnu/sd /usr/local/bin/sd
    rm -rf /tmp/sd.zip /tmp/x86_64-unknown-linux-gnu
fi