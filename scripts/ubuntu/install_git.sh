#!/bin/bash

# 使用 su 执行需要 root 权限的命令

# 安装 Git
echo "📥 正在安装 Git..."
su -c 'apt-get update'
su -c 'apt-get install -y git'

# 验证安装
echo "✅ 验证 Git 安装..."
git --version

echo "🎉 Git 安装完成！" 