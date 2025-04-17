#!/bin/bash

set -e

echo "🔧 更新系统..."
sudo yum update -y

echo "📦 安装依赖..."
sudo yum install -y yum-utils

echo "📝 添加 Docker 仓库..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "📥 安装 Docker..."
sudo yum install -y docker-ce docker-ce-cli containerd.io

echo "✅ 启动 Docker..."
sudo systemctl start docker

echo "🚀 运行 hello-world 测试..."
sudo docker run hello-world

echo "👤 添加当前用户到 docker 组（无需 sudo）..."
sudo usermod -aG docker $USER

echo ""
echo "🚨 请重新登录或执行 'newgrp docker' 以使 docker 组权限生效"
echo "🎉 安装成功！现在你可以愉快地使用 Docker 啦~"