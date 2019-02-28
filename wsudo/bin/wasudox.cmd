@echo off
setlocal
set wsudo_commandLine=%*
set wsudo_curDir=%CD%
start /b powershell.exe -f "%~dp0.\wsudoexec.ps1" -detach -title %~n0 -action prepare
exit /b %ERRORLEVEL%
