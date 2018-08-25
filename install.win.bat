ECHO COPY VIMRC
xcopy _vimrc "%USERPROFILE%" /y /f
pause

ECHO COPY VIMFILES
rd "%USERPROFILE%\vimfiles\" /s /q
md "%USERPROFILE%\vimfiles\"
xcopy .vim\* "%USERPROFILE%\vimfiles\" /s /y /f
pause

ECHO INSTALL PLUGINS
git clone https://github.com/gmarik/vundle.git %USERPROFILE%/vimfiles/bundle/vundle
"C:\Program Files (x86)\Vim\vim80\gvim.exe" +PluginInstall +qall

ECHO BUILD YOUCOMPLETEME
pause
"%USERPROFILE\vimfiles\bundles\YouCompleteMe\install.py"
pause
