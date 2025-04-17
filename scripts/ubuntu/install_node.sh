#!/bin/bash

# 使用 su 执行需要 root 权限的命令

# 安装 Node.js
echo "📥 正在安装 Node.js..."
curl -fsSL https://deb.nodesource.com/setup_20.x | su -c 'bash -'
su -c 'apt-get install -y nodejs'

# 验证安装
echo "✅ 验证 Node.js 安装..."
node --version
npm --version

echo "🎉 Node.js 安装完成！" 