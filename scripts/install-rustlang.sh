#!/bin/bash

source ./common.sh

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

if ! $rustup component list | grep -P 'rust-analysis.+\(installed\)' > /dev/null; then
    installing "Rust Analysis component"

    $rustup component add rust-analysis
fi

if ! $rustup component list | grep -P 'rls.+\(installed\)' > /dev/null; then
    installing "Rust Language Service component"

    $rustup component add rls
fi

if ! which racer > /dev/null; then
    installing "Rust Racer"

    $cargo +nightly install racer
fi

if ! which pkg-config > /dev/null; then
    installing "pkg-config package"
    sudo apt-get install -y pkg-config
fi

if ! apt list --installed 2>/dev/null | grep clang-6.0 > /dev/null; then
    installing "Clang 6.0"
    sudo apt-get install -y clang-6.0
fi