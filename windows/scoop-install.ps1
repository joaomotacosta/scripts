irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -ScoopDir 'D:\Applications\Scoop' -ScoopCacheDir 'D:\Applications\ScoopCache'
scoop install aria2 git lessmsi
scoop config aria2-warning-enabled false
scoop config use_lessmsi $true
scoop bucket add extras
scoop bucket add nonportable
scoop bucket add games
scoop install 7zip adb ffmpeg github libreoffice mpv.net msiafterburner obs-studio picotorrent rustdesk scrcpy spotify sudo vscode stremio signal rtss
sudo scoop install equalizer-apo-np
pause