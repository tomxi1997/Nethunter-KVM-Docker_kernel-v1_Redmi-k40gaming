#!/bin/bash
export ARCH=arm64
export SUBARCH=arm64
export PATH="/root/proton-clang/bin:$PATH"
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
make ${args} savedefconfig
make ${args} 2>&1 | tee kernel.log
make ${args} INSTALL_MOD_PATH="." INSTALL_MOD_STRIP=1 modules_install

