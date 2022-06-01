$packageName = 'windows-sdk-11-version-22H2-all'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/f/6/7/f673df4b-4df9-4e1c-b6ce-2e6b4236c802/windowssdk/winsdksetup.exe'
# certUtil -hashfile file sha256
$checksum = '6c489de4a7ff206bdb15e97fedc397aa01da570bf83c3049aaf755d9376237c2'
$checksumType = 'sha256'
$silentArgs = "/Features + /Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes
