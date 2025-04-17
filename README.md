# 环境工具包

这是一个自动化环境配置工具包，提供常用软件的安装脚本，如 Docker、Node.js、Nginx、Git 等。支持本地和远程执行。

## 功能特点

- **多平台支持**：Windows、CentOS、Ubuntu
- **自动化安装**：简化安装流程
- **易用性**：简单的脚本操作
- **丰富的软件支持**：持续更新

## 执行方案

### 远程执行（推荐）

#### Windows
```powershell
# 安装 Docker
curl -o- https://raw.githubusercontent.com/hughes-hc/env-toolkit/main/scripts/windows/install_docker.ps1 | powershell -Command -

# 安装其他软件
curl -o- https://raw.githubusercontent.com/hughes-hc/env-toolkit/main/scripts/windows/install_software_name.ps1 | powershell -Command -
```

#### CentOS/Ubuntu
```bash
# 安装 Docker
curl -s https://raw.githubusercontent.com/hughes-hc/env-toolkit/main/scripts/centos/install_docker.sh | bash

# 安装其他软件
curl -s https://raw.githubusercontent.com/hughes-hc/env-toolkit/main/scripts/centos/install_software_name.sh | bash
```

### 本地执行

#### Windows
```powershell
# 执行 Docker 安装脚本
.\install_docker.ps1

# 执行其他脚本
.\install_software_name.ps1
```

#### CentOS/Ubuntu
```bash
# 执行 Docker 安装脚本
bash install_docker.sh

# 执行其他脚本
bash install_software_name.sh
```

## 目录结构

```
.
├── scripts/
│   ├── windows/      # Windows 脚本
│   ├── centos/       # CentOS 脚本
│   └── ubuntu/       # Ubuntu 脚本
```

## 注意事项

- 确保有管理员/root 权限
- 备份重要数据
- 检查系统版本匹配
- 确保网络连接稳定
- 查看脚本内容了解安装步骤

## 贡献指南

欢迎通过 Issue 和 Pull Request 改进项目：
- 添加新软件脚本
- 改进现有脚本
- 添加平台支持
- 修复 bug
- 改进文档

## 许可证

MIT License
