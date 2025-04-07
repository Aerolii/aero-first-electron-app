Write-Host "`n🔍 检查并删除非法 npm 配置项 'home' ..." -ForegroundColor Cyan

# 删除用户级配置中的 home
npm config delete home | Out-Null
Write-Host "✅ 已删除用户级 home 配置（如果存在）"

# 删除全局配置中的 home
npm config --global delete home | Out-Null
Write-Host "✅ 已删除全局 home 配置（如果存在）"

# 检查并删除环境变量中的 npm_config_home
$envVar = [System.Environment]::GetEnvironmentVariable("npm_config_home", "User")
if ($envVar) {
    [System.Environment]::SetEnvironmentVariable("npm_config_home", $null, "User")
    Write-Host "✅ 已从当前用户环境变量中删除 npm_config_home"
} else {
    Write-Host "ℹ️ 当前用户环境变量中未设置 npm_config_home"
}

$envVarGlobal = [System.Environment]::GetEnvironmentVariable("npm_config_home", "Machine")
if ($envVarGlobal) {
    [System.Environment]::SetEnvironmentVariable("npm_config_home", $null, "Machine")
    Write-Host "✅ 已从系统环境变量中删除 npm_config_home"
} else {
    Write-Host "ℹ️ 系统环境变量中未设置 npm_config_home"
}

Write-Host "`n🎉 清理完成，可以重新运行 npm 检查配置" -ForegroundColor Green
