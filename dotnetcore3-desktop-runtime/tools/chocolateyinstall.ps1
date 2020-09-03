$packageArgs = @{
  packageName    = 'dotnetcore3-desktop-runtime'
  fileType       = 'exe'
  url            = 'https://download.visualstudio.microsoft.com/download/pr/3e6c8a13-9d89-4991-b683-b6bb279bc096/d1c44ba0c34f2be8878c36d27287e1a5/windowsdesktop-runtime-3.1.7-win-x86.exe'
  checksum       = '5ad80c4e51a80bb5e4db0885623811b8d3e7cedacd6e470c6419f0d6fbd8ffef'
  checksumType   = 'sha256'
  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/5e4695fb-da51-4fa8-a090-07a64480888c/65aa842670d2280b5d05b8a070a9f495/windowsdesktop-runtime-3.1.7-win-x64.exe'
  checksum64     = 'D922F5E58FB04DD5C9FECE9FAABA215726E7F987B13B3D17E8F8A0CA35F70799'
  checksumType64 = 'sha256'
  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET Core Desktop Runtime 3.1.7'
}

Install-ChocolateyPackage @packageArgs
