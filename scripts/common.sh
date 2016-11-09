#!/bin/bash

if [ "$COMMON_SCRIPT_LOADED" = "1" ]; then
    return
fi

function installing() {
    doing "Installing" "$1"
}

function configuring() {
    doing "Configuring" "$1"
}

function doing() {
GREEN='\033[0;32m'
    NC='\033[0m' # No Color

    DOING=$1
    MSG=$2
    printf "${GREEN}$DOING ${MSG}...${NC}\n"
}

COMMON_SCRIPT_LOADED=1