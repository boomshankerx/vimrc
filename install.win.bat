ECHO COPY VIMRC
xcopy _vimrc "%USERPROFILE%" /y /f
pause

ECHO COPY VIMFILES
rd "%USERPROFILE%\vimfiles\" /s /q
md "%USERPROFILE%\vimfiles\"
xcopy .vim\* "%USERPROFILE%\vimfiles\" /s /y /f
pause

ECHO INSTALL PLUGINS
"C:\Program Files\Vim\vim81\gvim.exe" +PlugInstall +qall

ECHO BUILD YOUCOMPLETEME
pause
REM "%USERPROFILE%\vimfiles\bundle\YouCompleteMe\install.py"
pause
