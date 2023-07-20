irm get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -ScoopDir 'D:\Applications\Scoop' -ScoopCacheDir 'D:\Applications\ScoopCache'
scoop install aria2 git lessmsi
scoop config use_lessmsi $true
scoop bucket add extras
scoop bucket add nonportable
scoop install 7zip adb equalizer-apo-np ffmpeg github libreoffice mpv.net msiafterburner nextcloud obs-studio picotorrent rustdesk scrcpy spotify vscode
pause