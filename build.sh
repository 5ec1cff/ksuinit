#!/usr/bin/bash
if [ "$1" == "x64" ]; then
    LLVM_BIN="$ANDROID_HOME/ndk/28.1.13356709/toolchains/llvm/prebuilt/linux-x86_64/bin"
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER="$LLVM_BIN/x86_64-linux-android26-clang"
    TARGET=x86_64-unknown-linux-musl
else
    LLVM_BIN="$ANDROID_HOME/ndk/28.1.13356709/toolchains/llvm/prebuilt/linux-x86_64/bin"
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_MUSL_LINKER="$LLVM_BIN/aarch64-linux-android21-clang"
    export RUSTFLAGS="-C link-arg=-no-pie"
    TARGET=aarch64-unknown-linux-musl
fi

cargo build --target=$TARGET --release
