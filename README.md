# YT-DLP PowerShell Download Helper

A lightweight, interactive PowerShell wrapper for `yt-dlp` that simplifies video and audio downloads with a user-friendly menu system.

## ✨ Features
- **Smart URL Detection:** Automatically detects YouTube links to provide advanced resolution options (720p to 4K).
- **Audio/Video Toggle:** Easily switch between MP3 conversion or high-quality MP4 video.
~~- **Dependency Check:** Automatically prompts to install `yt-dlp` and `ffmpeg` if they are missing.~~
- **SponsorBlock Integration:** (Planned) Option to skip sponsor segments automatically.
- **Playlist Support:** (Planned) Download entire collections with one link.

## 🛠️ Pre-requisites
1. **yt-dlp.exe**: The core engine for downloading.
2. **FFmpeg**: Required for merging video/audio streams
3. **DenoJS**

## 🚀 How to Run
1. **Download the Project:** Clone or download the ZIP from this repository.
2. **Open PowerShell as Administrator:** This is required if the script needs to install dependencies or if your Execution Policy is strict.
3. **Execute:**
   ```powershell
   ./ytdlp-interact-host.ps1

## 🏗️ Roadmap
  -  Move logic to BatchFiles
  - Implement Playlist download toggle
  - Integrate SponsorBlock (--sponsorblock-remove all)
  - irm (Invoke-RestMethod) Support

## 📝 Note
This is a casual project to fill my time. So, I'm Sorry if is a Bad Code found on my Code
