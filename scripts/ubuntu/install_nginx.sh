#!/bin/bash

# 使用 su 执行需要 root 权限的命令

# 安装 Nginx
echo "📥 正在安装 Nginx..."
su -c 'apt-get update'
su -c 'apt-get install -y nginx'

# 启动 Nginx
echo "🚀 正在启动 Nginx..."
su -c 'systemctl start nginx'
su -c 'systemctl enable nginx'

# 验证安装
echo "✅ 验证 Nginx 安装..."
nginx -v
systemctl status nginx

echo "🎉 Nginx 安装完成！"
echo "🌐 Nginx 已启动，可以通过 http://localhost 访问" 