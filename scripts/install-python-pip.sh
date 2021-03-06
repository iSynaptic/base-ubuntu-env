#!/bin/bash

source ./common.sh

if ! which pip3 > /dev/null; then
    installing "Python-PIP"

    apt-get install -y python3-pip python3-dev python3-venv build-essential

    cd /usr/local/bin
    sudo ln -s $(which python3) python
    sudo ln -s $(which pip3) pip
fi