#!/bin/bash

source ./common.sh

if ! which rustc > /dev/null; then
    installing "Rust Language"

    curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

rustup=~/.cargo/bin/rustup
cargo=~/.cargo/bin/cargo

if ! $rustup component list | grep "rust-src (installed)" > /dev/null; then
    installing "Rust Source component"

    $rustup component add rust-src
fi

if ! which racer > /dev/null; then
    installing "Rust Racer"

    $cargo install racer
fi

if ! $rustup toolchain list | grep -P "^nightly-x86_64" > /dev/null; then
    installing "Rust Nightly"

    $rustup toolchain install nightly
fi

if ! which pkg-config > /dev/null; then
    installing "pkg-config package"
    sudo apt-get install -y pkg-config
fi

if ! apt list --installed 2>/dev/null | grep clang-3.8 > /dev/null; then
    installing "Clang 3.8"
    sudo apt-get install -y clang-3.8
fi