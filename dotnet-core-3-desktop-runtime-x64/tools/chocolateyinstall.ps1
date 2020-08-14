$packageName = 'dotnet-core-3-desktop-runtime-x64'
$installerType = 'EXE'
$url = 'https://download.visualstudio.microsoft.com/download/pr/5e4695fb-da51-4fa8-a090-07a64480888c/65aa842670d2280b5d05b8a070a9f495/windowsdesktop-runtime-3.1.7-win-x64.exe'
$checksum = 'D922F5E58FB04DD5C9FECE9FAABA215726E7F987B13B3D17E8F8A0CA35F70799'
$checksumType = 'sha256'
$silentArgs = "/install /quiet /norestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)
Install-ChocolateyPackage $packageName $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType -validExitCodes $validExitCodes
