#!/bin/bash

source ./common.sh

if ! which pip > /dev/null; then
    installing "Python-PIP"

    apt-get install -y python-pip python-dev build-essential
fi