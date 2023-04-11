#!/bin/sh
cp bin/targets/x86/64/openwrt-x86-64-generic-kernel.bin build_dir/target-x86_64_musl/root-x86/vmlinuz
tar -cp --numeric-owner --owner=0 --group=0 --mode=a-s --sort=name -C build_dir/target-x86_64_musl/root-x86/ . | gzip -9n > bin/targets/x86/64/openwrt-x86-64-generic-rootfs-kernel.tar.gz