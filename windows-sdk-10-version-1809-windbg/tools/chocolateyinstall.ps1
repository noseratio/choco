$packageName = 'windows-sdk-10-version-1809-windbg'
$installerType = 'EXE'
$url = 'https://download.microsoft.com/download/5/C/3/5C3770A3-12B4-4DB4-BAE7-99C624EB32AD/windowssdk/winsdksetup.exe'
$checksum = 'bbd1c41f9ebf518e4482c5c85a0de9ad7a72b596112c392911ef6054cb5d70d7'
$checksumType = 'sha256'
$silentArgs = "/Features OptionId.WindowsDesktopDebuggers /Quiet /NoRestart /Log ""$env:temp\${packageName}_$([Guid]::NewGuid().ToString('D')).log"""
$validExitCodes = @(0,3010)

$posParams = @(
  $packageName,
  $installerType,
  $silentArgs,
  $url)

$parms = @{
  'checksum' = $checksum;
  'checksumType' = $checksumType;
  'validExitCodes' = $validExitCodes}

Install-ChocolateyPackage @posParams @parms
