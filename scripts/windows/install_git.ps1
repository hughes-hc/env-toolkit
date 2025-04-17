# 检查管理员权限
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "请以管理员权限运行此脚本！"
    break
}

# 下载并安装 Git
Write-Host "正在下载 Git 安装程序..."
$gitInstaller = "$env:TEMP\git-installer.exe"
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.44.0.windows.1/Git-2.44.0-64-bit.exe" -OutFile $gitInstaller

Write-Host "正在安装 Git..."
Start-Process -FilePath $gitInstaller -ArgumentList "/VERYSILENT", "/NORESTART", "/NOCANCEL", "/SP-", "/CLOSEAPPLICATIONS", "/RESTARTAPPLICATIONS", "/COMPONENTS=""icons,ext\reg\shellhere,assoc,assoc_sh""" -Wait

# 验证安装
Write-Host "验证 Git 安装..."
git --version

Write-Host "Git 安装完成！" 