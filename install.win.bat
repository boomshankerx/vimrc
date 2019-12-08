ECHO COPY VIMRC
xcopy _vimrc "%USERPROFILE%" /y /f
pause

ECHO COPY VIMFILES
rd "%USERPROFILE%\vimfiles\" /s /q
md "%USERPROFILE%\vimfiles\"
xcopy .vim\* "%USERPROFILE%\vimfiles\" /s /y /f
pause

ECHO INSTALL PLUGINS
curl -fLo %USERPROFILE%/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"C:\Program Files (x86)\Vim\vim81\gvim.exe" +PlugInstall +qall
