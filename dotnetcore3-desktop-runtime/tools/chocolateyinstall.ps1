$packageArgs = @{
  packageName    = 'dotnetcore3-desktop-runtime'
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/712f4ec2-79a4-4897-af5b-6c814dd49741/2025ef17bfc218cce1699787352d84b8/windowsdesktop-runtime-3.1.8-win-x86.exe'
  checksum       = '18a2eec0a5ea7cf84b5db5a1d2d41dd902ef8b0008cf225e0fef24b39f27d6dc'
  checksumType   = 'sha256'
  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/add2ffbe-a288-4d47-8b09-a39c8645f505/8516700dd5bd85fe07e8010e55d8f653/windowsdesktop-runtime-3.1.8-win-x64.exe'
  checksum64     = '112da330a41c6b53f4255d387b44f4d402133ed401be8c8f5eeda2617b76137a'
  checksumType64 = 'sha256'
  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET Core Desktop Runtime 3.1.8'
}

Install-ChocolateyPackage @packageArgs
