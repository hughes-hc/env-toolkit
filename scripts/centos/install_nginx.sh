#!/bin/bash

# 检查 root 权限
if [ "$EUID" -ne 0 ]; then
    echo "请使用 root 权限运行此脚本！"
    exit 1
fi

# 安装 Nginx
echo "正在安装 Nginx..."
yum install -y epel-release
yum install -y nginx

# 启动 Nginx
echo "正在启动 Nginx..."
systemctl start nginx
systemctl enable nginx

# 验证安装
echo "验证 Nginx 安装..."
nginx -v
systemctl status nginx

echo "Nginx 安装完成！"
echo "Nginx 已启动，可以通过 http://localhost 访问" 