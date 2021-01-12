$DEST = "$env:USERPROFILE\vimfiles\"

# COPY CONFIG
Write-Host "CONVERT AND COPY CONFIG"
(Get-Content ".vimrc") | ForEach-Object {
    $_ `
       -replace '~/.vim','~/vimfiles' `
       -replace '.vimrc', '_vimrc' `
       -replace 'unnamedplus', 'unnamed' `
       -replace 'set guifont=.*$', 'set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI' `
} | Set-Content _vimrc
Copy-Item _vimrc $env:USERPROFILE 

# COPY CONFIG FOLDER
Write-Host "COPY CONFIG FOLDER"
Remove-Item -Recurse -Force $DEST
mkdir $DEST
Copy-Item -Recurse ".vim\*" -Destination $DEST

# INSTALL VIM-PLUG AND RUN
Write-Host "INSTALL PLUGINS"
& curl.exe -fLo $env:USERPROFILE\vimfiles\autoload\plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
& "C:\Program Files (x86)\Vim\vim82\gvim.exe" +PlugInstall +qall