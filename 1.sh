#!/bin/bash
make clean && rm -rf out
ccache -M 10G
export ARCH=arm64
export SUBARCH=arm64
export PATH="/root/proton-clang/bin:$PATH"
mkdir out
args="-j$(nproc --all) \
ARCH=arm64 \
SUBARCH=arm64 \
O=out \
CC=clang \
CROSS_COMPILE=aarch64-linux-gnu- \
CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
CLANG_TRIPLE=aarch64-linux-gnu- \
AR=llvm-ar \
NM=llvm-nm \
OBJCOPY=llvm-objcopy \
OBJDUMP=llvm-objdump \
STRIP=llvm-strip "
make ${args} mrproper
make ${args} nethunter-kvm-docker-ares_defconfig
make ${args} menuconfig
