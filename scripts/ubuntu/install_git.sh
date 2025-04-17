#!/bin/bash

# 检查 root 权限
if [ "$EUID" -ne 0 ]; then
    echo "请使用 root 权限运行此脚本！"
    exit 1
fi

# 安装 Git
echo "正在安装 Git..."
apt-get update
apt-get install -y git

# 验证安装
echo "验证 Git 安装..."
git --version

echo "Git 安装完成！" 