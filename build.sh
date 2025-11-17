#!/usr/bin/bash
LLVM_BIN="$ANDROID_HOME/ndk/28.1.13356709/toolchains/llvm/prebuilt/linux-x86_64/bin"
export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_MUSL_LINKER="$LLVM_BIN/aarch64-linux-android21-clang"

RUSTFLAGS="-C link-arg=-no-pie" cargo build --target=aarch64-unknown-linux-musl --release
