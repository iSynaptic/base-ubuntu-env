#!/bin/bash

source ./common.sh

if ! which /usr/lib/jvm/temurinopenjdk-17-hotspot-amd64/bin/java > /dev/null; then
    installing "Java 17 (Temurin OpenJDK)"

    curl -sSL0 https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.2%2B8/OpenJDK17U-jdk_x64_linux_hotspot_17.0.2_8.tar.gz -o /tmp/jdk17.tar.gz

    mkdir -p /usr/lib/jvm/temurinopenjdk-17-hotspot-amd64
    (
        cd /usr/lib/jvm/temurinopenjdk-17-hotspot-amd64
        tar -xf /tmp/jdk17.tar.gz --strip-components=1
    )

    rm /tmp/jdk17.tar.gz

    update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/temurinopenjdk-17-hotspot-amd64/bin/java" 0 >/dev/null 2>&1
fi