#!/bin/bash

source ./common.sh

if ! which ganda > /dev/null; then
    installing "Ganda"

    curl -sSL https://github.com/tednaleid/ganda/releases/download/v0.1.6/ganda_0.1.6_linux_amd64.tar.gz -o /tmp/ganda.tar.gz
    (
        cd /tmp
        tar -vxzf /tmp/ganda.tar.gz
    )

    install /tmp/ganda /usr/local/bin/ganda
    rm /tmp/ganda /tmp/ganda.tar.gz /tmp/README.md
fi