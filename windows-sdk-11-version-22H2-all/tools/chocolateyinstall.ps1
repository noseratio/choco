$packageName = 'windows-sdk-11-version-22H2-all'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/7/9/6/7962e9ce-cd69-4574-978c-1202654bd729/windowssdk/winsdksetup.exe'
# certUtil -hashfile file sha256
# or: pwsh -c Get-FileHash file
$checksum = '73FE3CC0E50D946D0C0A83A1424111E60DEE23F0803E305A8974A963B58290C0'
$checksumType = 'sha256'
$silentArgs = "/Features + /Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes
