xcopy _vimrc "%USERPROFILE%" /y /f
xcopy _gvimrc "%USERPROFILE%" /y /f
pause
rd "%USERPROFILE%\vimfiles\" /s /q
md "%USERPROFILE%\vimfiles\"
xcopy .vim\* "%USERPROFILE%\vimfiles\" /s /y /f

del "%USERPROFILE%\vimfiles\bundle\HTML.zip\plugin\browser_launcher.vim"
rem del "%USERPROFILE%\vimfiles\"

pause
