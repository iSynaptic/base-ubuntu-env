#!/bin/bash

source ./common.sh

if ! which rga > /dev/null; then
    installing "Ripgrep ALL"

    curl -o /tmp/rga.tar.gz -sSL https://github.com/phiresky/ripgrep-all/releases/download/0.9.2/ripgrep_all-0.9.2-x86_64-unknown-linux-musl.tar.gz

    (
        cd /tmp
        tar -xf rga.tar.gz
        mv ripgrep_all-0.9.2-x86_64-unknown-linux-musl rga
    )

    install /tmp/rga/rga /usr/local/bin/rga
    rm -rf /tmp/rga /tmp/rga.tar.gz
fi