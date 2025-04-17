#!/bin/bash

set -e

echo "🔧 更新系统..."
sudo apt update && sudo apt upgrade -y

echo "📦 安装依赖..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "🔐 添加 Docker GPG 密钥..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor --yes -o /etc/apt/keyrings/docker.gpg

echo "📝 添加 Docker 仓库..."
sudo mkdir -p /etc/apt/sources.list.d
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "📥 更新源并安装 Docker..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "✅ Docker 安装完成！"

echo "🚀 运行 hello-world 测试..."
sudo docker run hello-world

echo "👤 添加当前用户到 docker 组（无需 sudo）..."
sudo usermod -aG docker $USER

echo ""
echo "🚨 请重新登录或执行 'newgrp docker' 以使 docker 组权限生效"
echo "🎉 安装成功！现在你可以愉快地使用 Docker 啦~"
