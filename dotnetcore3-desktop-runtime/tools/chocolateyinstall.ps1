$packageArgs = @{
  packageName    = 'dotnetcore3-desktop-runtime'
  fileType       = 'exe'

  url            = 'https://download.visualstudio.microsoft.com/download/pr/8b11972e-ded9-4d3c-9714-7c7ef047cca6/76dbe20bc03e69f5c0d005452ba88a9d/windowsdesktop-runtime-3.1.15-win-x86.exe'
  checksum       = '9c82435f964cf70951b20b3efe473264de57fc6b9de1e60ef289efa389a88d4906db1d19be101e55f6b66fc3657b125a2ec5a605f9e37c7be7ed2b50c1b4767e'
  checksumType   = 'sha512'

  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/d30352fe-d4f3-4203-91b9-01a3b66a802e/bb416e6573fa278fec92113abefc58b3/windowsdesktop-runtime-3.1.15-win-x64.exe'
  checksum64     = '86a3758e389d872882407fa7000d319499b9dc0ae9608ac08ef73cab89d9b7fa60f8a385e57fc2ff9a90003897caec337f7e6c9144ea5cba712aea40fd0f42f6'
  checksumType64 = 'sha512'

  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET Core Desktop Runtime v3.1.15'
}

Install-ChocolateyPackage @packageArgs
