Write-Host "`nSelect Audio Quality:" -ForegroundColor Yellow
Write-Host "[1] High (320kbps)"
Write-Host "[2] Standart (192kbps)"
Write-Host "[3] Low (128kbps)"
Write-Host "[3] Back"
$vQuality = Read-Host "Select The Quality"

if ($vQuality -eq "3") { . $PSScriptRoot"\ytdlp-interact-host.ps1" }

switch ($vQuality) {
    "1" { $params += @("-x", "--audio-format", "mp3", "--audio-quality", "320k") }
    "1" { $params += @("-x", "--audio-format", "mp3", "--audio-quality", "192k") }
    "1" { $params += @("-x", "--audio-format", "mp3", "--audio-quality", "128k") }
    Default { $params += @("-f", "bestaudio/best") }
}

$params += @("--embed-metadata", "--embed-thumbnail")
$params += @("--ppa", "ExtractAudio: -metadata title='%(title)s' -metadata artist='%(uploader)s'")

Write-Host "`n--- Starting Audio Download ---" -ForegroundColor Green
& $ytDlpPath $params
$script:readyToDownload = $true