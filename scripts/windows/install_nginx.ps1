# 检查管理员权限
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "请以管理员权限运行此脚本！"
    break
}

# 设置安装目录
$nginxDir = "C:\nginx"

# 下载并解压 Nginx
Write-Host "正在下载 Nginx..."
$nginxZip = "$env:TEMP\nginx.zip"
Invoke-WebRequest -Uri "https://nginx.org/download/nginx-1.24.0.zip" -OutFile $nginxZip

Write-Host "正在解压 Nginx..."
Expand-Archive -Path $nginxZip -DestinationPath $nginxDir -Force

# 配置环境变量
$envPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
if (-not $envPath.Contains($nginxDir)) {
    [Environment]::SetEnvironmentVariable("Path", "$envPath;$nginxDir", "Machine")
}

# 启动 Nginx
Write-Host "正在启动 Nginx..."
Start-Process -FilePath "$nginxDir\nginx.exe"

Write-Host "Nginx 安装完成！"
Write-Host "Nginx 已启动，可以通过 http://localhost 访问" 