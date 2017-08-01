#!/bin/bash

source ./common.sh

if ! which ganda > /dev/null; then
    installing "Ganda"

    curl -sL https://github.com/tednaleid/ganda/releases/download/v0.1.1/ganda_Linux_x86_64.tar.gz -o /tmp/ganda.tar.gz
    (
        cd /tmp
        tar -vxzf /tmp/ganda.tar.gz
    )

    install /tmp/ganda /usr/local/bin/ganda
    rm /tmp/ganda /tmp/ganda.tar.gz /tmp/README.md
fi