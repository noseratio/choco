@echo off
setlocal
set wsudo_commandLine=%*
set wsudo_curDir=%CD%
powershell.exe -ExecutionPolicy Bypass -NoProfile -NoLogo -File "%~dp0.\wsudoexec.ps1" -detach -stayOpen -title %~n0 -action prepare
exit /b %ERRORLEVEL%
