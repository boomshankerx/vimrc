$DEST = "$env:USERPROFILE\vimfiles\"

# COPY CONFIG
Write-Host "CONVERT AND COPY CONFIG"
(Get-Content ".vimrc") | ForEach-Object {
    $_ `
       -replace '.vimrc', '_vimrc' `
       -replace 'set guifont=.*$', 'set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI' `
       -replace 'unnamedplus', 'unnamed' `
       -replace '~/.vim/','~/vimfiles/' `
} | Set-Content "$env:USERPROFILE\_vimrc"

# COPY CONFIG FOLDER
Write-Host "COPY CONFIG FOLDER"
Remove-Item -Recurse -Force $DEST
mkdir $DEST
Copy-Item -Recurse ".vim\*" -Destination $DEST

# INSTALL VIM-PLUG AND RUN
Write-Host "INSTALL PLUGINS"
& curl.exe -fLo $env:USERPROFILE\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
& "C:\Program Files\Vim\vim90\gvim.exe" +PlugInstall +qall
