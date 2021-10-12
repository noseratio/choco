$packageName = 'windows-sdk-11-version-21H2-all'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/d/8/f/d8ff148b-450c-40b3-aeed-2a3944e66bbd/windowssdk/winsdksetup.exe'
$checksum = '4D73DDC82CAA1CBE82DFFDC24B7CEF368919E077BAD984357D447568FEAB1F5F'
$checksumType = 'sha256'
$silentArgs = "/Features + /Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes
