#!/bin/bash

source ./common.sh

if ! which jless > /dev/null; then
    installing "jless 0.7.1"
    
    mkdir -p /tmp/jless
    curl -sL https://github.com/PaulJuliusMartinez/jless/releases/download/v0.7.1/jless-v0.7.1-x86_64-unknown-linux-gnu.zip -o /tmp/jless/jless.zip

    (
        cd /tmp/jless
        unzip jless.zip
    )
    install /tmp/jless/jless /usr/local/bin/jless
    rm -rf /tmp/jless
fi