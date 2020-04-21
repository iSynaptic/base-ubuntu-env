#!/bin/bash

source ./common.sh

if ! which jwt >> /dev/null; then
    installing "jwt CLI"
    mkdir -p /tmp/jwt-cli
    curl -o /tmp/jwt-cli/jwt.tgz -sSL https://github.com/mike-engel/jwt-cli/releases/download/3.0.1/jwt-cli-3.0.1-linux.tar.gz

    (
        cd /tmp/jwt-cli
        tar -xf jwt.tgz
    )

    install /tmp/jwt-cli/target/release/jwt /usr/local/bin/jwt

    rm -rf /tmp/jwt-cli
fi