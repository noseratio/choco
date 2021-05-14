$packageArgs = @{
  packageName    = 'dotnet5-desktop-runtime'
  fileType       = 'exe'

  url            = 'https://download.visualstudio.microsoft.com/download/pr/315854e8-6857-4d0d-b7e0-57761e3f7d12/b31193ac2c9f1674b66cf7a65c2521de/windowsdesktop-runtime-5.0.6-win-x86.exe'
  checksum       = '83ceb900805a33763df0a16e81f3f3d2a4b576802b335975177d77953bf9f0db60d36f257b2e018fe44440df2b8f8a8c44e767939bd9e4ff21230eb32f34db66'
  checksumType   = 'sha512'

  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/6279dc90-f437-4481-82a5-73dd9f97da06/6519ef44735fd31115b9b1a81d6ff1e8/windowsdesktop-runtime-5.0.6-win-x64.exe'
  checksum64     = '34b0d43e03b5aaeb987bbc9d6d6ee95b79d97587fecf39d8b8b653618cec4d8741c8d31c270662a0c8b59a18344be2a44b7c38e525505270b264d7dcc856761c'
  checksumType64 = 'sha512'

  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET 5 Desktop Runtime v5.0.6'
}

Install-ChocolateyPackage @packageArgs
