Write-Host "Extracting subtitles from files."

$files = Get-ChildItem -Path "Videos\" | Where-Object { $_.PSIsContainer -eq $false -and $_.Extension -eq ".mkv" }

foreach ($file in $files) {
    $subtitleFileName = $file.BaseName + '.ssa'
    # ffmpeg.exe -i "Videos\$file" -map 0:s:1 "Output\$subtitleFileName"
    Write-Host $subtitleFileName
}