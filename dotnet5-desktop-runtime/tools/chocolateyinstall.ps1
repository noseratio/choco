$packageArgs = @{
  packageName    = 'dotnet5-desktop-runtime'
  fileType       = 'exe'

  url            = 'https://download.visualstudio.microsoft.com/download/pr/b2780d75-e54a-448a-95fc-da9721b2b4c2/62310a9e9f0ba7b18741944cbae9f592/windowsdesktop-runtime-5.0.0-win-x86.exe'
  checksum       = '144df140b56aa76b4bbc6259288d832df36935325c90af4cb9c28027f8625bdddd8369b03787d78e7a0502597ed809fbd20411549b4b93b127e88ce94b36e27'
  checksumType   = 'sha512'

  url64bit       = 'https://download.visualstudio.microsoft.com/download/pr/1b3a8899-127a-4465-a3c2-7ce5e4feb07b/1e153ad470768baa40ed3f57e6e7a9d8/windowsdesktop-runtime-5.0.0-win-x64.exe'
  checksum64     = '243986604ea7ec1332960536e6a534b7755d2bf29a585ca7e5bcd60570ab72c0f8ace0755b0e1a0a5972dc77c28bb3a5f152f8ed84d2acb2fa76c22916ac4376'
  checksumType64 = 'sha512'

  silentArgs     = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
  validExitCodes = @(0,3010)
  softwareName   = '.NET 5 Desktop Runtime v5.0.0'
}

Install-ChocolateyPackage @packageArgs
