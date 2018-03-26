#!/bin/bash

source ./common.sh

if ! which rg > /dev/null; then
    installing "Ripgrep"
    curl -o /tmp/ripgrep.tar.gz -sSL https://github.com/BurntSushi/ripgrep/releases/download/0.7.1/ripgrep-0.7.1-x86_64-unknown-linux-musl.tar.gz

    (
        cd /tmp
        tar -xf ripgrep.tar.gz
    )

    install /tmp/ripgrep-0.7.1-x86_64-unknown-linux-musl/rg /usr/local/bin/rg

    rm -rf /tmp/ripgrep-0.7.1-x86_64-unknown-linux-musl
    rm /tmp/ripgrep.tar.gz
fi