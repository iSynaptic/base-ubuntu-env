#!/bin/bash

source ./common.sh

if ! which ptail >> /dev/null; then
    installing "ptail"
    curl -o /tmp/ptail.tgz -sSL https://github.com/orf/ptail/releases/download/v0.2.1/ptail-Linux-x86_64.tar.gz

    (
        cd /tmp
        tar -xf ptail.tgz
    )
    install /tmp/ptail /usr/local/bin/ptail

    rm /tmp/ptail /tmp/ptail.tgz
fi