#!/bin/sh
cp bin/targets/x86/btrfs/openwrt-x86-btrfs-generic-kernel.bin build_dir/target-x86_64_musl/root-x86/vmlinuz
tar -cp --numeric-owner --owner=0 --group=0 --mode=a-s --sort=name -C build_dir/target-x86_64_musl/root-x86/ . | gzip -9n > bin/targets/x86/btrfs/openwrt-x86-btrfs-generic-rootfs-kernel.tar.gz