#!/bin/bash

source ./common.sh

if [ ! -f /etc/init.d/ntp ]; then
    installing "NTP"

    apt-get install -y ntp
    /etc/init.d/ntp start
fi