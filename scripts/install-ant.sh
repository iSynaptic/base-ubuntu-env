#!/bin/bash

source ./common.sh

if ! which ant > /dev/null; then
    installing "Ant"

    apt-get install -y ant
fi