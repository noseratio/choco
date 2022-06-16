$packageName = 'windows-sdk-10-version-2104-all'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/9/7/9/97982c1d-d687-41be-9dd3-6d01e52ceb68/windowssdk/winsdksetup.exe'
$checksum = 'bc73435923977350ac92420a06c0d5a7db3a966ce66393c3218accc6b1b4076d'
$checksumType = 'sha256'
$silentArgs = "/Features + /Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes
