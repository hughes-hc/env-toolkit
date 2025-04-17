# 安装 Docker Desktop 和 WSL 2 的一键安装脚本

# 启用 WSL 和虚拟机平台
Write-Host "启用 WSL 和虚拟机平台..."
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
Write-Host "WSL 和虚拟机平台已启用。"

# 安装 WSL 2 Linux 内核更新包
Write-Host "安装 WSL 2 Linux 内核更新包..."
$wsl2KernelUrl = "https://aka.ms/wsl2kernel"
$kernelInstallerPath = "$env:USERPROFILE\Downloads\wsl_update.msi"
Invoke-WebRequest -Uri $wsl2KernelUrl -OutFile $kernelInstallerPath
Start-Process msiexec.exe -ArgumentList "/i", $kernelInstallerPath, "/quiet", "/norestart" -NoNewWindow -Wait
Write-Host "WSL 2 内核更新包已安装。"

# 设置 WSL 2 为默认版本
Write-Host "设置 WSL 2 为默认版本..."
wsl --set-default-version 2
Write-Host "WSL 2 已设置为默认版本。"

# 下载 Docker Desktop 安装程序
Write-Host "下载 Docker Desktop 安装程序..."
$dockerDesktopUrl = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
$dockerInstallerPath = "$env:USERPROFILE\Downloads\DockerDesktopInstaller.exe"
Invoke-WebRequest -Uri $dockerDesktopUrl -OutFile $dockerInstallerPath
Write-Host "Docker Desktop 安装程序已下载。"

# 安装 Docker Desktop
Write-Host "安装 Docker Desktop..."
Start-Process $dockerInstallerPath -ArgumentList "/quiet", "/norestart" -NoNewWindow -Wait
Write-Host "Docker Desktop 已安装。"

# 启动 Docker Desktop
Write-Host "启动 Docker Desktop..."
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Write-Host "Docker Desktop 已启动。"

# 显示 Docker 版本信息和测试运行
Write-Host "验证 Docker 安装..."
docker --version
docker run hello-world

Write-Host "Docker 安装完成！"
