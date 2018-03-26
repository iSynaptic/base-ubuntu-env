#!/bin/bash

source ./common.sh

if ! which zip >> /dev/null; then
    installing "Zip"
    
    apt-get install -y zip
fi

if ! which unzip >> /dev/null; then
    installing "Unzip"
    
    apt-get install -y unzip
fi