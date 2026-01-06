
if (-not $args) {
    Write-Host ''
    Write-Host 'YT-DLP Download Helper (ps1/PowerShell) ' -NoNewline
    Write-Host 'Beta Version - May Have Change/Add Features' -ForegroundColor Yellow
    Write-Host ''
}


# --- 1. SEARCH SYSTEM PATH FOR TOOLS ---
Write-Host "Searching PATH for yt-dlp and ffmpeg..." -ForegroundColor Cyan

# Locate yt-dlp in PATH
$ytDlpPath = Get-Command "yt-dlp" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

# Locate ffmpeg in PATH
$ffmpegPath = Get-Command "ffmpeg" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

# --- 2. VALIDATION ---
if (-not $ytDlpPath) {
    Write-Host "ERROR: 'yt-dlp' not found in your System PATH." -ForegroundColor Red
    Write-Host "Please add yt-dlp path to your Environment Variables." -ForegroundColor Yellow
    pause; exit
}

if (-not $ffmpegPath) {
    Write-Host "WARNING: 'ffmpeg' not found in your System PATH." -ForegroundColor Red
    Write-Host "Audio conversion and video merging will fail/not function correctly." -ForegroundColor Yellow
}

# --- 3. USER INTERACTION ---
$rawurl = Read-Host "`nEnter The URL"
if ($rawUrl -notmatch "^http") {
    $global:url = "https://$rawUrl"
} else {
    $global:url = $rawUrl
}
$saveDir = Read-Host "Enter Path to Store Your Download"


# Ensure directory exists
if (-not (Test-Path $saveDir)) { 
    New-Item -ItemType Directory -Path $saveDir -Force | Out-Null 
}

Write-Host "Select Format:" -ForegroundColor Cyan
Write-Host "[1] MP4 (Video)" -ForegroundColor Cyan
Write-Host "[2] MP3 (Audio)" -ForegroundColor Cyan
$choice = Read-Host "Choice"

# Initialize params with basic info before branching
$params = @($url, "-P", $saveDir, "--no-mtime")

if ($ffmpegPath) {
    $ffmpegDir = Split-Path $ffmpegPath -Parent
    $params += "--ffmpeg-location", $ffmpegDir
}

# Execute based on selection
if ($choice -eq "1") {
    # . connects the VideoMenu.ps1 to this script's memory
    . "$PSScriptRoot\VideoSelections.ps1"

} elseif ($choice -eq "2") {
    # . connects the AudioMenu.ps1 to this script's memory
    . "$PSScriptRoot\AudioSelections.ps1"
}