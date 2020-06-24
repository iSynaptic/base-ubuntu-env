#!/bin/bash

source ./common.sh

if ! which navi >> /dev/null; then
    installing "Navi"
    curl -o /tmp/navi.tar.gz -sSL https://github.com/denisidoro/navi/releases/download/v2.7.0/navi-v2.7.0-x86_64-unknown-linux-musl.tar.gz
    (
        cd /tmp
        tar -xf navi.tar.gz
    )

    install /tmp/navi /usr/local/bin/navi
    rm /tmp/navi /tmp/navi.tar.gz
fi