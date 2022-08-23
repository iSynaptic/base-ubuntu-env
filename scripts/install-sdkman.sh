#!/bin/bash

source ./common.sh

export SDKMAN_DIR="$HOME/.sdkman"

if [ ! -f "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
    installing "SDKMAN!"
    
    if [ -d "$SDKMAN_DIR" ]; then
        rm -rf "$SDKMAN_DIR"
    fi

    curl -sSL0 "https://get.sdkman.io?rcupdate=false" | bash >/dev/null 2>&1
fi