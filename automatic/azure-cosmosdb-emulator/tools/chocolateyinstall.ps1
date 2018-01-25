
$ErrorActionPreference = 'Stop';

$packageName= 'azure-cosmosdb-emulator'
$softwareName = 'Azure Cosmos DB Emulator'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://documentdbportalstorage.blob.core.windows.net/emulator/11.11.2017/Azure%20Cosmos%20DB.Emulator.msi'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url
  softwareName  = $softwareName 
  checksum      = '811fd4b463c19ad8629277002d3e05c9b3fe524f282025e4e0764214929a72a1'
  checksumType  = 'sha256'

  #MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

if(! (test-path "${Env:ProgramFiles}\Azure Cosmos DB Emulator\CosmosDB.Emulator.exe")){
  Install-ChocolateyPackage @packageArgs
}
