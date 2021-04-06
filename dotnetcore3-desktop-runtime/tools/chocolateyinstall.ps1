$packageArgs = @{
  packageName    = 'dotnetcore3-desktop-runtime'
  fileType       = 'exe'

  url            = 'https://download.visualstudio.microsoft.com/download/pr/c39e684e-f804-4e5d-b2ca-eaf4ac49d7b3/fb155e336f2a2bea7efbb3161822296e/windowsdesktop-runtime-3.1.13-win-x86.exe'
  checksum       = '987cc4c2878228e95c89462c1dea53793dc9dccea5cfc7db4520a676a291a6cfcf1761b5dc15e5ac36d962d3c7c73fcd4c1ec9a54de023bf31066767a4056128'
  checksumType   = 'sha512'

  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/aa717f57-3ae5-48fa-a3ab-0018338d0726/fb37276b1575772461701339110e7a54/windowsdesktop-runtime-3.1.13-win-x64.exe'
  checksum64     = '4a5cdbdb851cf94130dfbe5429aeec2471e0621c9f79c57ce57655c15854c5afce18fd0b8224c7e65afb98eccc8cf8881b021c3f7eb6dd05d0463225c15abb18'
  checksumType64 = 'sha512'

  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET Core Desktop Runtime v3.1.13'
}

Install-ChocolateyPackage @packageArgs
