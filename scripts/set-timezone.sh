#!/bin/bash

source ./common.sh

TIMEZONE=$1

if [ ! -z "$TIMEZONE" ] && [ ! -f /etc/timezone ] || [ "$(cat /etc/timezone)" != "$1" ]; then
    configuring "Timezone"

    echo $1 | sudo tee /etc/timezone
    sudo dpkg-reconfigure --frontend noninteractive tzdata
fi