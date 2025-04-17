# 检查管理员权限
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "请以管理员权限运行此脚本！"
    break
}

# 下载并安装 Node.js
Write-Host "正在下载 Node.js 安装程序..."
$nodeInstaller = "$env:TEMP\node-installer.msi"
Invoke-WebRequest -Uri "https://nodejs.org/dist/v20.11.1/node-v20.11.1-x64.msi" -OutFile $nodeInstaller

Write-Host "正在安装 Node.js..."
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", $nodeInstaller, "/qn" -Wait

# 验证安装
Write-Host "验证 Node.js 安装..."
node --version
npm --version

Write-Host "Node.js 安装完成！" 