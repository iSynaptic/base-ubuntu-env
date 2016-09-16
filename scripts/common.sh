#!/bin/bash

if [ "$COMMON_SCRIPT_LOADED" = "1" ]; then
    return
fi

function installing() {
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color

    MSG=$1
    printf "${GREEN}Installing ${MSG}...${NC}\n"
}

COMMON_SCRIPT_LOADED=1