#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2026 zhoufla

#指定文件路径
FILE="/usr/share/rpcd/ucode/luci"

#让 luci 的 getCPUUsage RPC 调用 /sbin/cpuusage（展示 USR/SYS/PPE 负载）
[ -f "$FILE" ] && sed -i "s#const fd = popen('top.*')#const fd = popen('/sbin/cpuusage')#g" "$FILE"

#rpcd 启动时已把 ucode 载入内存，仅改文件不会重新加载；重启 rpcd 让新实现立即生效
[ -f "$FILE" ] && /etc/init.d/rpcd restart >/dev/null 2>&1

exit 0
