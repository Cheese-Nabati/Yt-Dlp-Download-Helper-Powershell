Write-Host "`nSelect Video Quality:" -ForegroundColor Yellow
Write-Host "[1] Best Quality"
Write-Host "[2] Medium (720p)"
Write-Host "[3] Low (480p)"
Write-Host "[3] Back"
$vQuality = Read-Host "Select The Quality"

if ($vQuality -eq "3") { . $PSScriptRoot"\ytdlp-interact-host.ps1" }

switch ($vQuality) {
    "1" { $params += @("-f", "bestvideo+bestaudio/best") }
    "2" { $params += @("-f", "bestvideo[height<=720]+bestaudio/best") }
    "3" { $params += @("-f", "bestvideo[height<=480]+bestaudio/best") }
    Default { $params += @("-f", "bestvideo+bestaudio/best") }
}

$params += @("--merge-output-format", "mp4")
$script:readyToDownload = $true
Write-Host "`n--- Downloading Video ---" -ForegroundColor Green