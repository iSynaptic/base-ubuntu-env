#!/bin/bash

source ./common.sh

if ! which javac > /dev/null; then
    installing "Java"

    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

    add-apt-repository ppa:webupd8team/java
    apt-get update
    apt-get install -y oracle-java8-installer
fi

if [ ! -d /etc/jvm-async-profiler ]; then
    installing "JVM Async Profiler"

    curl -o /tmp/ap.tar.gz -sSL https://github.com/jvm-profiling-tools/async-profiler/releases/download/v1.4/async-profiler-1.4-linux-x64.tar.gz
    mkdir -p /tmp/ap
    (
        cd /tmp/ap
        tar -vxzf /tmp/ap.tar.gz
    )

    mv /tmp/ap /etc/jvm-async-profiler
    rm /tmp/ap.tar.gz
fi