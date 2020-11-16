$packageArgs = @{
  packageName    = 'dotnetcore3-desktop-runtime'
  fileType       = 'exe'

  url            = 'https://download.visualstudio.microsoft.com/download/pr/865d0be5-16e2-4b3d-a990-f4c45acd280c/ec867d0a4793c0b180bae85bc3a4f329/windowsdesktop-runtime-3.1.10-win-x86.exe'
  checksum       = '1697e69644a1df46922e440c1ea16e583660f79f3b9b109b493a24835ae543ea6180c5167d6dbe89d8dd8991f865dba717525e333e4a2f3231973afa6a320b5'
  checksumType   = 'sha512'

  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/513acf37-8da2-497d-bdaa-84d6e33c1fee/eb7b010350df712c752f4ec4b615f89d/windowsdesktop-runtime-3.1.10-win-x64.exe'
  checksum64     = '14a7d97fb258bee024cff3585492ed43c3ec6ac823b50980ddde8241a8bca3e578c38ca28e461630d38c180bd72323e1fcb0ee2e6e65ef9bfc8481df7beef142'
  checksumType64 = 'sha512'

  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET Core Desktop Runtime v3.1.10'
}

Install-ChocolateyPackage @packageArgs
