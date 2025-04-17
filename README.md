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

**安装 Docker**
```powershell
curl -o- https://raw.githubusercontent.com/hughes-hc/env-toolkit/main/scripts/windows/install_docker.ps1 | powershell -Command -
```

**安装其他软件**
```powershell
curl -o- https://raw.githubusercontent.com/hughes-hc/env-toolkit/main/scripts/windows/install_software_name.ps1 | powershell -Command -
```

#### Ubuntu/CentOs

**安装 Docker**
```bash
curl -s https://raw.githubusercontent.com/hughes-hc/env-toolkit/main/scripts/ubuntu/install_docker.sh | bash
```

**安装其他软件**
> 替换install_software_name为目标脚本文件名，CentOs注意还需替换文件夹名称。
```bash
curl -s https://raw.githubusercontent.com/hughes-hc/env-toolkit/main/scripts/ubuntu/install_software_name.sh | bash
```

### 本地执行

#### Windows

**执行 Docker 安装脚本**
```powershell
.\install_docker.ps1
```

**执行其他脚本**
```powershell
.\install_software_name.ps1
```

#### Ubuntu

**执行 Docker 安装脚本**
```bash
bash install_docker.sh
```

**执行其他脚本**
```bash
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
