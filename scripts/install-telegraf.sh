#!/bin/bash

source ./common.sh

if ! which telegraf > /dev/null; then
    installing "Telegraf 1.3.5"
    curl -sL https://dl.influxdata.com/telegraf/releases/telegraf-1.3.5-static_linux_amd64.tar.gz -o /tmp/telegraf.tar.gz
    (cd /tmp && tar -vxzf /tmp/telegraf.tar.gz > /dev/null)
    install /tmp/telegraf/telegraf /usr/local/bin/telegraf
    rm -rf /tmp/telegraf /tmp/telegraf.tar.gz
fi

