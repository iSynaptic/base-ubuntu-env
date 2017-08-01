#!/bin/bash

source ./common.sh

if [ ! -f /opt/gradle/gradle-4.0/bin/gradle ]; then
    installing "Gradle"

    curl -o /tmp/gradle.zip -sSL https://services.gradle.org/distributions/gradle-4.0-bin.zip
    mkdir -p /opt/gradle

    unzip -d /opt/gradle /tmp/gradle.zip
    rm /tmp/gradle.zip
fi

if ! which gradle > /dev/null; then
    doing "Linking" "Gradle into 'gradle'"
    ln -s /opt/gradle/gradle-4.0/bin/gradle /usr/local/bin/gradle
fi
