#!/bin/bash

source ./common.sh

if ! which yo >> /dev/null; then
    installing "Yeoman"

    sudo npm install -g yo
fi