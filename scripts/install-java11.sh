#!/bin/bash

source ./common.sh
source "$HOME/.sdkman/bin/sdkman-init.sh"

JAVA_VERSION="11.0.17"


if [ ! -d $HOME/.sdkman/candidates/java/$JAVA_VERSION-tem ]; then
    installing "Java $JAVA_VERSION (Temurin OpenJDK)"

    sdk install java $JAVA_VERSION-tem
fi