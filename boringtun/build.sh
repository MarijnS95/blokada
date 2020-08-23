#!/bin/sh
JNI_LIBS=../app/src/tun-blocka/jniLibs

export PATH=$PATH:$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin

rm -rf $JNI_LIBS
mkdir $JNI_LIBS
mkdir $JNI_LIBS/armeabi-v7a
mkdir $JNI_LIBS/arm64-v8a
mkdir $JNI_LIBS/x86
mkdir $JNI_LIBS/x86_64

echo "Building for armv7..."
export CC=armv7a-linux-androideabi21-clang
export CXX=armv7a-linux-androideabi21-clang++
export CARGO_TARGET_ARMV7_LINUX_ANDROIDEABI_LINKER=armv7a-linux-androideabi21-clang
export CARGO_TARGET_ARMV7_LINUX_ANDROIDEABI_AR=armv7a-linux-androideabi-ar
cargo build --lib --release --target armv7-linux-androideabi
cp target/armv7-linux-androideabi/release/libboringtun.so $JNI_LIBS/armeabi-v7a/libboringtun.so

echo "Building for aarch64..."
export CC=aarch64-linux-android21-clang
export CXX=aarch64-linux-android21-clang++
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER=aarch64-linux-android21-clang
export CARGO_TARGET_AARCH64_LINUX_ANDROID_AR=aarch64-linux-android-ar
cargo build --lib --release --target aarch64-linux-android
cp target/aarch64-linux-android/release/libboringtun.so $JNI_LIBS/arm64-v8a/libboringtun.so

echo "Building for i686..."
export CC=i686-linux-android21-clang
export CXX=i686-linux-android21-clang++
export CARGO_TARGET_I686_LINUX_ANDROID_LINKER=i686-linux-android21-clang
export CARGO_TARGET_I686_LINUX_ANDROID_AR=i686-linux-android-ar
cargo build --lib --release --target i686-linux-android
cp target/i686-linux-android/release/libboringtun.so $JNI_LIBS/x86/libboringtun.so

echo "Building for v86_64..."
export CC=x86_64-linux-android21-clang
export CXX=x86_64-linux-android21-clang++
export CARGO_TARGET_X86_64_LINUX_ANDROID_LINKER=x86_64-linux-android21-clang
export CARGO_TARGET_X86_64_LINUX_ANDROID_AR=x86_64-linux-android-ar
cargo build --lib --release --target x86_64-linux-android
cp target/x86_64-linux-android/release/libboringtun.so $JNI_LIBS/x86_64/libboringtun.so
