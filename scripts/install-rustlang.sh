#!/bin/bash

source ./common.sh

if ! which rustc > /dev/null; then
    installing "Rust Language"

    curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

if ! rustup component list | grep "rust-src (installed)" > /dev/null; then
    installing "Rust Source component"

    rustup component add rust-src
fi

if ! which racer > /dev/null; then
    installing "Rust Racer"

    cargo install racer
fi

if ! rustup toolchain list | grep -P "^nightly-x86_64" > /dev/null; then
    installing "Rust Nightly"

    rustup toolchain install nightly
fi