#!/bin/bash

source ./common.sh

if ! which nano > /dev/null; then
    apt-get install -y nano
fi