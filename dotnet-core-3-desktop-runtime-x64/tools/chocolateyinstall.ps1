$packageName = 'dotnet-core-3-desktop-runtime-x64'
$installerType = 'EXE'
$url = 'https://download.visualstudio.microsoft.com/download/pr/3eb7efa1-96c6-4e97-bb9f-563ecf595f8a/7efd9c1cdd74df8fb0a34c288138a84f/windowsdesktop-runtime-3.1.6-win-x64.exe'
$checksum = '75F80882ADE213B5D75AB4E003CFEAAFE93D4F377A5D7A76077BB82728BCBA58'
$checksumType = 'sha256'
$silentArgs = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes
