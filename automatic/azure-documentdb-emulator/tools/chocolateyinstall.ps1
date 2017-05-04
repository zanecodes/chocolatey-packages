
$ErrorActionPreference = 'Stop';

$packageName= 'azure-documentdb-emulator'
$softwareName = 'Azure DocumentDB Emulator'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://aka.ms/documentdb-emulator'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url
  softwareName  = $softwareName 
  checksum      = 'C6D760F573CA52D1791DDCA3C00CF93B'
  checksumType  = 'md5'

  #MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

if(! (test-path "${Env:ProgramFiles}\DocumentDB Emulator\DocumentDB.Emulator.exe")){
  Install-ChocolateyPackage @packageArgs
}
