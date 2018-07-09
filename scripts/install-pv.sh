#!/bin/bash

source ./common.sh

if ! which pv >> /dev/null; then
    installing "pv"
    apt-get install -y pv
fi