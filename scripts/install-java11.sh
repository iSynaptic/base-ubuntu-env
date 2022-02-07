#!/bin/bash

source ./common.sh

if ! which /usr/lib/jvm/temurinopenjdk-11-hotspot-amd64/bin/java > /dev/null; then
    installing "Java 11 (Temurin OpenJDK)"

    curl -sSL0 https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.14%2B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.14_9.tar.gz -o /tmp/jdk11.tar.gz

    mkdir -p /usr/lib/jvm/temurinopenjdk-11-hotspot-amd64
    (
        cd /usr/lib/jvm/temurinopenjdk-11-hotspot-amd64
        tar -xf /tmp/jdk11.tar.gz --strip-components=1
    )

    rm /tmp/jdk11.tar.gz

    update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/temurinopenjdk-11-hotspot-amd64/bin/java" 1 >/dev/null 2>&1
fi