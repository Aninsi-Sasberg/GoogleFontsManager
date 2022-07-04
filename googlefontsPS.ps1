$path = $env:USERPROFILE+"\Desktop\GoogleFonts\git"
$pathgit = $env:USERPROFILE+"\Desktop\GoogleFonts\git\.git"
$pathto = $env:USERPROFILE+"\Desktop\GoogleFonts\ALLGoogleFonts"

if (!(Test-Path $env:USERPROFILE"\Desktop\GoogleFonts\" )){
    git clone https://github.com/google/fonts $path
    Set-Location $pathgit
    git remote add fonts https://github.com/google/fonts
}
else{
    Set-Location $pathgit
    git fetch fonts
}

if (!(Test-Path $pathto)){
    New-Item -itemType Directory -Path $pathto
}
else{
}

if (!(Test-Path $path)){
    New-Item -itemType Directory -Path $path
}
else{
}

Get-ChildItem -Path $path -Filter *.ttf -Recurse | ForEach-Object { Copy-Item -Path $_.FullName -Destination $pathto -Force }
Set-Location $pathto
Invoke-Item -Path .
