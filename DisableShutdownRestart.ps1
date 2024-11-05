# 檢查是否以管理員身份執行
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "請以管理員身份執行此腳本。"
    exit
}

# 設定要修改的註冊表路徑和值
$registryPath = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$valueName = "NoClose"
$newValue = 1

# 檢查註冊表鍵值是否存在，不存在則創建
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -ItemType Directory
}

# 設定註冊表值
Set-ItemProperty -Path $registryPath -Name $valueName -Value $newValue

Write-Host "關機和重新啟動按鈕已禁用。"