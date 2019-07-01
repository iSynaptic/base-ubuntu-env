#!/bin/bash

source ./common.sh

if ! which javac > /dev/null; then
    installing "Java 8 (Zulu)"

    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
    sudo apt-add-repository 'deb http://repos.azulsystems.com/ubuntu stable main'

    sudo apt install -y zulu-8
fi

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