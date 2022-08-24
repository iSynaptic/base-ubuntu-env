#!/bin/bash

source ./common.sh

if [ ! -d /etc/jvm-async-profiler ]; then
    installing "JVM Async Profiler"

    curl -o /tmp/ap.tar.gz -sSL https://github.com/jvm-profiling-tools/async-profiler/releases/download/v1.5/async-profiler-1.5-linux-x64.tar.gz
    mkdir -p /tmp/ap
    (
        cd /tmp/ap
        tar -vxzf /tmp/ap.tar.gz
    )

    mv /tmp/ap /etc/jvm-async-profiler
    rm /tmp/ap.tar.gz
fi