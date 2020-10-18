$packageArgs = @{
  packageName    = 'dotnetcore3-desktop-runtime'
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/1419cd1f-64ac-44c7-bfe0-937fd5e5f39a/e72ec98df78dfbb3a5bbf35b66cb7c15/windowsdesktop-runtime-3.1.9-win-x86.exe'
  checksum       = '9936845c7c9c0d9e8fc961ee718c8df224fa17047836afe1ee370eb43dea3089b234d7b7c17c08e22bb68691dfad09476b61a154c24e4205db92692ef8ce0a86'
  checksumType   = 'sha512'
  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/6a3a8a8b-4aaa-4d3f-bce6-b512f2ef5a2c/e6963fbe57cdd8258a9f0997cc3a6669/windowsdesktop-runtime-3.1.9-win-x64.exe'
  checksum64     = '78c7c8bf4994fbc657d15b4799f4c9313f175a4582764e6abe758a43134b69d9c6af31e4b5e7f71a36a1c6ca617079e79b9136474af92fec202c0d68c30ea501'
  checksumType64 = 'sha512'
  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET Core Desktop Runtime 3.1.9'
}

Install-ChocolateyPackage @packageArgs
