@echo off
setlocal
set wsudo_commandLine=%*
set wsudo_curDir=%CD%
start /min powershell.exe -NonInteractive -ExecutionPolicy Bypass -NoProfile -NoLogo -File "%~dp0.\wsudoexec.ps1" -detach -permanent -title %~n0 -action prepare
exit /b %ERRORLEVEL%
