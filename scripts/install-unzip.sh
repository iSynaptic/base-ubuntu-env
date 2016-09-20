#!/bin/bash

source ./common.sh

if ! which unzip >> /dev/null; then
    installing "Unzip"
    
    apt-get install -y unzip
fi