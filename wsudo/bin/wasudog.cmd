@echo off
setlocal
set wsudo_commandLine=%*
set wsudo_curDir=%CD%
start /min powershell.exe -ExecutionPolicy Bypass -NoProfile -NoLogo -File "%~dp0.\wsudoexec.ps1" -detach -useStart -title %~n0 -action prepare
exit /b %ERRORLEVEL%
