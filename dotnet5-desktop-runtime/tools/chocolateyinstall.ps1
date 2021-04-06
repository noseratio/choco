$packageArgs = @{
  packageName    = 'dotnet5-desktop-runtime'
  fileType       = 'exe'

  url            = 'https://download.visualstudio.microsoft.com/download/pr/0c5c56a4-8b34-4361-8af9-482c788b2bcf/d734b200547c8c367eb45ebbd69c4698/windowsdesktop-runtime-5.0.4-win-x86.exe'
  checksum       = 'f9dc79182c557751ad8590aa70fdf01e10b691d95910520e9323074ba6e3bae0df6dc60c084e01536e7b46b6617e4173300ad0d541d4ba6bc18b42f54bf0a051'
  checksumType   = 'sha512'

  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/7a5d15ae-0487-428d-8262-2824279ccc00/6a10ce9e632bce818ce6698d9e9faf39/windowsdesktop-runtime-5.0.4-win-x64.exe'
  checksum64     = '69fcbe5458869246cbd0657764ec3fdbfd59f06a49808cb283a7c90271409b0266539d31cec9047c512f167cae8e2992b617b68bc9f93e4815a37a8f50524d3f'
  checksumType64 = 'sha512'

  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET 5 Desktop Runtime v5.0.4'
}

Install-ChocolateyPackage @packageArgs
