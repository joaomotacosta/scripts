# Display a progress message
function Show-Progress {
    param([string]$Message)
    Write-Host "`n========== $Message ==========`n"
}

# Open Developer Options for the user to enable Developer Mode
function Open-Developer-Options {
    Show-Progress "Opening Developer Options..."
    Start-Process "ms-settings:developers"
    Read-Host "Press Enter to continue"
}

# Open Developer Options and pause the script for user interaction
Open-Developer-Options

# Install Scoop
Show-Progress "Installing Scoop..."
Invoke-RestMethod -Uri "https://get.scoop.sh" -OutFile "install.ps1"
.\install.ps1 -ScoopDir 'D:\Applications\Scoop' -ScoopGlobalDir 'D:\Applications\ScoopGlobal' -ScoopCacheDir 'D:\Applications\ScoopCache'

# Install dependencies for Scoop
Show-Progress "Installing dependencies..."
scoop install aria2 dark git innounp lessmsi sudo
scoop config use_lessmsi $true
scoop config aria2-warning-enabled false

# Add Scoop buckets
Show-Progress "Adding Scoop buckets..."
scoop bucket add extras
scoop bucket add nonportable
scoop bucket add versions

# Install apps
Show-Progress "Installing applications..."
scoop install brave vscode adb picotorrent
scoop install foobar2000 foobar2000-encoders --arch 32
scoop install mpv.net imageglass spotify stremio
sudo scoop install equalizer-apo-np

# Finish
Write-Host "`nAll selected applications have been installed successfully.`n"
pause