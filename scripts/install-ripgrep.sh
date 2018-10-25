#!/bin/bash

source ./common.sh

if ! which rg > /dev/null; then
    installing "Ripgrep"
    curl -o /tmp/ripgrep.deb -sSL https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb

    dpkg -i /tmp/ripgrep.deb
    rm /tmp/ripgrep.deb
fi