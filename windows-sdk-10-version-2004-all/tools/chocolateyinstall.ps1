$packageName = 'windows-sdk-10-version-2004-all'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/4/d/2/4d2b7011-606a-467e-99b4-99550bf24ffc/windowssdk/winsdksetup.exe'
$checksum = '42d2774274d1135fc598c180c2acbf2321eb4192f59e511e6ac7772870bf6de1'
$checksumType = 'sha256'
$silentArgs = "/Features + /Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes
