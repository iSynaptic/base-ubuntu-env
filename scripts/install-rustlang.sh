#!/bin/bash

source ./common.sh

if ! which pkg-config > /dev/null; then
    installing "pkg-config package"
    sudo apt-get install -y pkg-config
fi

if ! apt list --installed 2>/dev/null | grep clang > /dev/null; then
    curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
    sudo add-apt-repository "deb http://apt.llvm.org/impish/ llvm-toolchain-impish-13 main"
    sudo apt-get update

    installing "Clang 13.0"
    sudo apt-get install -y clang=1:13.0-53~exp1
fi

if ! which rustc > /dev/null; then
    installing "Rust Language"

    curl https://sh.rustup.rs -sSf | sh -s -- -y
fi

rustup=~/.cargo/bin/rustup
cargo=~/.cargo/bin/cargo

if ! $rustup toolchain list | grep -P "^nightly-x86_64" > /dev/null; then
    installing "Rust Nightly"

    $rustup toolchain install nightly
fi

if ! $rustup component list | grep "rust-src (installed)" > /dev/null; then
    installing "Rust Source component"

    $rustup component add rust-src
fi