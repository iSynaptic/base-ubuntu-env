#!/bin/bash

source ./common.sh
source "$HOME/.sdkman/bin/sdkman-init.sh"

JAVA_VERSION="17.0.5"

if [ ! -d $HOME/.sdkman/candidates/java/$JAVA_VERSION-tem ]; then
    installing "Java $JAVA_VERSION (Temurin OpenJDK)"

    sdk install java $JAVA_VERSION-tem
fi