#Requires -Version 5.0

param(
  [Parameter(Mandatory = $true)] [ValidateSet('prepare','run')] [string] $action,
  [string] $processInfo,
  [switch] $stay)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

class Process {
  [string]$curDir
  [string]$comSpec
  [string]$commandLine
  [bool]$stay
}

switch($action) {
  'prepare' {
    # pack curDir, commandLine etc using JSON/base64 and re-launch itself as admin
    $process = [Process]::new()
    $process.comSpec = $env:ComSpec
    $process.commandLine = $env:wsudo_commandLine
    $process.curDir = $env:wsudo_curDir
    $process.stay = $stay
    $json = ConvertTo-Json -Compress $process
    $encoded = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($json))
    # get the powershell EXE name
    $powershell = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
    $pi = Start-Process -PassThru -Verb runAs `
      -FilePath $powershell -ArgumentList "-f $PSCommandPath -action run -processInfo $encoded"
    $pi.WaitForExit()
    exit $pi.ExitCode
    break
  }
  'run' {
    # unpack curDir, commandLine etc and run the command under CMD
    if (!$processInfo) { 
      throw 'Must provide process info.'
    }
    $decoded = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($processInfo));
    $process = [Process](ConvertFrom-Json $decoded)
    Set-Location $process.curDir
    $opt = if ($process.stay) { '/K' } else { '/C' }
    $pi = Start-Process -PassThru -NoNewWindow `
      -FilePath $process.comSpec -ArgumentList "$opt $($process.commandLine)"
    $pi.WaitForExit()
    exit $pi.ExitCode
    break
  }
  default {
    throw 'Invalid action.'
  }
}
