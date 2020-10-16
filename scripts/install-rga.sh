#!/bin/bash

source ./common.sh

if ! which rga > /dev/null; then
    installing "Ripgrep ALL"

    curl -o /tmp/rga.tar.gz -sSL https://github.com/phiresky/ripgrep-all/releases/download/v0.9.6/ripgrep_all-v0.9.6-x86_64-unknown-linux-musl.tar.gz

    (
        cd /tmp
        tar -xf rga.tar.gz
        mv ripgrep_all-v0.9.6-x86_64-unknown-linux-musl/rga rga
    )

    install /tmp/rga /usr/local/bin/rga
    rm -rf /tmp/ripgrep_all-v0.9.6-x86_64-unknown-linux-musl /tmp/rga.tar.gz /tmp/rga
fi