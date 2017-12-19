#!/bin/bash

if [ "$COMMON_SCRIPT_LOADED" = "1" ]; then
    return
fi

export ANSI_COLOR_RED='\033[0;31m'
export ANSI_COLOR_GREEN='\033[0;32m'
export ANSI_COLOR_YELLOW='\033[0;33m'
export ANSI_COLOR_NONE='\033[0m' # No Color

function installing() {
    doing "Installing" "$1"
}

function configuring() {
    doing "Configuring" "$1"
}

function doing() {
    DOING=$1
    MSG=$2

    println_with_color "$ANSI_COLOR_GREEN" "$DOING $MSG..."
}

function warn() {
    println_with_color "$ANSI_COLOR_YELLOW" "$1"
}

function alert() {
    println_with_color "$ANSI_COLOR_YELLOW" "$1"
}

function with_color() {
    COLOR=$1
    MSG=$2

    echo "$COLOR$MSG$ANSI_COLOR_NONE"
}

function print_with_color() {
    COLOR=$1
    MSG=$2

    printf "$(with_color "$COLOR" "$MSG")"
}

function println_with_color() {
    COLOR=$1
    MSG=$2

    printf "$(with_color "$COLOR" "$MSG")\n"
}

function version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }

COMMON_SCRIPT_LOADED=1