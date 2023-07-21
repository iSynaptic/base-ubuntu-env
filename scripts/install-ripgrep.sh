#!/bin/bash

source ./common.sh

if ! which rg > /dev/null; then
    installing "Ripgrep"
    curl -o /tmp/rg -sSL https://github.com/iSynaptic/base-ubuntu-env/releases/download/ripgrep-linux-x64-with-pcre2/rg

    install /tmp/rg /usr/bin/rg
    rm /tmp/rg
fi