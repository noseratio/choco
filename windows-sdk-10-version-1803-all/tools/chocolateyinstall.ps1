$packageName = 'windows-sdk-10-version-1803-all'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/5/A/0/5A08CEF4-3EC9-494A-9578-AB687E716C12/windowssdk/winsdksetup.exe'
$checksum = '93C9DCA3A9F28061A601F3E6B737DEDE40C2C77CFD200ED5CB6EFE2AB0C9D5CC'
$checksumType = 'sha256'
$silentArgs = "/Features + /Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes
