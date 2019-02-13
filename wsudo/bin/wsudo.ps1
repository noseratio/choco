#Requires -Version 3.0

param(
  [Parameter(Mandatory = $true)] [ValidateSet('prepare','run')] [string] $action,
  [string] $title,
  [string] $command,
  [switch] $stayOpen)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

class CommandInfo {
  [string]$curDir
  [string]$comSpec
  [string]$commandLine
  [string]$title
  [bool]$stayOpen
}

switch($action) {
  'prepare' {
    # pack curDir, commandLine etc using JSON/base64 and re-launch itself as admin
    $commandInfo = [CommandInfo]::new()
    $commandInfo.comSpec = $env:ComSpec
    $commandInfo.commandLine = $env:wsudo_commandLine
    $commandInfo.curDir = $env:wsudo_curDir
    $commandInfo.title = $title
    $commandInfo.stayOpen = $stayOpen
    $commandInfoJson = ConvertTo-Json -Compress $commandInfo
    $commandInfoEncoded = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($commandInfoJson))
    # get the powershell EXE name
    $powershell = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
    $pi = Start-Process -PassThru -Verb runAs `
      -FilePath $powershell -ArgumentList "-f $PSCommandPath -action run -commandInfo $commandInfoEncoded"
    $pi.WaitForExit()
    exit $pi.ExitCode
    break
  }
  'run' {
    # unpack curDir, commandLine etc and run the command under CMD
    if (!$command) { 
      throw 'Must provide commandInfo.'
    }
    
    $commandInfoJson = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($command));
    $commandInfo = [CommandInfo](ConvertFrom-Json $commandInfoJson)

    if ($commandInfo.title) { 
      $host.ui.RawUI.WindowTitle = $commandInfo.title
    }

    Set-Location $commandInfo.curDir
    $opt = if ($commandInfo.stayOpen) { '/K' } else { '/C' }
    $pi = Start-Process -PassThru -NoNewWindow `
      -FilePath $commandInfo.comSpec -ArgumentList "$opt $($commandInfo.commandLine)"
    $pi.WaitForExit()
    exit $pi.ExitCode
    break
  }
  default {
    throw 'Invalid action.'
  }
}
