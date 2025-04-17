#!/bin/bash

# 检查 root 权限
if [ "$EUID" -ne 0 ]; then
    echo "请使用 root 权限运行此脚本！"
    exit 1
fi

# 安装 Node.js
echo "正在安装 Node.js..."
curl -fsSL https://rpm.nodesource.com/setup_20.x | bash -
yum install -y nodejs

# 验证安装
echo "验证 Node.js 安装..."
node --version
npm --version

echo "Node.js 安装完成！" 