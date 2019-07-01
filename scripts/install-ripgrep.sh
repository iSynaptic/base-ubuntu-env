#!/bin/bash

source ./common.sh

if ! which rg > /dev/null; then
    installing "Ripgrep"
    curl -o /tmp/ripgrep.deb -sSL https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb

    dpkg -i /tmp/ripgrep.deb
    rm /tmp/ripgrep.deb
fi